import {Component, EventEmitter, OnInit, Output} from '@angular/core';
import {ColorRowPlace, SchemeString, TableHallStruct, TicketsEntity, User, UserEntity} from "../../app.component";
import {UserloginService} from "../../services/userlogin.service";
import {TicketUserService} from "../../services/ticket-user.service";
import {HttpClient, HttpHeaders, HttpParams} from "@angular/common/http";
import {AppConfig} from "../../../config";
import {Subscription} from "rxjs";
import {EventsService} from "../../services/events.service";
import {PdfmakeService} from "ng-pdf-make";
import {FormsModule} from "@angular/forms";
import {timeout} from "rxjs/operators";

@Component({
  selector: 'app-hall-place',
  templateUrl: './hall-place.component.html',
  styleUrls: ['./hall-place.component.css']
})
export class HallPlaceComponent implements OnInit {
  @Output() hallsCloseEvent: EventEmitter<any> = new EventEmitter<any>();
  //test
  private subscription: Subscription;
  error = '';

  rowAllNum = 0;     // всего рядов
  placeAllNum = 0;   // всего мест

  listUserTicket: Array<TicketsEntity> = [];         // лист всех билетов юзера, как купленных, так и заблокированных
  listHallsTicket: Array<TicketsEntity> = [];        // лист всех мест в зале
  listBlockedTicket: Array<TicketsEntity> = [];      // начальный список заблокированных у юзера мест
  listBlockedTicketEnd: Array<TicketsEntity> = [];   // окончательный список блокированных мест
  listUnBlockedTicket: Array<TicketsEntity> = [];    // список освобожденных билетов, ранее бывших у юзера заблокированных
  listUnBlockedIdTicket: Array<number> = [];  // список id-ов освобожденных билетов, ранее бывших у юзера заблокированных

  blockedCount = 0;
  flag = true;

  isCheked: boolean = false;

  okStatus = false;

  rowAllNumClick: string[] = [];
  placeAllNumClick: string[] = [];

  colorPlaces: ColorRowPlace[];
  title: string;
  halls: any;
  imgSrc = '';
  loginSelectorOpened = false;
  personalSelectorOpened = false;

  titlePlace: string;
  time: any;

  constructor(public eventService: EventsService,
              public userloginService: UserloginService,
              public ticketUserService: TicketUserService,
              private httpClient: HttpClient, public pdfmake: PdfmakeService) {


  }

  onLoadHalls(listTicket: Array<TicketsEntity>, fontC: string, groundC: string) {
    for (let i = 0; i < listTicket.length; i++) {
      let ticketEntity = listTicket[i];
      if (ticketEntity.ticketStatus != 'free') {
        this.colorPlaces[ticketEntity.rowNum - 1].groundColor[ticketEntity.placeNum - 1] = groundC;
      }
      if (ticketEntity.ticketStatus == 'blocked') {
        this.colorPlaces[ticketEntity.rowNum - 1].fontColor[ticketEntity.placeNum - 1] = fontC;
        if (fontC === 'white') {
          this.blockedCount++;
          this.listBlockedTicket.push(ticketEntity);
        }
      }
      if (ticketEntity.ticketStatus == 'sales') {
        this.colorPlaces[ticketEntity.rowNum - 1].fontColor[ticketEntity.placeNum - 1] = groundC;
      }
    }
  }

  onClick(i: number, j: number) {
    console.log('placenum =', j);
    console.log('rownum =', i);
    this.flag = true;

    if ((this.colorPlaces[i].groundColor[j] === 'darkred') && this.flag) {
      if (this.colorPlaces[i].fontColor[j] === 'white') {
        this.colorPlaces[i].groundColor[j] = 'gray';
        this.colorPlaces[i].fontColor[j] = 'gray';
        this.flag = false;
        this.blockedCount--;
      } else {
        alert('Это место уже занято');
        this.flag = false;
      }
    }

    if ((this.colorPlaces[i].groundColor[j] === 'gray') && this.flag) {
      if (this.blockedCount < 6) {
        this.colorPlaces[i].groundColor[j] = 'darkred';
        this.colorPlaces[i].fontColor[j] = 'white';
        this.blockedCount++;
      } else {
        alert('Нельзя забронировать больше 6 билетов')
      }
      this.flag = false;
    }
  }

  findTicketInListBlocked(listTicket: Array<TicketsEntity>, ticketCurrent: TicketsEntity):
    boolean {
    let res = false;
    for (let i = 0; i < listTicket.length; i++) {
      let ticketEntity = listTicket[i];
      if (ticketEntity.id = ticketCurrent.id) {
        res = true;
      }
    }
    return res;
  }

  onClickBlocked() {
    this.okStatus = false;
    // идем по листу блокированных
    // проверяем цвет у места
    // если оно серое, пишем в лист разблокированных
    console.log('onClickBlocked, listUserTicket =', this.listUserTicket);
    if (this.listUserTicket != undefined) {
      for (let i = 0; i < this.listBlockedTicket.length; i++) {
        let ticketEntity = this.listBlockedTicket[i];
        if (this.colorPlaces[ticketEntity.rowNum - 1].groundColor[ticketEntity.placeNum - 1] == 'gray') {
          this.listUnBlockedTicket.push(ticketEntity);
          this.listUnBlockedIdTicket.push(ticketEntity.id);
        }
      }
    }

    console.log(' HALL onClickBlocked, listHallsTicket =', this.listHallsTicket);
    // идем по всем местам
    // если место заблокированно добавляем в лист блокированных_энд
    if (this.listHallsTicket != undefined) {
      for (let i = 0; i < this.listHallsTicket.length; i++) {
        let ticketEntity = this.listHallsTicket[i];
        if ((this.colorPlaces[ticketEntity.rowNum - 1].groundColor[ticketEntity.placeNum - 1] == 'darkred') &&
          (this.colorPlaces[ticketEntity.rowNum - 1].fontColor[ticketEntity.placeNum - 1] == 'white')) {
          this.listBlockedTicketEnd.push(ticketEntity);
        }
      }
    }

    // если юзер залогинен, Обновляем ему билеты
    if (this.ticketUserService.userCurrent != undefined) {
      // для этого списка вызовем добавление билетов конкретному юзеру, статус их менится на blocked
      console.log(' HALL List Blocked', this.listBlockedTicketEnd);
      if (this.listBlockedTicketEnd.length > 0) {
        this.okStatus = true;
        this.onUpdateTicketStatus(this.listBlockedTicketEnd, this.ticketUserService.userCurrent.userId, 'blocked');
      }

      // для этого списка вызовем удаление билетов у юзера, статус их сменится на free
      console.log('List UNBlocked', this.listUnBlockedTicket);
      if (this.listUnBlockedTicket.length > 0) {
        this.okStatus = true;
        this.onDelTicketUser(this.listUnBlockedIdTicket, this.ticketUserService.userCurrent.userId);
      }

      if (this.okStatus) {
        alert('Изменения выполнены успешно, вы можете посмотреть их, а также оплатить забронированные билеты в своем Личном Кабинете');
        this.hallsCloseEvent.emit();
      }
    }

  }

  /* блокируем выбранные юзером билеты:
    добавляем список в таблицу UserActivity (по одному пользователю) с обновлением статуса билетов
    Array<TicketsEntity>- список билетов, которые блокируются для юзера с ид = userId
    возвращается обновленный список билетов для юзера
    */
  onUpdateTicketStatus(listTicket: Array<TicketsEntity>, userId: number, status: string) {
    if (status == 'blocked') {
      this.subscription = this.httpClient.post<Array<TicketsEntity>>(AppConfig.API_ENDPOINT + '/addTicketsList/' + this.ticketUserService.userCurrent.userId.toString(), listTicket)
        .subscribe(data => {
          this.listUserTicket = data;
          console.log('HALL update listUserTicket', data);
        }, error => {
          console.log('HALL ERROR POST update listUserTicket', error.message);
          this.error = error.message;
        });
    }
  }

  /* обновление статуса билетов на free, если пользователь решил снять бронь
     удаление из таблицы user_activity
     Array<number> - список билетов, которые нужно "освободить"
     userId - ид юзера
     возвращается обновленный список билетов для юзера
   */
  onDelTicketUser(listIdTicket: Array<number>, userId: number) {
    this.subscription = this.httpClient.post<Array<TicketsEntity>>(AppConfig.API_ENDPOINT + '/delTicketsList/' + this.ticketUserService.userCurrent.userId.toString(), listIdTicket)
      .subscribe(data => {
        this.listUserTicket = data;
        console.log('HALL delete listUserTicket', data);
      }, error => {
        console.log('HALL ERROR POST delete listUserTicket', error.message);
        this.error = error.message;
      });
  }

  onMouseOver(i: number, j: number) {
    if (this.colorPlaces[i].groundColor[j] === 'gray') {
      this.colorPlaces[i].fontColor[j] = 'white';
    }
  }

  onMouseOut(i: number, j: number) {
    if (this.colorPlaces[i].groundColor[j] === 'gray') {
      this.colorPlaces[i].fontColor[j] = 'gray';
    }
  }

  onClose($event: MouseEvent) {
    this.hallsCloseEvent.emit($event);
  }

  sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  ngOnInit() {
    this.ticketUserService.testOnLoadList();

    this.title = this.eventService.getCurrentActivity().title;
    this.halls = this.ticketUserService.halls;
    this.titlePlace = this.eventService.titlePlace;
    this.time = this.eventService.timeActivity;

    this.imgSrc = this.userloginService.imgSrc;
    this.colorPlaces = new Array<ColorRowPlace>();

    this.rowAllNum = +this.ticketUserService.halls.scheme.slice(this.ticketUserService.halls.scheme.indexOf('[') + 1, this.ticketUserService.halls.scheme.indexOf(','));
    this.placeAllNum = +this.ticketUserService.halls.scheme.slice(this.ticketUserService.halls.scheme.indexOf(',') + 1, this.ticketUserService.halls.scheme.indexOf(']'));

    this.listUserTicket = this.ticketUserService.listHallsUserTicket;
    this.listHallsTicket = this.ticketUserService.listHallsTicket;

    console.log('HALLS  rowAllNum =', this.rowAllNum);
    console.log('HALLS  placeAllNum =', this.placeAllNum);
    console.log('HALLS  hall = ', this.ticketUserService.halls);
    console.log('HALLS  user = ', this.ticketUserService.userCurrent);
    console.log('HALLS  activity_data_halls id = ', this.ticketUserService.activityDHId);
    console.log('HALLS  listHallsTicket', this.listHallsTicket);
    console.log('HALLS  listUserTicket', this.listUserTicket);

    // заполняем массив мест
    for (let i = 0; i < this.placeAllNum; i++) {
      this.placeAllNumClick.push((i + 1).toString());
    }

    // заполняем массив рядов
    for (let i = 0; i < this.rowAllNum; i++) {
      this.rowAllNumClick.push((i + 1).toString());
    }

    for (let i = 0; i < this.rowAllNum; i++) {
      let str1: string[] = new Array<string>();
      let str2: string[] = new Array<string>();
      for (let j = 0; j < this.placeAllNum; j++) {
        str1.push('gray');
        str2.push('gray');
      }
      let colorRowPlace: ColorRowPlace = new class implements ColorRowPlace {
        groundColor: string[] = str1;
        fontColor: string[] = str2;
      }
      this.colorPlaces.push(colorRowPlace);
    }

    console.log('!!! this.listHallsTicket.length=', this.listHallsTicket.length);
    if ((this.listHallsTicket != undefined) && (this.listHallsTicket.length > 0)) {
      this.onLoadHalls(this.listHallsTicket, 'darkred', 'darkred');
    }

    console.log('!!! this.listUserTicket=', this.listUserTicket);
    if ((this.listUserTicket != undefined) && (this.listUserTicket.length > 0)) {
      this.onLoadHalls(this.listUserTicket, 'white', 'darkred');
    }
  }

  ngOnDestroy(): void {
    console.log('ngOnDestroy hall-place.component');
    this.subscription.unsubscribe();
  }

  onChecked($event: Event) {

  }

  onTermsOfUse() {
    this.pdfmake.create();

    this.pdfmake.documentDefinition = {

      content: [
        {
          text: 'Правила пользования услугами бронирования и онлайн покупки билетов\n\n\n',
          fontSize: 14,
          alignment: 'center'
        },
        {
          text: '     Выбирая услугу бронирования или онлайн покупки билетов, пользователь соглашается с Правилами пользования услугами' +
            ' бронирования и онлайн покупки билетов на сайте TicketsService, а также Правилами посещения того кинотеатра, в который' +
            ' приобретается билет.\n\n', fontSize: 10, aligment: 'justify'
        },
        {
          text: '     Настоящие Правила разработаны в соответствии с Конституцией РФ, Гражданским кодексом РФ, Законом РФ от 07.02.1992 № ' +
            ' 2300-1 «О защите прав потребителей», Правилами кинообслуживания населения, утвержденными постановлением Правительства ' +
            ' РФ от 17.11.1994 №1264.\n\n', fontSize: 10
        },
        {
          text: '     Услуги бронирования и онлайн покупки билетов доступны всем зарегистрированным пользователям сайта.\n\n',
          fontSize: 10
        },
        {
          text: '     Бронирование билетов – это временное (до момента онлайн оплаты/оплаты в кассе либо до момента автоматического' +
            ' аннулирования – за 20 минут до начала сеанса) предварительное закрепление за конкретным пользователем места в кинозале' +
            ' на киносеанс. Оплата билетов онлайн – это покупка билетов на места, выбранные пользователем, посредством банковской' +
            ' карты. Онлайн билеты требуют распечатки посадочного талона. С момента продажи пользователю билета онлайн Договор' +
            ' на кинообслуживание считается заключенным.\n\n', fontSize: 10
        },
        {
          text: '     Для бронирования доступно не более 6-и билетов. После оплаты первых шести забронированных билетов пользователь может продолжить бронирование' +
            ' остальных билетов.\n\n', fontSize: 10, aligment: 'justify'
        },
        {
          text: '     Заказ с забронированными, но не оплаченными билетами, автоматически аннулируется за 20 минут до начала сеанса.\n\n',
          fontSize: 10
        },
        {
          text: '     Кинотеатр оставляет за собой право изменения стоимости билета любое количество раз за время проката фильма.\n\n',
          fontSize: 10
        },
        {
          text: '     При бронировании билетов на первые сеансы необходимо учитывать режим работы кассы кинотеатра, которая начинает работу' +
            ' не позднее, чем за 20 минут до начала первого сеанса, а также режим работы торгово-развлекательного центра, в котором' +
            ' находится кинотеатр, и выкупать забронированные билеты заранее.\n\n' +
            '     Услуги бронирования и онлайн покупки сопровождаются созданием виртуального билета. Уточнить информацию о своем заказе зритель может в разделе Личного Кабинета.' +
            ' Пользователь несёт ответственность за хранение и конфиденциальность информации, на основании владения которой он имеет' +
            ' право на получение билета(ов).\n\n' +
            '     Забронированные билеты можно выкупить в кассе того кинотеатра сети TicketsService, куда они приобретены. При онлайн' +
            ' оплате билеты можно распечатать в формате pdf. Оплаченный онлайн билет можно не распечатывать.\n\n',
          fontSize: 10
        },
        {
          text: '     В случае, когда пользователь инициирует оплату забронированных ранее билетов, он автоматически переключается на услугу' +
            ' онлайн покупки. С этого момента начинают действовать правила пользования услугой онлайн оплаты. При инициировании' +
            ' оплаты забронированных билетов на сайте в конце периода действия брони необходимо учитывать, что процесс оплаты' +
            ' билетов онлайн занимает некоторое время (15 и более минут). Автоматическое аннулирование забронированных билетов при' +
            ' этом происходит за 20 минут до начала сеанса.\n\n', fontSize: 10
        },
        {
          text: 'В случае отказа от посещения киносеанса зритель обязан аннулировать заказ с забронированными местами на сайте' +
            ' самостоятельно.\n\n', fontSize: 10
        },
        {
          text: '     При бронировании и покупке билетов онлайн необходимо обращать внимание на наличие возрастных ограничений на посещение' +
            ' фильмов в соответствии с Федеральным законом от 29.12.2010 № 436-ФЗ «О защите детей от информации, причиняющей вред их' +
            ' здоровью и развитию».\n\n', fontSize: 10
        },
        {
          text: '     Кассир в праве потребовать от пользователя предъявления документа, подтверждающего его возраст, предупредив о наличии' +
            ' ограничений по возрасту на посещение фильма. Приобретение билета в кассе или онлайн не является гарантией пропуска' +
            ' посетителя на фильм при наличии ограничений по возрасту на посещение фильма, установленного прокатным' +
            ' удостоверением.', fontSize: 10
        }
      ]
    };

    this.pdfmake.open();
  }
}


