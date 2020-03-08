import { TestBed } from '@angular/core/testing';

import { TicketUserService } from './ticket-user.service';

describe('TicketUserService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TicketUserService = TestBed.get(TicketUserService);
    expect(service).toBeTruthy();
  });
});
