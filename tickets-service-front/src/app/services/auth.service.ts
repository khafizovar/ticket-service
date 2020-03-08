import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import {AppConfig} from '../../config';
import {AuthLoginInfo} from "../auth/login-info";
import {SignUpInfo} from "../auth/sigup-info";

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }

  login(credentials: AuthLoginInfo): Observable<any> {
    console.log('sign in');
    return this.http.post(AppConfig.API_ENDPOINT + '/api/auth/' + 'signin', credentials, httpOptions);
  }

  register(user: SignUpInfo): Observable<any> {
    console.log('register');
    return this.http.post(AppConfig.API_ENDPOINT + '/api/auth/' + 'signup', user, httpOptions);
  }
}
