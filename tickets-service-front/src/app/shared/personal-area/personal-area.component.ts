import {Component, EventEmitter, NgZone, OnInit, Output} from '@angular/core';
import {UserloginService} from '../../services/userlogin.service';
import {Activity, City, TicketsEntity, User, UserActivity, UserEntity} from '../../app.component';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {HttpClient, HttpHeaders, HttpParams} from "@angular/common/http";
import {AppConfig} from "../../../config";
import {DatePipe} from "@angular/common";
import {catchError, first, map} from "rxjs/operators";
import {Subscription, throwError} from "rxjs";
import {formatDate} from "@angular/common";
import {TicketUserService} from "../../services/ticket-user.service";

@Component({
  selector: 'app-personal-area',
  templateUrl: './personal-area.component.html',
  styleUrls: ['./personal-area.component.css']
})
export class PersonalAreaComponent implements OnInit {
  @Output() personalSelectedEvent: EventEmitter<User> = new EventEmitter<User>();
  @Output() personalCloseEvent: EventEmitter<any> = new EventEmitter<any>();

  public config = {headers: new Headers().set('Content-Type', 'application/json')};

  private subscription: Subscription;

  ProfileTitle = 'Редактирование профиля';
  ProfileBtn = 'Изменить';

  dialogDeleteOpened = false;
  ticketPDFOpened = false;
  payTicketOpened = false;

  public ticketCurrent: TicketsEntity;

  changeFlag = false;
  delFlag = 1;
  selFlag = 1;

  form: FormGroup;

  public error = '';

  public user: User;
  public userEntity: UserEntity;
  public city: City;

  public activity: Activity;
  public userActivity: UserActivity;

  public currentCity = 'Москва';
  public currentCityId = 1;
  public currentTimeZone = 'en-US';

  public source: Array<string>;
  public data: Array<string>;
  public listUserActivity: Array<TicketsEntity>;

  constructor(public userloginService: UserloginService, public ticketUserService: TicketUserService, private httpClient: HttpClient) {
    this.user = this.userloginService.getCurrentUser();
    this.data = this.userloginService.getCityList();
    this.source = this.userloginService.getCityList();
    this.currentCity = this.userloginService.getCurrentCity();
    this.currentCityId = this.userloginService.getCityId(this.currentCity);
    console.log('constructor user', this.user);
  }

  public valueChange(value: any): void {
    this.changeFlag = true;
    this.currentCity = value;
    this.currentCityId = this.userloginService.getCityId(value);
  }

  public selectionChange(value: any): void {
    this.changeFlag = true;
    this.userloginService.setCurrentCity(value);
    this.currentCity = value;
    this.currentCityId = this.userloginService.getCityId(value);
  }

  public filterChange(filter: any): void {
    this.changeFlag = true;
    this.data = this.source.filter((s) => s.toLowerCase().indexOf(filter.toLowerCase()) !== -1);
  }

  public open(): void {
    console.log('open');
  }

  public close(): void {
    console.log('close');
  }

  OnChange() {
    this.changeFlag = true;
  }

  // заполняем экземпляр UserEntity из формы
  setUserEntity() {
    const city: City = {
      id: this.currentCityId,
      city: this.currentCity,
      timeZone: this.currentTimeZone
    };

    const userEntity: UserEntity = {
      id: this.user.userId,
      firstName: this.form.get('userFirstName').value.toString(),
      lastName: this.form.get('userLastName').value.toString(),
      middleName: this.form.get('userMiddleName').value.toString(),
      password: this.form.get('userPassword').value.toString(),
      email: this.user.userLogin,
      phone: this.form.get('userPhoneNumber').value.toString(),
      city: city
    };
    this.ticketUserService.userCurrentEntity = userEntity;
    this.userEntity = userEntity;
  }

  // мапинг интерфейсов
  setUserFromUserEntity() {
    this.currentCity = this.userEntity.city.city;
    this.currentCityId = this.userloginService.getCityId(this.currentCity);

    this.user.userId = this.userEntity.id;
    this.user.userLogin = this.userEntity.email;
    this.user.userFirstName = this.userEntity.firstName;
    this.user.userLastName = this.userEntity.lastName;
    this.user.userMiddleName = this.userEntity.middleName;
    this.user.userPassword = this.userEntity.password;
    this.user.userPhoneNumber = this.userEntity.phone;
    this.user.userCitySelect = this.userEntity.city.city;
  }

  submit() {
    if (this.form.valid) {
      if (this.changeFlag) {
        this.setUserEntity();
        this.user = this.updateUser(this.userEntity);
      }
    }
    this.personalSelectedEvent.emit(this.user);
  }

  // Обновляем юзера
  public updateUser(userEntity: UserEntity): User {

    this.subscription = this.httpClient.post<UserEntity>(AppConfig.API_ENDPOINT + '/updateUser', userEntity) //console.log('JSON.stringify', JSON.stringify(userEntity));
      .subscribe(data => {
        this.userEntity = data;
        console.log('PUT Response', data);
      }, error => {
        console.log('ERROR PUT updateUser', error.message);
        this.error = error.message;
      });

    this.setUserFromUserEntity();
    return this.user;
  }

  // выбираем билеты по юзеру
  fetchListUserActivityTicket(userEntity: UserEntity) {
    const params = new HttpParams().set('userId', userEntity.id.toString());

    console.log('ticketsByUserId UserEntity = ', userEntity);
    this.subscription = this.httpClient.get<TicketsEntity[]>(AppConfig.API_ENDPOINT + '/ticketsByUserId', {params}) //console.log('JSON.stringify', JSON.stringify(userEntity));
      .subscribe(data => {
        console.log('GET Response list TicketsEntity for User', data);
        this.listUserActivity = data;
        this.ticketUserService.listUserActivity = data;
      }, error => {
        console.log('ERROR GET list TicketsEntity for User', error.message);
        this.error = error.message;
      });
  }

  onTabSelect($event: any) {
    console.log($event);
  }

  onClose($event: Event) {
    this.personalCloseEvent.emit($event);
  }

  ngOnInit() {
    // валидация элементов формы профиля
    this.form = new FormGroup({
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

    if (this.user) {
      this.form.setValue({
        userPassword: this.user.userPassword,
        userConfirmPassword: this.user.userConfirmPassword,
        userFirstName: this.user.userFirstName,
        userLastName: this.user.userLastName,
        userMiddleName: this.user.userMiddleName,
        userPhoneNumber: this.user.userPhoneNumber,
      });
    }

    // вкладка билетов
    this.setUserEntity();
    this.fetchListUserActivityTicket(this.userEntity);
  }

  printTicket(ticketEntity: TicketsEntity) {
    console.log('Print ticket =', ticketEntity);
    this.ticketCurrent = ticketEntity;
    this.ticketUserService.ticketCurrent = ticketEntity;
    this.ticketPDFOpened = true;
  }

  //  ---------------------------------------------- удаление билетов --------------------------------------------------
  statusBtnEvent($event: string) {
    let listIdTicket: Array<number> = [];
    this.dialogDeleteOpened = false;

    if ($event == 'yes') {
      if (this.delFlag == 1) {
        listIdTicket.push(this.ticketUserService.ticketCurrent.id);
      }

      if (this.delFlag == 2) {
        for (let i = 0; i < this.listUserActivity.length; i++) {
          let ticketCurrent = this.listUserActivity[i];
          if (ticketCurrent.ticketStatus == 'blocked') {
            listIdTicket.push(ticketCurrent.id);
          }
        }
      }
      console.log(listIdTicket);

      this.onDelTicketUser(listIdTicket, this.ticketUserService.userCurrentEntity.id);
    }
  }

  deleteTicket(ticketEntity: TicketsEntity) {
    this.ticketUserService.deleteStringQ = 'Вы действительно хотите удалить этот билет из числа бронированных?';
    this.ticketCurrent = ticketEntity;
    this.delFlag = 1;
    this.ticketUserService.ticketCurrent = ticketEntity;
    this.dialogDeleteOpened = true;
  }

  onClickDelAll(listUserActivity: Array<TicketsEntity>) {
    this.ticketUserService.deleteStringQ = 'Вы действительно хотите удалить все забронированные билеты?';
    this.delFlag = 2;
    this.dialogDeleteOpened = true;
  }

  onDelTicketUser(listIdTicket: Array<number>, userId: number) {
    this.subscription = this.httpClient.post<Array<TicketsEntity>>(AppConfig.API_ENDPOINT + '/delTicketsList/' + userId.toString(), listIdTicket)
      .subscribe(data => {
        this.ticketUserService.listUserActivity = data;
        this.listUserActivity = data;
        console.log('PA delete Ticket', data);
      }, error => {
        console.log('PA ERROR POST delete Ticket', error.message);
        this.error = error.message;
      });
  }

  // -------------------------------------------------------------------------------------------------------------------

  closePDFEvent($event: any) {
    this.ticketPDFOpened = false;
  }

  // -------------------------------------------------------- Оплата билетов -------------------------------------------

  onClickSales(userTicket: TicketsEntity) {
    this.selFlag = 1;
    this.ticketCurrent = userTicket;
    this.ticketUserService.ticketCurrent = userTicket;
    this.ticketUserService.userCurrent = this.userloginService.user;
    this.ticketUserService.paySumm = this.ticketCurrent.signNum;
    this.payTicketOpened = true;
  }

  onClickPayTickets(listUserActivity: Array<TicketsEntity>) {
    this.selFlag = 2;
    this.ticketUserService.userCurrent = this.user;
    console.log('userCurrent =', this.user);
    console.log('listUserActivity =', listUserActivity);
    let sum: number = 0;
    for (let i = 0; i < listUserActivity.length; i++) {
      let ticket = listUserActivity[i];
      console.log('ticketStatus =', ticket.ticketStatus, ticket);
      if (ticket.ticketStatus != 'sales') {
        sum = sum + ticket.signNum;
        console.log('sum =', sum);
      }
    }
    this.ticketUserService.paySumm = sum;
    this.payTicketOpened = true;
  }

  payTicketsClosed($event: any) {
    this.payTicketOpened = false;
  }

  statusSaleEvent($event: string) {
    let listIdTicket: Array<number> = [];
    this.payTicketOpened= false;

    if ($event == 'ok') {
      if (this.selFlag == 1) {
        listIdTicket.push(this.ticketUserService.ticketCurrent.id);
      }

      if (this.selFlag == 2) {
        for (let i = 0; i < this.listUserActivity.length; i++) {
          let ticketCurrent = this.listUserActivity[i];
          if (ticketCurrent.ticketStatus == 'blocked') {
            listIdTicket.push(ticketCurrent.id);
          }
        }
      }
      console.log('PAY listIdTicket=', listIdTicket);

      this.onSelTicketUser(listIdTicket, this.ticketUserService.userCurrentEntity.id);
    }

  }

  onSelTicketUser(listIdTicket: Array<number>, userId: number) {
    this.subscription = this.httpClient.post<Array<TicketsEntity>>(AppConfig.API_ENDPOINT + '/setTicketsStatusSale/' + userId.toString(), listIdTicket)
      .subscribe(data => {
        this.ticketUserService.listUserActivity = data;
        this.listUserActivity = data;
        console.log('PA sales Ticket', data);
      }, error => {
        console.log('PA ERROR POST sales Ticket', error.message);
        this.error = error.message;
      });
  }
  //--------------------------------------------------------------------------------------------------------------------

  ngOnDestroy(): void {
    console.log('ngOnDestroy personal-area.component');
    this.subscription.unsubscribe();
  }
}
