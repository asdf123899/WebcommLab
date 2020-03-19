import { TestBed } from '@angular/core/testing';

import { CaseReqService } from './case-req.service';

describe('CaseReqService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: CaseReqService = TestBed.get(CaseReqService);
    expect(service).toBeTruthy();
  });
});
