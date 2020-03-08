import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {CitiesService} from '../../services/cities.service';

@Component({
  selector: 'app-city-selector',
  templateUrl: './city-selector.component.html',
  styleUrls: ['./city-selector.component.css']
})
export class CitySelectorComponent implements OnInit {
  @Output() citySelectedEvent = new EventEmitter();
  @Output() citySelectedEventExample = new EventEmitter();

  constructor(
    private citiesService: CitiesService
  ) {
  }

  selectedCity = 'Moscow';

  // Список городов
  public citiesList: Array<string> = [];

  ngOnInit() {
    console.log("citySElec="+this.selectedCity);
    this.citiesService.getCitiesListGet().subscribe((cities) => {
      this.citiesList = [];
      cities.map(item => {
        this.citiesList.push(item.city);
      });
    });
  }
}
