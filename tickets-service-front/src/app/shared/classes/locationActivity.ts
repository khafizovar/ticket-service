import {City} from "./city";

export class LocationActivity {
  id: number;
  titlePlace: string;
  cityId: number;
  longitude: number;
  latitude: number;
  city: City;

  constructor(id: number, titlePlace: string, cityId: number, longitude: number, latitude: number, city: City) {
    this.id = id;
    this.titlePlace = titlePlace;
    this.cityId = cityId;
    this.longitude = longitude;
    this.latitude = latitude;
    this.city = city;
  }
}

