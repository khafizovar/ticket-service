import {Injectable} from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {City, Ticket, User, UserCard, UserEntity} from '../app.component';
import {Observable} from 'rxjs';
import {AppConfig} from '../../config';

@Injectable({
  providedIn: 'root'
})
export class UserloginService {
  public imgSrc = 'http://localhost:4200/assets/imgs/';

  public currentCity = 'Москва';
  public currentCityId = 1;
  public currentTimeZone = 'en-US';
  public cityList: City[];
  public user: User;
  public userEntity: UserEntity;
  public error = '';

  constructor(private httpClient: HttpClient) {
    this.cityList = this.getListCity();
  }

  // работа с городами
  public getCurrentCity(): string {
    return this.currentCity;
  }

  public getCurrentCityTime(): string {
    return this.currentTimeZone;
  }

  public getCurrentCityId(): number {
    return this.currentCityId;
  }

  public setCurrentCity(currentCity: string) {
    this.currentCity = currentCity;
  }

  public setCurrentCityTime(currentTimeZone: string) {
    this.currentTimeZone = currentTimeZone;
  }

  // возвращает список городов
  public getListCity(): City[] {

    this.httpClient.get<City[]>(AppConfig.API_ENDPOINT + '/city')
      .subscribe(cityList => {
        this.cityList = cityList;
        console.log('cityList =', cityList);
      }, error => {
        console.log('ERROR getListCity', error.message);
        this.error = error.message;
      });
    return this.cityList;
  }

  // возвращает map городов
  public getCityMap(): Map<number, string> {
    const citiesMap = new Map<number, string>();

    for (const entry of this.cityList) {
      citiesMap.set(entry.id, entry.city);
    }
    return citiesMap;
  }

  // возвращает номер города
  public getCityId(name: string): number {
    let cnt = 1;

    for (const entry of this.cityList) {
      if (entry.city === name) {
        cnt = entry.id;
        break;
      }
    }
    return cnt;
  }

  // возвращает localID города
  public getCityTimeZoneId(name: string): string {
    let timeZone = '';

    for (const entry of this.cityList) {
      if (entry.city === name) {
        timeZone = entry.timeZone;
        break;
      }
    }
    return timeZone;
  }

  // возвращает список городов
  public getCityList(): Array<string> {
    const citiesList: Array<string> = new Array<string>();

    for (const entry of this.cityList) {
      citiesList.push(entry.city);
    }
    return citiesList;
  }

  // работа с юзером --------------------
  // найти пользователя по логину и паролю
  public getFindUser(userLogin: string, userPassword: string): Observable<UserEntity> {
    const params = new HttpParams().set('email', userLogin)
      .set('password', userPassword);

    return this.httpClient.get<UserEntity>(AppConfig.API_ENDPOINT + '/user', {params})
      .pipe((response: any) => {
        return response;
      });
  }

  //
  public findUser(userLogin: string, userPassword: string): Observable<User> {

    const fUser: Observable<User> = new Observable<User>(obs => {
      this.getFindUser(userLogin, userPassword).subscribe((resp) => {

        console.log('Response ... userLoginPassword', resp);

        const user: User = {
          userId: resp.id,
          userLogin,
          userPassword,
          userConfirmPassword: userPassword,
          userCitySelect: resp.city.city,
          userFirstName: resp.firstName,
          userLastName: resp.lastName,
          userMiddleName: resp.middleName,
          userPhoneNumber: resp.phone
        };

        this.currentCity = user.userCitySelect;
        this.currentCityId = this.getCityId(this.currentCity);
        this.currentTimeZone = this.getCityTimeZoneId(this.currentCity);
        this.user = user; //

        obs.next(user);
        obs.complete();
      });
    });
    return fUser;
  }

  public updateUser(userId: number, userLogin: string, userPassword: string, userConfirmPassword: string, userCitySelect: string,
                    userFirstName: string, userLastName: string, userMiddleName: string, userPhoneNumber: string) {
    // обновить пользователя по id
    const user: User = {
      userId,
      userLogin,
      userPassword,
      userConfirmPassword,
      userCitySelect,
      userFirstName,
      userLastName,
      userMiddleName,
      userPhoneNumber
    };
    this.user = user;
  }

  public getCurrentUser(): User {
    return this.user;
  }

  public setCurrentUser(user: User) {
    this.user = user;
  }

}
