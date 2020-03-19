import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CaseReqService } from '../case-req.service';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';
import { CaseTypeEnum } from '../caseTypeEnum.enum';
import { CaseMonitorLevelEnum } from '../caseMonitorLevelEnum.enum';
import { Location } from '@angular/common';

@Component({
  selector: 'app-case-req-update',
  templateUrl: './case-req-update.page.html',
  styleUrls: ['./case-req-update.page.scss'],
})
export class CaseReqUpdatePage implements OnInit {
  empList$;
  updateForm: FormGroup;
  caseTypeEnum = CaseTypeEnum;
  caseMonitorLevelEnum = CaseMonitorLevelEnum;
  keys = Object.keys;
  caseReq$;
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

  // tslint:disable-next-line:max-line-length
  constructor(private location: Location, private caseReqService: CaseReqService, private formBuilder: FormBuilder, private router: Router, private route: ActivatedRoute) {
    this.updateForm = this.formBuilder.group({
      caseNo: '',
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
    this.route.paramMap.subscribe(params => {
      this.caseReqService.getOneCaseReq(params.get('caseNo'))
        .then(response => { this.caseReq$ = JSON.parse(response.data); });
    });
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
    if (this.updateForm.valid) {
      // Process checkout data here
      this.caseReqService.createOrUpdateCaseReq(this.updateForm.value).
        then(() => {
          this.goToCaseReqSearchResult();
          this.updateForm.reset();
        });
    } else {
      this.validateAllFormFields(this.updateForm);
    }
  }

}
