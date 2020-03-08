import {Component, Input, OnChanges, OnInit, SimpleChanges} from '@angular/core';
import {EventsService} from "../../services/events.service";

@Component({
  selector: 'app-nav-bar',
  templateUrl: './nav-bar.component.html',
  styleUrls: ['./nav-bar.component.css']
})
export class NavBarComponent implements OnInit,OnChanges {
  @Input() public currentCity = 'Moscow';
  constructor(private eventsService: EventsService) {
    this.currentCity = this.eventsService.getCurrentCity();

  }

  ngOnInit() {
  }
  ngOnChanges(changes: SimpleChanges): void {
    this.currentCity = this.eventsService.getCurrentCity();
  }
  changeNavigate(type:string){
    this.eventsService.type=type;
  }

}
