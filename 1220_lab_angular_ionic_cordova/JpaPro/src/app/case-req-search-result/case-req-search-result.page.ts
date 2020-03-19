import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CaseReqService } from '../case-req.service';
import { AlertController } from '@ionic/angular';
import { CaseMonitorLevelEnum } from '../caseMonitorLevelEnum.enum';

@Component({
  selector: 'app-case-req-search-result',
  templateUrl: './case-req-search-result.page.html',
  styleUrls: ['./case-req-search-result.page.scss'],
})
export class CaseReqSearchResultPage implements OnInit {
  searchbean;
  caseReqs$;
  caseMonitorLevelEnum = CaseMonitorLevelEnum;
  keys = Object.keys;
  param;

  // tslint:disable-next-line:max-line-length
  constructor(private caseReqService: CaseReqService, private router: Router, private route: ActivatedRoute, public alertController: AlertController) { }

  ngOnInit() {
    this.route.paramMap.subscribe(params => {
    this.searchbean = params;
    this.getCaseReqs(params);
    });
  }

  getCaseReqs(param) {
    this.caseReqService.getCaseReqs(param)
    .then(response => { this.caseReqs$ = JSON.parse(response.data); });
  }

  goToCaseReqSearchResult() {
    const searchbean = JSON.parse(localStorage.getItem('searchbean'));
    this.router.navigate(['oa/caseReq/caseReqSearchResult', searchbean]);
  }

  async presentAlertMultipleButtons(caseNo) {
    const alert = await this.alertController.create({
      header: '確定刪除嗎?',
      buttons: [
        {
          text: '取消',
          role: 'cancel',
          cssClass: 'secondary',
          handler: (blah) => {
            console.log('Confirm Cancel: blah');
          }
        }, {
          text: '確定',
          handler: () => {
            this.caseReqService.deleteCaseReq(caseNo)
            .then(response => { this.getCaseReqs(this.searchbean); });
          }
        }
      ]
    });

    await alert.present();
  }

}
