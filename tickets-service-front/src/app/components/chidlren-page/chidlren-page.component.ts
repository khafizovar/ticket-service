import {Component, OnInit} from '@angular/core';
import {Activity} from "../../shared/classes/activity";
import {Subscription} from "rxjs";
import {EventsService} from "../../services/events.service";
import {DatePipe} from "@angular/common";
import {ActivatedRoute, Router} from "@angular/router";

@Component({
  selector: 'app-chidlren-page',
  templateUrl: './chidlren-page.component.html',
  styleUrls: ['./chidlren-page.component.css']
})
export class ChidlrenPageComponent implements OnInit {

  type: string = "Кино";

  public gridData: any[] = [];
  public gridView: any[];
  public currentCity = 'Москва';
  public activity: Activity[];
  currentActivityFilmOpened = false;
  checkItem: boolean = false;

  constructor(private eventsService: EventsService, private datepipe: DatePipe, private route: ActivatedRoute, private router: Router) {
    this.activity = [];
    this.currentCity = this.eventsService.getCurrentCity();
    console.log(this.eventsService.getCurrentCity());
  }

  ngOnInit() {
    var i:number;
    var j:number;

    this.gridView = this.gridData;
    this.currentCity = this.eventsService.getCurrentCity();
    this.eventsService.getActivityByCityAndType(this.currentCity, this.type).subscribe(
      (projects) => {
        this.activity=projects;
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
//        this.gridData = projects;
      }
    );


  }

  posterClick(currentActivity: any) {
    console.log("curr="+currentActivity);
    this.eventsService.setCurrentActivity(currentActivity);
    this.currentActivityFilmOpened=true;
    //this.router.navigate(['/currentActivity']);

  }
  currentActivityClosed($event: any) {
    this.currentActivityFilmOpened = false;
  }
}
