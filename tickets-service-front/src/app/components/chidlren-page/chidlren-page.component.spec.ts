import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ChidlrenPageComponent } from './chidlren-page.component';

describe('ChidlrenPageComponent', () => {
  let component: ChidlrenPageComponent;
  let fixture: ComponentFixture<ChidlrenPageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ChidlrenPageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ChidlrenPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
