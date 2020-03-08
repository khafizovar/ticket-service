import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {UserloginService} from "../../services/userlogin.service";
import {HttpClient} from "@angular/common/http";
import {ActivityDateHallsEntity, TicketsEntity} from "../../app.component";
import {TicketUserService} from "../../services/ticket-user.service";
import {PdfmakeService} from "ng-pdf-make";
import {DatePipe} from '@angular/common';

// установить: npm install ng-pdf-make
// возможно: npm install ng-pdf-make --save

@Component({
  selector: 'app-tickets-user',
  templateUrl: './tickets-user.component.html',
  styleUrls: ['./tickets-user.component.css']
})
export class TicketsUserComponent implements OnInit {
  @Output() ticketPDFCloseEvent: EventEmitter<any> = new EventEmitter<any>();

  imgSrc = '';
  nameTicket = 'Билет на ';
  title = '';
  ticketCurrent: TicketsEntity;
  activityDateHallsDto: ActivityDateHallsEntity;
  locActivity = '';
  dataRowNum = '';
  dataTicketString = '';
  textStatus = '';
  textSign = '';
  textWarningO = 'При бронировании и покупке билетов онлайн необходимо обращать внимание на наличие возрастных ограничений на посещение' +
    '  фильмов в соответствии с Федеральным законом от 29.12.2010 № 436-ФЗ «О защите детей от информации, причиняющей вред их' +
    '  здоровью и развитию».';
  textWarningT = 'Кассир в праве потребовать от пользователя предъявления документа, подтверждающего его возраст, предупредив о наличии' +
    '  ограничений по возрасту на посещение фильма. Приобретение билета в кассе или онлайн не является гарантией пропуска' +
    '  посетителя на фильм при наличии ограничений по возрасту на посещение фильма, установленного прокатным' +
    '  удостоверением.';

  constructor(public userloginService: UserloginService, public ticketUserService: TicketUserService, public pdfmake: PdfmakeService, private httpClient: HttpClient) {
    this.ticketCurrent = ticketUserService.ticketCurrent;
    this.activityDateHallsDto = this.ticketCurrent.activityDateHallsDto;
    this.title = this.activityDateHallsDto.activityByActivityId.title;
    this.imgSrc = userloginService.imgSrc + this.activityDateHallsDto.activityByActivityId.postersByPosterId.poster;
    this.locActivity = '  "' + this.activityDateHallsDto.activityByActivityId.locationByLocationId.titlePlace + '", ул. ' + this.activityDateHallsDto.activityByActivityId.locationByLocationId.street + ', д. ' + this.activityDateHallsDto.activityByActivityId.locationByLocationId.houseNumber;
    this.dataRowNum = 'зал ' + this.activityDateHallsDto.hallsByHallsId.number + ',  ряд ' + this.ticketCurrent.rowNum + ', место ' + this.ticketCurrent.placeNum;
    this.dataTicketString = new DatePipe('en-US').transform(this.activityDateHallsDto.activityDate, 'dd-MM-yyyy HH:mm');

    if (this.ticketCurrent.ticketStatus == 'blocked') {
      this.textStatus = ' Место забронировано. Вы можете оплатить билет в Личном Кабинете или в кассе не позднее, чем за 20 минут до начала сеанса.';
    }

    if (this.ticketCurrent.ticketStatus == 'sales') {
      this.textStatus = ' Место оплачено.';
    }

    this.textSign = ' Цена билета: ' + this.ticketCurrent.signNum + ' руб.';
  }

  onClose($event: MouseEvent) {
    this.ticketPDFCloseEvent.emit($event);
  }

  ngOnInit() {
    this.pdfmake.create();

    this.pdfmake.documentDefinition = {
      pageSize: 'A5',
      pageOrientation: 'landscape',

      content: [
        {
          table: {
            widths: [0, '*'],
            body: [
              [
                {
                  text: '',
                  width: 'auto',
                  alignment: 'center',
                  border: [0, 0, 0, 0],
                  rowSpan: 9
                },
                {text: this.nameTicket + this.title, fontSize: 20, alignment: 'center', border: [0, 0, 0, 0]}
              ],
              [
                '', {text: this.dataTicketString, fontSize: 18, alignment: 'center', border: [0, 0, 0, 0]}
              ],
              [
                '', {text: '', fontSize: 18, alignment: 'center', border: [0, 0, 0, 0]}
              ],
              [
                '', {text: '~ ~ ~', fontSize: 18, alignment: 'center', border: [0, 0, 0, 0]}
              ],
              [
                '', {text: '', fontSize: 18, alignment: 'center', border: [0, 0, 0, 0]}
              ],
              [
                '', {
                text: '"' + this.activityDateHallsDto.activityByActivityId.locationByLocationId.titlePlace + '"',
                fontSize: 15,
                border: [0, 0, 0, 0]
              }
              ],
              [
                '', {
                text: 'ул. ' + this.activityDateHallsDto.activityByActivityId.locationByLocationId.street + ', д. ' + this.activityDateHallsDto.activityByActivityId.locationByLocationId.houseNumber,
                fontSize: 14,
                border: [0, 0, 0, 0]
              }
              ],
              [
                '', {text: '', fontSize: 18, alignment: 'center', border: [0, 0, 0, 0]}
              ],
              [
                '', {text: '', fontSize: 18, alignment: 'center', border: [0, 0, 0, 0]}
              ],
              [
                {text: this.dataRowNum, fontSize: 13, alignment: 'left', border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: '', border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: '', border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: this.textStatus, fontSize: 10, border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: '', border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: '', border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: this.textSign, fontSize: 12, border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: '', border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: '', border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: this.textWarningO, fontSize: 8, border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: '', border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: '', border: [0, 0, 0, 0], colSpan: 2}
              ],
              [
                {text: this.textWarningT, fontSize: 8, border: [0, 0, 0, 0], colSpan: 2}
              ],
            ]
          }
        }
      ]
    };

  }

  generatePDF() {
    console.log('download PDF');
    this.pdfmake.download();
  }

  openPDF() {
    this.pdfmake.open();
  }

}
