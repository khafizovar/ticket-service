import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MainPageComponent } from './components/main-page/main-page.component';
import { ConcertComponent } from './components/concert/concert.component';
import { ChidlrenPageComponent } from './components/chidlren-page/chidlren-page.component';
import { LoginComponent} from './shared/login/login.component';
import {ProfileComponent} from './shared/profile/profile.component';
import {PersonalAreaComponent} from './shared/personal-area/personal-area.component';
import {CurrentActivityComponent} from "./components/currentActivity/currentActivity.component";
import {ActivityComponent} from "./components/activity/activity.component";
import {TicketsUserComponent} from "./shared/tickets-user/tickets-user.component";

const routes: Routes = [

  { path: 'currentActivity', component: CurrentActivityComponent },
  { path: 'activity', component: ActivityComponent },
  { path: 'main', component: MainPageComponent },
  { path: 'concert', component: ConcertComponent },
  { path: 'children', component: ChidlrenPageComponent },
  { path: 'login', component: LoginComponent },
  { path: 'profile', component: ProfileComponent },
  { path: 'personal-area', component: PersonalAreaComponent },
  { path: 'tickets-user', component: TicketsUserComponent },
  { path: '**', redirectTo: '/main' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
