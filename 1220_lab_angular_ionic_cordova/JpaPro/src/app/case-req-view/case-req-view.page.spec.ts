import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CaseReqViewPage } from './case-req-view.page';

describe('CaseReqViewPage', () => {
  let component: CaseReqViewPage;
  let fixture: ComponentFixture<CaseReqViewPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CaseReqViewPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CaseReqViewPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
