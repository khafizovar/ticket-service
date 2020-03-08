import {Component, NgZone, OnChanges, OnInit, SimpleChanges, ViewChild} from '@angular/core';
import {WindowState} from '@progress/kendo-angular-dialog';
import {Subject} from 'rxjs';
import {UserloginService} from './services/userlogin.service';
import {DatePipe} from '@angular/common';
import {consoleTestResultHandler} from 'tslint/lib/test';
import {FormGroup, FormsModule, Validators} from '@angular/forms';
import {EventsService} from "./services/events.service";
import {MainPageComponent} from "./components/main-page/main-page.component";
import {ActivatedRoute, Router} from "@angular/router";

// отрисовка зала
export interface ColorRowPlace {
  idTicket?: number;
  groundColor: string[];
  fontColor: string[];
  flag?: string[]; // blocked, free, sales???
}

export interface SchemeString {
  rowStart: number;
  rowCount: number;
  placeCount: number;
}

export interface TableHallStruct {
  rowStart: number;
  placeAllNum: number;
  rowAllNum: number;
  rowAllNumClick: string[];
  placeAllNumClick: string[];
}

export interface UserCard {
  cardId: number;
  cardNumber: number;
  cardMonth: string;
  cartYear: number;
  cartUserName: string;
  cardCVS: string;
}

export interface User {
  userId: number;
  userLogin: string;
  userPassword: string;
  userConfirmPassword: string;
  userCitySelect: any;
  userFirstName: string;
  userLastName: string;
  userMiddleName: string;
  userPhoneNumber: string;
}

export interface City {
  id: number;
  city: string;
  timeZone: string;
}

export interface Activity {
  id: number;
  title: string;
  type: string;
  activityLoc: ActivityLocation;
  poster: Poster;
};

export interface ActivityLocation {
  id: number;
  locationLoc: LocationEntity;
  halls: Halls;
};

export interface LocationEntity {
  id: number;
  titlePlace: string;
  city: City;
  street: string;
  houseNumber: string;
  longitude: number;
  latitude: number;
}

export interface Poster {
  id: number;
  poster: any;
};

export interface Halls {
  id: number;
  numHalls: number;
  ticketsCount: number;
  scheme: string;
};

export interface UserEntity {
  id: number;
  firstName: string;
  lastName: string;
  middleName: string;
  password: string;
  email: string;
  phone: string;
  city: City;
}

export interface UserActivity {
  id: number;
  activity: Activity;
  ticket: TicketsEntity;
}

export interface Ticket {
  ticketId: number;
  ticketLocation: string;
  eventDate: string;
  row?: number;
  place?: number;
  sign_num?: any;
  ticketStatus: any;
}

export interface TicketsEntity {
  id: number;
  actDateHallsId: number;
  rowNum: number;
  placeNum: number;
  signNum: number;
  ticketStatus: any;
  activityDateHallsDto: ActivityDateHallsEntity;
  usersActivitiesById: any;
}

export interface TicketStatusEnum {
  id: number;
  name: string;
}

export interface ActivityDateHallsEntity {
  id: number;
  activityDate: DatePipe;
  hallsId: number;
  activityId: number;
  hallsByHallsId: HallsEntity;
  activityByActivityId: ActivityEntity;
}

export interface HallsEntity {
  id: number;
  number: number
  ticketsCount: number;
  scheme: string;
}

export interface ActivityEntity {
  id: number;
  title: string;
  activityTypeByTypeId: ActivityTypeEntity;
  locationByLocationId: LocationByLocationEntity;
  postersByPosterId: PostersEntity;
}

export interface ActivityTypeEntity {
  id: number;
  activityType: string;
}

export interface LocationByLocationEntity {
  id: number;
  titlePlace: string;
  cityId: number;
  street: string;
  houseNumber: string;
  longitude: number;
  latitude: number;
  cityByCityId: City;
}

export interface PostersEntity {
  id: number;
  poster: string;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  public title = 'tickets-service';
  public selectedCity = 'Москва';
  public titlePerson = '';
  //Признак авторизован ли пользователь
  public isAuthorized: boolean = false;
  public titleAuthorized = 'Войти';
  //Признак открытия citySelector
  public citySelectorOpened: boolean = false;
  public citySelectorWindowState: WindowState = 'maximized';
  public citySelectorSubject: Subject<void> = new Subject<void>();
  //Признак открытия login
  public loginSelectorOpened: boolean = false;
  public loginSelectorWindowState: WindowState = 'maximized';
  public loginSelectorSubject: Subject<void> = new Subject<void>();
  //Признак открытия profile
  public profileSelectorOpened: boolean = false;
  public profileSelectorWindowState: WindowState = 'maximized';
  public profileSelectorSubject: Subject<void> = new Subject<void>();
  //Признак открытия личного кабинета
  public personalSelectorOpened: boolean = false;
  public personalSelectorWindowState: WindowState = 'maximized';
  public personalSelectorSubject: Subject<void> = new Subject<void>();


  public activitySelectorOpened: boolean = false;

  // информация по нашему юзеру
  public user: User;
  ticketUserSelectorOpened:boolean = false;


  public nameTitle: string='';
  constructor(public userloginService: UserloginService,public eventsService:EventsService,private route: ActivatedRoute,
              private router: Router ) {
  }

  //-----------------ЗАЛ HALLS ------------------------------------------
  testHallSelectorOpened = false;

  /**
   * Вызывает окно выбора города
   * @param event
   */
  showCitySelector(event: Event) {
    this.citySelectorOpened = true;
    event.preventDefault();
  }

  /**
   * Метод обработки события выбора города
   * @param city
   */
  citySelected(city: string) {
    this.citySelectorOpened = false;
    this.selectedCity = city;
    console.log(this.selectedCity);
    this.eventsService.setCurrentCity(this.selectedCity);
    this.userloginService.setCurrentCity(this.selectedCity);
  }

  /**
   * работа с окном профиля
   */

  profileSelectedUser(user: User) {
    this.user = user;
    this.isAuthorized = true;
    this.titleAuthorized = 'Выйти';
    if (this.selectedCity)
      this.selectedCity = user.userCitySelect.city;
    this.titlePerson = user.userLogin;
    this.profileSelectorOpened = false;
  }

  profileClosed($event: any) {
    this.profileSelectorOpened = false;
  }


  activitySelected(nameTitle: string) {
    this.nameTitle = nameTitle;
    console.log(this.nameTitle);
    this.eventsService.setCurrentCity(this.selectedCity);
    this.eventsService.title=nameTitle;
    this.activitySelectorOpened=true;
   //this.router.navigate(['/activity'], { queryParams: { page: this.nameTitle,city:this.selectedCity } });
    this.nameTitle = '';
  }
  activityClosed($event: any){
    this.activitySelectorOpened=false;

  }

  /**
   * Вызывает окно login
   * @param event
   */
  showLoginSelector(event: Event) {
    if (!this.isAuthorized) {
      this.loginSelectorOpened = true;
      event.preventDefault();
    } else {
      this.isAuthorized = false;
      this.titleAuthorized = 'Войти';
    }
  }

  loginSelected(city: string) {
    this.loginSelectorOpened = false;
    this.profileSelectorOpened = true;
  }

  loginSelectedUser(user: User) {
    console.log('user selected');
    this.user = user;
    this.isAuthorized = true;
    this.titleAuthorized = 'Выйти';
    if (user.userCitySelect !== undefined || user.userCitySelect !== null) {
      this.selectedCity = user.userCitySelect.city;
    }
    this.loginSelectorOpened = false;
    this.titlePerson = user.userLogin;
  }

  loginClosed($event: any) {
    this.loginSelectorOpened = false;
  }

  /**
   * работа с личным кабинетом
   * @param user
   */

  showPersonalSelector(event: Event) {
    this.personalSelectorOpened = true;
    event.preventDefault();
  }

  personalSelectedUser(user: User) {
    this.user = user;
    this.selectedCity = user.userCitySelect;
  }

  personalClosed($event: any) {
    this.personalSelectorOpened = false;
  }

  /**
   * работа с билетом юзера (pdf и т.д.)
   */
  showTicketsUserSelector(event: Event) {
    this.ticketUserSelectorOpened = true;
    event.preventDefault();
  }

  ticketUserClosed($event: any) {
    this.ticketUserSelectorOpened = false;
  }

  /**
   * другое
   */

  ngOnInit() {
    this.isAuthorized = false;
    this.titleAuthorized = 'Войти';
    console.log("app="+this.selectedCity);
  }

  //------------------------------------------------------- ЗАЛ HALLS-----------------------------------------------
  testHallClosed($event: any) {
    this.testHallSelectorOpened = false;
  }

  showTestHallSelector(event: Event) {
    this.testHallSelectorOpened = true;
    event.preventDefault();
  }
}
