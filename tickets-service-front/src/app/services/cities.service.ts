import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import {Observable} from 'rxjs';
import {AppConfig} from '../../config';
import {map} from 'rxjs/operators';


interface City {
  id: string;
  city: string;
}

@Injectable({
  providedIn: 'root'
})
export class CitiesService {

  constructor(private http: HttpClient) { }

  getCitiesListGet(): Observable<Array<City>> {
    return this.http.get<Array<City>>(AppConfig.API_ENDPOINT + '/city', {})
      .pipe(map((response: any) => {
        return response;
      }));
  }
}
