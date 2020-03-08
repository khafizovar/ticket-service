import {EventEmitter, Injectable, Output} from '@angular/core';
import {HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import {Observable} from 'rxjs';
import {map} from 'rxjs/operators';

import {AppConfig} from '../../config';
import {Activity} from "../shared/classes/activity";
import {Halls, User} from "../app.component";

@Injectable({
  providedIn: 'root'
})
export class EventsService {

  public currentCity = 'Москва';
  public currentActivity: any;
  public activityLocationMap = new Map();
  public activityId:number;
  public timeActivity:number;
  public titlePlace:string;
  public type:string;
  public title:string;
  public getActivityId(): number {
    return this.activityId;
  }

  public setActivityId(activityId: any) {
    console.log(activityId);
    this.activityId = activityId;
  }
  public getActivityLocationMap(): any {
    return this.activityLocationMap;
  }

  public setActivityLocationMap(activityLocationMap: any) {
    console.log(activityLocationMap);
    this.activityLocationMap = activityLocationMap;
  }
  public getCurrentActivity(): any {
    return this.currentActivity;
  }

  public setCurrentActivity(currentActivity: any) {
    console.log(currentActivity);
    this.currentActivity = currentActivity;
  }

  public getCurrentCity(): string {
    return this.currentCity;
  }

  public setCurrentCity(currentCity: string) {
    this.currentCity = currentCity;
  }

  private headers: HttpHeaders = new HttpHeaders();

  constructor(private http: HttpClient) {
  }

  public getActivityDateByActivityId(id: number): Observable<Array<any>> {
    return this.http.get<any[]>('http://localhost:8080/activityDate?activityId=' + id, {headers: this.headers})
      .pipe(map((response: any) => {
        return response;
      }));
  }

  public getActivityByCityAndPeriod(city: string, dateStart: string, dateEnd: string): Observable<Array<Activity>> {
    return this.http.get<Activity[]>('http://localhost:8080/activity?city=' + city + '&dateStart=' + dateStart + '&dateEnd=' + dateEnd, {headers: this.headers})
      .pipe(map((response: any) => {
        return response;
      }));
  }

  public getActivityByCityAndTitle(city: string, title: string): Observable<Array<any>> {
    return this.http.get<any[]>('http://localhost:8080/activity?city=' + city + '&title=' + title, {headers: this.headers})
      .pipe(map((response: any) => {
        return response;
      }));
  }

  public getActivityByCityAndType(city: string, type: string): Observable<Array<any>> {
    return this.http.get<any[]>('http://localhost:8080/activity?city=' + city + '&type=' + type, {headers: this.headers})
      .pipe(map((response: any) => {
        return response;
      }));
  }
  getHall(idHall:number): Observable<Halls>{

    return this.http.get<Halls>('http://localhost:8080/halls?hallId=' + idHall , {headers: this.headers})
      .pipe(map((response: any) => {
        return response;
      }));

  }
}
