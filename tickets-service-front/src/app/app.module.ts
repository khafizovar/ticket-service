import {BrowserModule} from '@angular/platform-browser';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {NgModule, LOCALE_ID} from '@angular/core';
import {HttpClientModule} from '@angular/common/http';
import {DialogModule, WindowModule} from '@progress/kendo-angular-dialog';

import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';

import {NavBarComponent} from './shared/nav-bar/nav-bar.component';
import {MainPageComponent} from './components/main-page/main-page.component';
import {ChidlrenPageComponent} from './components/chidlren-page/chidlren-page.component';
import {ConcertComponent} from './components/concert/concert.component';
import {EventsService} from './services/events.service';
import {AutoCompleteModule, ComboBoxModule} from '@progress/kendo-angular-dropdowns';
import {CitySelectorComponent} from './shared/city-selector/city-selector.component';
import {DateInputsModule} from '@progress/kendo-angular-dateinputs';
import {LabelModule} from '@progress/kendo-angular-label';
import {IntlModule} from '@progress/kendo-angular-intl';
import '@progress/kendo-angular-intl/locales/ru/all';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {LoginComponent} from './shared/login/login.component';
import {ActivityComponent} from './components/activity/activity.component';
import {DatePipe} from '@angular/common'
import {ProfileComponent} from './shared/profile/profile.component';
import {PersonalAreaComponent} from './shared/personal-area/personal-area.component';
import {FormsModule, ReactiveFormsModule, Validators} from '@angular/forms';
import {TabStripModule} from '@progress/kendo-angular-layout';
import {GridModule} from '@progress/kendo-angular-grid';
import {CurrentActivityComponent} from "./components/currentActivity/currentActivity.component";
import {ButtonModule} from "@progress/kendo-angular-buttons";
import {PdfmakeModule} from "ng-pdf-make";
import {TicketsUserComponent} from "./shared/tickets-user/tickets-user.component";
import {DeletemodalComponent} from "./shared/deletemodal/deletemodal.component";
import {TestHallComponent} from "./shared/test-hall/test-hall.component";
import {PayticketComponent} from "./shared/payticket/payticket.component";
import {HallPlaceComponent} from "./shared/hall-place/hall-place.component";
import {AuthService} from './services/auth.service';
import {TokenStorageService} from './services/token-storage.service';
import {AuthInterceptor, authInterceptorProviders} from './interseptors/auth.interseptors';

@NgModule({
  declarations: [
    AppComponent,
    CurrentActivityComponent,
    NavBarComponent,
    MainPageComponent,
    ChidlrenPageComponent,
    ConcertComponent,
    CitySelectorComponent,
    LoginComponent,
    ProfileComponent,
    PersonalAreaComponent,
    ActivityComponent,
    TicketsUserComponent,
    DeletemodalComponent,
    HallPlaceComponent,
    PayticketComponent,
    TestHallComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    HttpClientModule,
    AutoCompleteModule,
    WindowModule,
    DateInputsModule,
    LabelModule,
    IntlModule,
    NgbModule,
    ComboBoxModule,
    FormsModule,
    ReactiveFormsModule,
    TabStripModule,
    GridModule,
    DialogModule,
    ButtonModule,
    PdfmakeModule
  ],
  providers: [DatePipe,
    EventsService,
    AuthInterceptor,
    authInterceptorProviders, {
      provide: LOCALE_ID, useValue: 'ru-RU'
    }, DatePipe],
  bootstrap: [AppComponent]
})
export class AppModule {
}
