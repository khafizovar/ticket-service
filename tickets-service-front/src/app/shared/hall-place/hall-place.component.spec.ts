import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HallPlaceComponent } from './hall-place.component';

describe('HallPlaceComponent', () => {
  let component: HallPlaceComponent;
  let fixture: ComponentFixture<HallPlaceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HallPlaceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HallPlaceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
