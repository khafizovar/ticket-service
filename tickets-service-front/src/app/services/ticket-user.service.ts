import {Injectable} from '@angular/core';
import {ActivityDateHallsEntity,  ActivityEntity,  ActivityTypeEntity,  Halls,  LocationByLocationEntity, PostersEntity,  TicketsEntity,  User,  UserEntity} from "../app.component";
import {HttpClient, HttpParams} from "@angular/common/http";
import {DatePipe} from "@angular/common";
import {AppConfig} from "../../config";
import {UserloginService} from "./userlogin.service";

@Injectable({
  providedIn: 'root'
})
export class TicketUserService {
  public ticketCurrent: TicketsEntity;
  public listUserActivity: Array<TicketsEntity> = [];

  public listHallsUserTicket: Array<TicketsEntity> = [];     // для определенного юзера и зала(!)
  public listHallsTicket: Array<TicketsEntity> = [];         // для определенного зала, все места

  public userCurrent: User;
  public userCurrentEntity: UserEntity;

  public activityDH: ActivityDateHallsEntity;
  public activityDHId: number;
  public hallid: number;
  public paySumm: number;
  public deleteStringQ = 'Вы действительно хотите удалить этот билет из числа бронированных?';

  public title:string;
  public halls: Halls;

  public loadingHalls = false;

  constructor(private userloginService: UserloginService, private httpClient: HttpClient) {

  }

  testOnLoadList() {
    this.loadingHalls = false;

    //---------------- тестовое занесение листов билетов -------------------------------------------------------
    console.log('testOnLoadList 1 GET Response this.hall.id=', this.halls.id.toString());
    console.log('testOnLoadList 1 GET Response this.activityDHId=', this.activityDHId);
    let paramsHall = new HttpParams();
    paramsHall = paramsHall.append('hallsId', this.halls.id.toString());
    paramsHall = paramsHall.append('actDHId', this.activityDHId.toString());
    this.httpClient.get<TicketsEntity[]>(AppConfig.API_ENDPOINT + '/activityTicketsByHallsId', {params: paramsHall})
      .subscribe(data => {
        console.log('/activityTicketsByHallsId === 1 GET Response list =', data);
        this.listHallsTicket = data;
        this.loadingHalls = true;
      }, error => {
        console.log('1 ERROR GET list TicketsEntity for Hall', error.message);
      });

    this.userCurrent = this.userloginService.user;

    let params = new HttpParams();
    params = params.append('hallsId', this.halls.id.toString());
    params = params.append('actDHId', this.activityDHId.toString());
    params = params.append('userId', this.userCurrent.userId.toString());
    this.httpClient.get<TicketsEntity[]>(AppConfig.API_ENDPOINT + '/activityTicketsByHallsUserId', {params})
      .subscribe(data => {
        console.log('/activityTicketsByHallsUserId == 2 GET Response list TicketsEntity for Hall', data);
        this.listHallsUserTicket = data;
        this.loadingHalls = true;
      }, error => {
        console.log('2 ERROR GET list TicketsEntity for Hall', error.message);
      });
  }


}

