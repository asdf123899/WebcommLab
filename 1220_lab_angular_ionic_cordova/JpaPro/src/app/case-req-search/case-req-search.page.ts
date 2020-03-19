import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder } from '@angular/forms';
import { CaseTypeEnum } from '../caseTypeEnum.enum';
import { CaseMonitorLevelEnum } from '../caseMonitorLevelEnum.enum';
import { CaseReqService } from '../case-req.service';

@Component({
  selector: 'app-case-req-search',
  templateUrl: './case-req-search.page.html',
  styleUrls: ['./case-req-search.page.scss'],
})
export class CaseReqSearchPage implements OnInit {
  searchForm;
  caseTypeEnum = CaseTypeEnum;
  caseMonitorLevelEnum = CaseMonitorLevelEnum;
  empList$;
  type$;
  monitorLevel$;
  keys = Object.keys;

  constructor(private formBuilder: FormBuilder, private caseReqService: CaseReqService,  private router: Router) {
    this.searchForm = this.formBuilder.group({
      monitorLevel: '',
      type: '',
      managerUnit: '',
      contactUnit: ''
    });
    this.type$ = Object.keys(this.caseTypeEnum)[0];
    this.monitorLevel$ = Object.keys(this.caseMonitorLevelEnum)[0];
   }

    ngOnInit() {
     this.getEmpList();
  }

  getEmpList() {
    this.caseReqService.getEmpList()
    .then(response => { this.empList$ = JSON.parse(response.data);
    });
  }

  goToCaseReqSearchResult(searchbean) {
    this.router.navigate(['oa/caseReq/caseReqSearchResult', searchbean]);
  }

  onSubmit(customerData) {
    localStorage.setItem('searchbean', JSON.stringify(this.searchForm.value));
    this.goToCaseReqSearchResult(this.searchForm.value);
    this.searchForm.reset({monitorLevel : this.monitorLevel$ , type : this.type$});
  }

}
