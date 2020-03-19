import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CaseReqSearchResultPage } from './case-req-search-result.page';

describe('CaseReqSearchResultPage', () => {
  let component: CaseReqSearchResultPage;
  let fixture: ComponentFixture<CaseReqSearchResultPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CaseReqSearchResultPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CaseReqSearchResultPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
