import {ActivityType} from "./activityType";
import {LocationActivity} from "./locationActivity";
import {Poster} from "./poster";

export class ActivityDate {
  idLocation: number;
  date: string;
  time:string;

  constructor(idLocation:number, date:string, time:string){
    this.idLocation=idLocation;
    this.date=date;
    this.time=time;

  }

}
