import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CurrentActivityComponent } from './currentActivity.component';

describe('ConcertComponent', () => {
  let component: CurrentActivityComponent;
  let fixture: ComponentFixture<CurrentActivityComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CurrentActivityComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CurrentActivityComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
