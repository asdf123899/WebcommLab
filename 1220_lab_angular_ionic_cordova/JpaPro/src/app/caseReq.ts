import { Employee } from './employee';
import { CaseMonitorLevelEnum } from './caseMonitorLevelEnum.enum';
import { CaseTypeEnum } from './caseTypeEnum.enum';

export class CaseReq {
    caseNo: string;
    monitorLevel: CaseMonitorLevelEnum;
    type: CaseTypeEnum;
    manager: Employee;
    contact: Employee;
    startDate: Date;
    endDate: Date;
    workItemDesc: string;
}
