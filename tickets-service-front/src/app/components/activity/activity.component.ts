import {Component, EventEmitter, OnChanges, OnInit, Output, SimpleChanges} from '@angular/core';
import {EventsService} from "../../services/events.service";
import {Activity} from "../../shared/classes/activity";
import {DatePipe} from "@angular/common";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'activity',
  templateUrl: './activity.component.html',
  styleUrls: ['./activity.component.css']
})
export class ActivityComponent implements OnInit,OnChanges {
  title: string;

  public gridData: any[] = [];
  public gridView: any[];
  public currentCity = 'Moscow';
  public activity:Activity[];
  currentActivityOpened = false;
  @Output() activityCloseEvent: EventEmitter<any> = new EventEmitter<any>();

  constructor(private eventsService: EventsService,private datepipe: DatePipe,private route: ActivatedRoute,
              private router: Router) {
    this.activity=[];
    this.currentCity = this.eventsService.getCurrentCity();
    console.log(this.eventsService.getCurrentCity());
  }

  onClose($event: MouseEvent) {
    // this.activityDateCloseEvent.emit($event);
    this.activityCloseEvent.emit($event);
    console.log("exit" );

  }
  checkItem: boolean = false;

  ngOnInit() {
    var i:number;
    var j:number;
    this.currentCity = this.eventsService.getCurrentCity();
    this.title=this.eventsService.title;
  /*  this.route
      .queryParams
      .subscribe(params => {
        this.title = params.page;
        this.currentCity=params.city;
        console.log(this.title);*/
        this.eventsService.getActivityByCityAndTitle(this.currentCity, this.title).subscribe(
          (projects) => {
          /*  console.log("city"+this.currentCity+"title"+ this.title);
            this.gridData = projects;
            console.log(this.gridData);
*/

            for ( i=0;i<projects.length;i++) {
              this.checkItem=false;
              for (j=i+1;j<projects.length;j++) {
                console.log(projects[j]);
                if (projects[i].title == projects[j].title) {
                  this.checkItem = true;
                }
              }
              if (this.checkItem == false) {
                this.gridData.push(projects[i]);
              }
            }


          }
        );
/*
      });
*/

   // this.gridView = this.gridData;
  }
  ngOnChanges(changes: SimpleChanges): void {

  }
  posterClick(currentActivity: any) {
    console.log(currentActivity);
    this.eventsService.setCurrentActivity(currentActivity);
    //this.router.navigate(['/currentActivity'],{queryParams: {activity: currentActivity}});
    this.currentActivityOpened = true;

  }
  currentActivityClosed($event: any) {
    this.currentActivityOpened = false;
  }
}
