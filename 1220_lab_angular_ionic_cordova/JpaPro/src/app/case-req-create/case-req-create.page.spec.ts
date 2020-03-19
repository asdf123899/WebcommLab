import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CaseReqCreatePage } from './case-req-create.page';

describe('CaseReqCreatePage', () => {
  let component: CaseReqCreatePage;
  let fixture: ComponentFixture<CaseReqCreatePage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CaseReqCreatePage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CaseReqCreatePage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
