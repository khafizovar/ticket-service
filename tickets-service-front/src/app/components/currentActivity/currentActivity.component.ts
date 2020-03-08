import {Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges} from '@angular/core';
import {EventsService} from "../../services/events.service";
import {Activity} from "../../shared/classes/activity";
import {DatePipe} from "@angular/common";
import {ActivatedRoute, Router} from "@angular/router";
import {ActivityDate} from "../../shared/classes/activityDate";
import {UserloginService} from "../../services/userlogin.service";
import {TicketUserService} from "../../services/ticket-user.service";
import {HttpClient} from "@angular/common/http";
import {Halls} from "../../app.component";
import {Observable} from "rxjs";

@Component({
  selector: 'currentActivity',
  templateUrl: './currentActivity.component.html',
  styleUrls: ['./currentActivity.component.css']
})
export class CurrentActivityComponent implements OnInit {
  title: string;
  currentActivity: any;
  costTicket: number;
  activityCurrentLocationList: any[] = [];
  activityDateList: any[] = [];
  activityLocationMap = new Map();
  dateList: any[] = [];
  dateUniqueList: any[] = [];
  date: Date;
  activities: any[] = [];
  activityIdList: any[] = [];
  @Output() activityDateSelectedEvent = new EventEmitter();
  @Output() activityDateCloseEvent: EventEmitter<any> = new EventEmitter<any>();
  dateActivity: any;
  timeActivity: any[] = [];
  activityLocationIdList: any[] = [];
  activityLocationIdUniqueList: any[] = [];
  activityLocationsUniqueList: any[] = [];
  index: string;
  indexDate: number;
  showLocation: boolean = true;

  //test
  @Output() currentActivityCloseEvent: EventEmitter<any> = new EventEmitter<any>();
  @Output() currentActivityFilmCloseEvent: EventEmitter<any> = new EventEmitter<any>();

  hallPlaceOpened = false;
  hallPlaceOpened2 = false;

  constructor(private eventsService: EventsService, public ticketUserService: TicketUserService) {
    this.showLocation = true;
  }


  ngOnInit(): void {

    this.currentActivity = this.eventsService.getCurrentActivity();
    console.log(this.currentActivity);
    this.eventsService.getActivityByCityAndTitle(this.eventsService.getCurrentCity(), this.currentActivity.title).subscribe(
      (projects) => {
        for (var item in projects) {
          this.activities = projects;
          this.activityCurrentLocationList[item] = projects[item].locationByLocationId;
          this.activityIdList.push(projects[item].id);
          this.activityLocationIdList.push(projects[item].locationByLocationId.id)
        }
        //удаляем повторяющие idLocation
        this.activityLocationIdUniqueList = this.unique(this.activityLocationIdList);
        //получаем массив не повтор location
        for (let ind of this.activityLocationIdUniqueList) {
          for (let index1 of this.activityCurrentLocationList) {
            if (ind == index1.id) {
              this.activityLocationsUniqueList.push(index1);
              break;
            }
          }
        }

        this.indexDate = 0;
        for (var i in this.activityIdList) {
          //this.index = i;
          this.eventsService.getActivityDateByActivityId(this.activityIdList[i]).subscribe(
            (projects) => {
              this.activityDateList = projects;
              for (var item in projects) {
                console.log("activityId" + this.activityIdList[i] + "project  " + projects[item].activityDate);
                this.dateList[this.indexDate] = new DatePipe('en-US').transform(projects[item].activityDate, 'yyyy-MM-dd')
                this.indexDate++;
              }

              this.dateUniqueList = this.unique(this.dateList);
              this.dateUniqueList = this.dateUniqueList.filter(function (x) {
                return x !== undefined && x !== null;
              });
              this.dateUniqueList.sort((a: string, b: string) => {
                var dateA = new Date(a), dateB = new Date(b);
                return dateA.getTime() - dateB.getTime();

              });

              for (var i in this.dateUniqueList) {
                var year=this.dateUniqueList[i].slice(0,this.dateUniqueList[i].indexOf('-'));
                var month=this.dateUniqueList[i].slice(5,7);
                var day=this.dateUniqueList[i].slice(8,10);
                this.dateUniqueList[i] = day+"-"+month+"-"+year;
              }
              console.log(this.dateUniqueList);


              for (var i in this.activities) {
                for (var j in this.activityDateList) {
                  if (this.activities[i].id == this.activityDateList[j].activityId) {
                    console.log(this.activityDateList[0].hallsByHallsId);
                    this.timeActivity.push({
                      idLocation: this.activities[i].locationByLocationId.id,
                      date: new DatePipe('en-US').transform(this.activityDateList[j].activityDate, 'dd-MM-yyyy'),
                      time: new DatePipe('en-US').transform(this.activityDateList[j].activityDate, 'HH:mm'),
                      actDHId: this.activityDateList[j].id,
                      hall: this.activityDateList[j].hallsByHallsId

                    });
                  }

                }
              }

              this.dateActivity = this.dateUniqueList[0];
            }
          );
        }


      }
    );

  }

  changeDate(value: any) {
    this.dateActivity = value;
    this.showLocation = true;
  }

  // ------------- ДЛЯ ЗАЛА УСТАНОВЛЕНА ЗАДЕРЖКА В 5 СЕК -----------------------------------------
  // hallPlaceOpened2 - для отрисовки элемента таблицы "Подождите, идет загрузка билетов..."

  async onClickHalls(actDHId: any, hall: any, titlePlace: string, time: any) {
    this.eventsService.timeActivity = time;
    this.eventsService.titlePlace = titlePlace;

    this.ticketUserService.halls = hall;
    this.ticketUserService.hallid = hall.id;
    this.ticketUserService.activityDHId = actDHId;

    this.hallPlaceOpened2 = true;

    this.ticketUserService.testOnLoadList();

    await new Promise(r => setTimeout(r, 5000));

    this.hallPlaceOpened2 = false;
    this.hallPlaceOpened = true;
  }

  // ------------------------------------------------------

  hallsClosed($event: any) {
    this.hallPlaceOpened = false;
  }

  onClose($event: MouseEvent) {
    this.currentActivityCloseEvent.emit($event);
    console.log("exit" );

  }
  onClose1($event: MouseEvent) {
    this.currentActivityFilmCloseEvent.emit($event);
    console.log("exit" );

  }

  unique(arr) {
    let result = [];

    for (let str of arr) {
      if (!result.includes(str)) {
        result.push(str);
      }
    }

    return result;
  }


}
