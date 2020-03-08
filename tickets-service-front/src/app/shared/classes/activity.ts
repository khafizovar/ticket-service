import {ActivityType} from "./activityType";
import {LocationActivity} from "./locationActivity";
import {Poster} from "./poster";

export class Activity {
  id: number;
  title: string;
  activityType:ActivityType;
  location:LocationActivity;
  poster:Poster;
  constructor(id:number, title:string, activityType:ActivityType, location:LocationActivity, poster:Poster){
    this.id=id;
    this.title=title;
    this.activityType=activityType;
    this.location=location;
    this.poster=poster;
  }
  get getPoster(): Poster {
    return this.poster;
  }

}
