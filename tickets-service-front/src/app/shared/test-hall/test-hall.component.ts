import {Component, EventEmitter, OnInit, Output} from '@angular/core';
import {UserloginService} from "../../services/userlogin.service";
import {TicketUserService} from "../../services/ticket-user.service";
import {HttpClient} from "@angular/common/http";
import {Halls} from "../../app.component";

@Component({
  selector: 'app-test-hall',
  templateUrl: './test-hall.component.html',
  styleUrls: ['./test-hall.component.css']
})
export class TestHallComponent implements OnInit {
  @Output() testHallCloseEvent: EventEmitter<any> = new EventEmitter<any>();

  hallPlaceOpened = false;
  hallsId = 1;

  constructor(public userloginService: UserloginService, public ticketUserService: TicketUserService, private httpClient: HttpClient) {
  }

  // ---------------------------
  onClickHalls() {
    this.hallPlaceOpened = true;
  }

  hallsClosed($event: any) {
    this.hallPlaceOpened = false;
  }

  ngOnInit() {
    //----------- тестовое занесение
    console.log('HALLS testOnLoadList');
    this.ticketUserService.testOnLoadList();
    this.hallsId = this.ticketUserService.halls.id;
    //------------------------------------
  }

  onClose($event: MouseEvent) {
    this.testHallCloseEvent.emit($event);
  }
}
