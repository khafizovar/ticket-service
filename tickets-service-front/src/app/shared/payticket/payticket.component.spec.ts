import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PayticketComponent } from './payticket.component';

describe('PayticketComponent', () => {
  let component: PayticketComponent;
  let fixture: ComponentFixture<PayticketComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PayticketComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PayticketComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
