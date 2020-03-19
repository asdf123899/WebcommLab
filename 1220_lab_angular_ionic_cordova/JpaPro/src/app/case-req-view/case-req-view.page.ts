import { Component, OnInit } from '@angular/core';
import { CaseReqService } from '../case-req.service';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { CaseTypeEnum } from '../caseTypeEnum.enum';
import { CaseMonitorLevelEnum } from '../caseMonitorLevelEnum.enum';

@Component({
  selector: 'app-case-req-view',
  templateUrl: './case-req-view.page.html',
  styleUrls: ['./case-req-view.page.scss'],
})
export class CaseReqViewPage implements OnInit {
  caseReq$;
  caseTypeEnum = CaseTypeEnum;
  caseMonitorLevelEnum = CaseMonitorLevelEnum;

  constructor(private location: Location, private caseReqService: CaseReqService, private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {
    this.route.paramMap.subscribe(params => {
      this.caseReqService.getOneCaseReq( params.get('caseNo'))
      .then(response => { this.caseReq$ = JSON.parse(response.data); });
      });
  }

  goToCaseReqSearchResult() {
    const searchbean = JSON.parse(localStorage.getItem('searchbean'));
    this.router.navigate(['oa/caseReq/caseReqSearchResult', searchbean]);
  }

}
