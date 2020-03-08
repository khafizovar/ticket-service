import {Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges} from '@angular/core';
import {EventsService} from '../../services/events.service';
import {Activity} from "../../shared/classes/activity";
import {WindowState} from "@progress/kendo-angular-dialog";

interface Poster {
  src: string;
  title: string;
  text: string;
  id: string;
}


@Component({
  selector: 'app-main-page',
  templateUrl: './main-page.component.html',
  styleUrls: ['./main-page.component.css']
})
export class MainPageComponent implements OnInit, OnChanges {
  @Input() public currentCity = 'Москва';
  @Output() onCityChange = new EventEmitter<string>();

  // Период выборки дат
  public range = {start: new Date(), end: new Date(Date.now() + 168 * 60 * 60 * 1000)};
  public postersForCarousel: any[] = [];
  public gridData: any[] = [];
  public gridView: any[];
  public activity: Activity[];
  public checkDate: boolean = false;

  public activityDateSelectorOpened: boolean = false;
  public activityDateSelectorWindowState: WindowState = 'maximized';


  constructor(private eventsService: EventsService) {
    this.activity = [];
    this.currentCity = this.eventsService.getCurrentCity();
    console.log(this.currentCity);
  }

  activityDateSelected(activity: any) {
    this.eventsService.setCurrentActivity(activity);
    this.activityDateSelectorOpened = false;
  }
  currentActivityClosed($event: any) {
    this.activityDateSelectorOpened = false;
  }

  showActivitySelector(event: Event) {
    this.activityDateSelectorOpened = true;
    event.preventDefault();
  }

  changeDateStart(date: Date) {
    this.range.start = date;
    this.getActivityByCityAndDate(this.currentCity, date.toISOString().slice(0, 10), this.range.end.toISOString().slice(0, 10))
    this.checkDate = true;

  }

  changeDateEnd(date: Date) {
    this.range.end = date;
    this.getActivityByCityAndDate(this.currentCity, this.range.start.toISOString().slice(0, 10), date.toISOString().slice(0, 10))
    this.checkDate = true;
  }

  getActivityByCityAndDate(city: string, dateStart: string, dateEnd: string) {
    this.eventsService.getActivityByCityAndPeriod(city, dateStart, dateEnd).subscribe(
      (projects) => {
        this.gridData = projects;
      }
    );
  }

  ngOnChanges(changes: SimpleChanges): void {
    this.currentCity = this.eventsService.getCurrentCity();
    this.getActivityByCityAndDate(this.currentCity, this.range.start.toISOString().slice(0, 10),
      this.range.end.toISOString().slice(0, 10));
  }

  ngOnInit() {
    this.gridView = this.gridData;
    this.currentCity = this.eventsService.getCurrentCity();
    this.getActivityByCityAndDate(this.currentCity, this.range.start.toISOString().slice(0, 10),
      this.range.end.toISOString().slice(0, 10));

    this.eventsService.getActivityByCityAndPeriod(this.currentCity, new Date().toISOString().slice(0, 10),
      new Date(Date.now() + 72 * 60 * 60 * 1000).toISOString().slice(0, 10)).subscribe(
      (projects) => {
        this.postersForCarousel = projects;
      }
    );
  }

  posterClick(currentActivity: any) {
    console.log(currentActivity);
    this.eventsService.setCurrentActivity(currentActivity);
  }

  photoURL(dataItem) {
    console.log(dataItem.posterImage);
    return dataItem.posterImage;
  }

  isMouseUp($event: MouseEvent) {
    console.log($event);
  }

  eventInfo(poster: any) {
    console.log(poster);
  }

  activityDateClosed($event: any) {
    this.activityDateSelectorOpened = false;
  }
}
