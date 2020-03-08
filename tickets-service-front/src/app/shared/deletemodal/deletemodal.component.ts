import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {TicketUserService} from "../../services/ticket-user.service";

@Component({
  selector: 'app-deletemodal',
  templateUrl: './deletemodal.component.html',
  styleUrls: ['./deletemodal.component.css']
})
export class DeletemodalComponent implements OnInit {
  @Output() statusBtn: EventEmitter<string> = new EventEmitter<string>();

  stringQ = '';

  constructor(public ticketUserService: TicketUserService) { }

  ngOnInit() {
    this.stringQ = this.ticketUserService.deleteStringQ;
  }

  onNo() {
    this.statusBtn.emit('no');
  }

  action(status: string) {
    this.statusBtn.emit(status);
  }
}
