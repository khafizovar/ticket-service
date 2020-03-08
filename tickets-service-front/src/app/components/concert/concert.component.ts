import {Component, EventEmitter, Input, OnDestroy, OnInit, Output} from '@angular/core';
import {Activity} from "../../shared/classes/activity";
import {EventsService} from "../../services/events.service";
import {DatePipe} from "@angular/common";
import {Poster} from "../../shared/classes/poster";
import {User} from "../../app.component";
import {ActivatedRoute, Params, Router} from "@angular/router";
import {Subject, Subscribable, Subscription} from "rxjs";
import {takeUntil} from "rxjs/operators";

@Component({
  selector: 'concert',
  templateUrl: './concert.component.html',
  styleUrls: ['./concert.component.css']
})
export class ConcertComponent implements OnInit {
  type:string="Концерт";
  public gridData: any[] = [];
  public gridView: any[];
  public currentCity = 'Москва';
  public activity:Activity[];
  currentActivityOpened = false;
  checkItem: boolean = false;

  constructor(private eventsService: EventsService,private datepipe: DatePipe,private route: ActivatedRoute,private router: Router) {
    console.log("paramsType"+this.type);
    this.activity=[];
    this.currentCity = this.eventsService.getCurrentCity();
    console.log(this.eventsService.getCurrentCity());
  }



  ngOnInit() {
    /*//this.type=this.eventsService.type;
    this.gridView = this.gridData;
    this.currentCity = this.eventsService.getCurrentCity();
    this.eventsService.getActivityByCityAndType(this.currentCity,this.type).subscribe(
      (projects) => {
        this.gridData=projects;
        console.log(this.gridData[0]);

      }
    );
*/
    var i:number;
    var j:number;

    this.gridView = this.gridData;
    this.currentCity = this.eventsService.getCurrentCity();
    this.eventsService.getActivityByCityAndType(this.currentCity, this.type).subscribe(
      (projects) => {
        this.activity=projects;
        console.log(projects);
        for ( i=0;i<projects.length;i++) {
          this.checkItem=false;
          for (j=i+1;j<projects.length;j++) {
            console.log(projects[j]);
            if (projects[i].title == projects[j].title) {
              this.checkItem = true;
            }
          }
          if (this.checkItem == false && projects[i]!='undefined') {
            console.log(projects[i]);
            this.gridData.push(projects[i]);
            console.log(this.gridData[i]);

          }
        }
//        this.gridData = projects;
      }
    );


  }
  posterClick(currentActivity: any) {
    console.log(currentActivity);
    this.eventsService.setCurrentActivity(currentActivity);
    this.currentActivityOpened=true;
    //this.router.navigate(['/currentActivity'], { queryParams: { activity:currentActivity } });

  }
  currentActivityClosed($event: any) {
    this.currentActivityOpened = false;
  }
}
