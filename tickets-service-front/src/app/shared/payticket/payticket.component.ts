import {Component, EventEmitter, OnInit, Output} from '@angular/core';
import {TicketUserService} from "../../services/ticket-user.service";
import {TicketsEntity, User, UserEntity} from "../../app.component";
import {AppConfig} from "../../../config";
import {HttpClient, HttpParams} from "@angular/common/http";
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {Subscription} from "rxjs";

@Component({
  selector: 'app-payticket',
  templateUrl: './payticket.component.html',
  styleUrls: ['./payticket.component.css']
})
export class PayticketComponent implements OnInit {
  @Output() payTicketsCloseEvent: EventEmitter<any> = new EventEmitter<any>();
  @Output() statusSale: EventEmitter<string> = new EventEmitter<string>();

  public cardNumber;
  public cardMonth;
  public cardYear;
  public cardName;
  public cardCVS;

  public error = '';

  form: FormGroup;
  public sum;

  constructor(public ticketUserService: TicketUserService, private httpClient: HttpClient) {
    this.sum = ticketUserService.paySumm;
  }

  ngOnInit() {
    this.sum = this.ticketUserService.paySumm;
    this.form = new FormGroup({
      cardNumber: new FormControl('', [
        Validators.required,
      ]),
      cardMonth: new FormControl(null, [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(2)
      ]),
      cardYear: new FormControl('', [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(2)
      ]),
      cardName: new FormControl('', [
        Validators.required
      ]),
      cardCVS: new FormControl('', [
        Validators.required,
        Validators.minLength(3),
        Validators.maxLength(3)
      ])
    });
  }

  onClickSave() {
    this.statusSale.emit('ok');
  }

  onClose($event: MouseEvent) {
    this.payTicketsCloseEvent.emit($event);
  }
}
