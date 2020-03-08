import {Component, EventEmitter, OnInit, Output} from '@angular/core';
import {UserloginService} from '../../services/userlogin.service';
import {City, User, UserEntity} from '../../app.component';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {AppConfig} from '../../../config';
import {HttpClient} from '@angular/common/http';
import {InnerSubscriber} from 'rxjs/internal-compatibility';
import {Subscription} from 'rxjs';
import {AuthService} from '../../services/auth.service';
import {TokenStorageService} from '../../services/token-storage.service';
import {SignUpInfo} from '../../auth/sigup-info';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})

export class ProfileComponent implements OnInit {
  @Output() profileSelectedUser: EventEmitter<User> = new EventEmitter<User>();
  @Output() profileCloseEvent: EventEmitter<any> = new EventEmitter<any>();

  private subscription: Subscription;

  ProfileTitle = 'Регистрация';
  ProfileBtn = 'Регистрация';

  public error = '';

  form: FormGroup;

  public user: User;
  public userEntity: UserEntity;
  public city: City;

  public currentCity = 'Москва';
  public currentCityId = 1;
  public currentTimeZone = 'en-US';

  public source: Array<string>;
  public data: Array<string>;
  // public source: IterableIterator<number>;
  // public data: IterableIterator<string>;

  constructor(public userloginService: UserloginService,
              private httpClient: HttpClient,
              private authService: AuthService,
              private tokenStorage: TokenStorageService) {
    this.data = this.userloginService.getCityList();
    this.source = this.userloginService.getCityList();
    this.currentCity = this.userloginService.getCurrentCity();
    this.currentTimeZone = this.userloginService.getCurrentCityTime();
    console.log('constructor profile city', this.userloginService.currentCity);
    // this.data = this.userloginService.getCityMap().values();
    // this.source = this.userloginService.getCityMap().keys();
  }

  public valueChange(value: any): void {
    this.currentCity = value;
    console.log('valueChange', value);
  }

  public selectionChange(value: any): void {
    console.log('valueChange', value);
    this.userloginService.setCurrentCity(value);
  }

  public filterChange(filter: any): void {
    console.log('filterChange');
  }

  public open(): void {
    console.log('open');
  }

  public close(): void {
    console.log('close');
  }

  onClose($event: MouseEvent) {
    this.profileCloseEvent.emit($event);
  }

  // Обновляем юзера
  setUserFromUserEntity() {
    this.currentCity = this.userEntity.city.city;
    this.currentCityId = this.userloginService.getCityId(this.currentCity);
    this.currentTimeZone = this.userloginService.getCityTimeZoneId(this.currentCity);

    this.user.userId = this.userEntity.id;
    this.user.userLogin = this.userEntity.email;
    this.user.userFirstName = this.userEntity.firstName;
    this.user.userLastName = this.userEntity.lastName;
    this.user.userMiddleName = this.userEntity.middleName;
    this.user.userPassword = this.userEntity.password;
    this.user.userPhoneNumber = this.userEntity.phone;
    this.user.userCitySelect = this.userEntity.city.city;
  }

  // добавляет юзера
  public insertUser(userEntity: UserEntity) {
    console.log('insertUser');

    const us: SignUpInfo = {
      username: userEntity.firstName + ' ' + userEntity.middleName + ' ' + userEntity.lastName,
      email: userEntity.email,
      password: userEntity.password,
      city: (userEntity.city) ? userEntity.city : null,
      phone: (userEntity.phone) ? userEntity.phone : null,
    };
    this.authService.register(us).subscribe(
      value => {
        console.log(value);
        this.authService.login(us).subscribe(data => {

          this.tokenStorage.saveToken(data.accessToken);
          this.tokenStorage.saveUsername(data.username);
          this.tokenStorage.saveAuthorities(data.roles);

          this.user = {
            userCitySelect: data.user.city,
            userConfirmPassword: '',
            userFirstName: data.user.firstName,
            userId: data.user.id,
            userLastName: data.user.lastName,
            userLogin: data.user.firstName + ' ' + data.user.middleName,
            userMiddleName: data.user.middleName,
            userPassword:  data.user.password,
            userPhoneNumber: data.user.phone
          };

          this.userloginService.setCurrentUser(this.user);
          this.profileSelectedUser.emit(this.user);
        }, error => {
          console.log(error);
        });
      },
      error1 => {
        if (error1.error && error1.error.message) {
          alert(error1.error.message);
        } else {
          alert('Ошибка регистрации пользователя');
        }
        console.log(error1);
      }
    );

  }

  onClickEnter() {
    console.log('onClickEnter');
    if (this.form.valid) {
      console.log('this.form.valid');

      const city: City = {
        id: this.currentCityId,
        city: this.currentCity,
        timeZone: this.currentTimeZone
      };

      const userEntity: UserEntity = {
        id: 0,
        firstName: this.form.get('userFirstName').value.toString(),
        lastName: this.form.get('userLastName').value.toString(),
        middleName: this.form.get('userMiddleName').value.toString(),
        password: this.form.get('userPassword').value.toString(),
        email: this.form.get('userLogin').value.toString(),
        phone: this.form.get('userPhoneNumber').value.toString(),
        city: city
      };

      this.userEntity = userEntity;
      this.insertUser(this.userEntity);
      // this.profileSelectedUser.emit(this.user);
    }
    //this.profileSelectedUser.emit(this.user);
  }

  ngOnInit() {
    console.log('ngOnInit');
    // валидация элементов формы
    this.form = new FormGroup({
      userLogin: new FormControl('', [
        Validators.required,
        Validators.email
      ]),
      userPassword: new FormControl(null, [
        Validators.required,
        Validators.minLength(6)
      ]),
      userConfirmPassword: new FormControl(null, [
        Validators.required,
        Validators.minLength(6)
      ]),
      userFirstName: new FormControl(''),
      userLastName: new FormControl(''),
      userMiddleName: new FormControl(''),
      userPhoneNumber: new FormControl('')
    });
  }

  ngOnDestroy(): void {
    if (this.subscription) {
      this.subscription.unsubscribe();
    }
  }

}
