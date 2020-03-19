import { Injectable } from '@angular/core';
import { ParamMap } from '@angular/router';
import { HTTP, HTTPResponse } from '@ionic-native/http/ngx';

@Injectable({
  providedIn: 'root'
})
export class CaseReqService {

  constructor(private http: HTTP) { }

  getEmpList() {
    return this.http.get('http://10.0.75.1:8085/oa/caseReq/getEmpList', {}, {});
  }

  getCaseReqs(params: ParamMap) {
    const monitorLevel = params.get('monitorLevel');
    const type = params.get('type');
    const managerUnit = params.get('managerUnit');
    const contactUnit = params.get('contactUnit');
    // tslint:disable-next-line:max-line-length
    const url = 'http://10.0.75.1:8085/oa/caseReq/caseReqSearch?monitorLevel=' + monitorLevel + '&type=' + type + '&managerUnit=' + managerUnit + '&contactUnit=' + contactUnit ;
    return this.http.get(url, {}, {});
  }

  getOneCaseReq(caseNo) {
    const url = 'http://10.0.75.1:8085/oa/caseReq/getOneCaseReq?caseNo=' + caseNo;
    return this.http.get(url, {}, {});
  }

  createOrUpdateCaseReq(caseReq) {
    this.http.setDataSerializer('json');
    return this.http.post('http://10.0.75.1:8085/oa/caseReq/addOrUpdateCaseReq', caseReq, {});
  }

  deleteCaseReq(caseNo) {
    const url = 'http://10.0.75.1:8085/oa/caseReq/deleteCaseReq?caseNo=' + caseNo;
    return this.http.get(url, {}, {});
  }
}
