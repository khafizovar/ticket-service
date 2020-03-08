import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TestHallComponent } from './test-hall.component';

describe('TestHallComponent', () => {
  let component: TestHallComponent;
  let fixture: ComponentFixture<TestHallComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TestHallComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TestHallComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
