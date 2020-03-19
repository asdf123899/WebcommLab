import { Component, OnInit } from '@angular/core';
import { CaseReqService } from '../case-req.service';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { CaseTypeEnum } from '../caseTypeEnum.enum';
import { CaseMonitorLevelEnum } from '../caseMonitorLevelEnum.enum';

@Component({
  selector: 'app-case-req-create',
  templateUrl: './case-req-create.page.html',
  styleUrls: ['./case-req-create.page.scss'],
})
export class CaseReqCreatePage implements OnInit {
  empList$;
  createForm: FormGroup;
  caseTypeEnum = CaseTypeEnum;
  caseMonitorLevelEnum = CaseMonitorLevelEnum;
  keys = Object.keys;
  type$ = Object.keys(this.caseTypeEnum)[0];
  monitorLevel$ = Object.keys(this.caseMonitorLevelEnum)[0];
  manager$;
  contact$;
  // tslint:disable-next-line:variable-name
  validation_messages = {
    startDate: [
      { type: 'required', message: '開始日期為必填' },
    ],
    endDate: [
      { type: 'required', message: '結束日期為必填' },
    ],
    workItemDesc: [
      { type: 'required', message: '工作項目為必填' },
    ]
  };
  constructor(private caseReqService: CaseReqService, private formBuilder: FormBuilder, private router: Router) {
    this.createForm = this.formBuilder.group({
      monitorLevel: '',
      type: '',
      manager: '',
      contact: '',
      startDate: ['', Validators.required],
      endDate: ['', Validators.required],
      workItemDesc: ['', Validators.required]
    });
  }

  ngOnInit() {
    this.getEmpList();
  }

  getEmpList() {
    this.caseReqService.getEmpList()
      .then(response => {
        this.empList$ = JSON.parse(response.data);
      });
  }

  goToCaseReqSearchResult() {
    const searchbean = JSON.parse(localStorage.getItem('searchbean'));
    this.router.navigate(['oa/caseReq/caseReqSearchResult', searchbean]);
  }

  validateAllFormFields(formGroup: FormGroup) {
  Object.keys(formGroup.controls).forEach(field => {
    const control = formGroup.get(field);
    if (control instanceof FormControl) {
      control.markAsTouched({ onlySelf: true });
    } else if (control instanceof FormGroup) {
      this.validateAllFormFields(control);
    }
  });
}

  onSubmit(customerData) {
    if (this.createForm.valid) {
      this.caseReqService.createOrUpdateCaseReq(this.createForm.value)
        .then(() => {
          this.createForm.reset({ monitorLevel: Object.keys(this.caseMonitorLevelEnum)[0], type: Object.keys(this.caseTypeEnum)[0] });
          this.goToCaseReqSearchResult();
        });
    } else {
      this.validateAllFormFields(this.createForm);
    }
  }

}
