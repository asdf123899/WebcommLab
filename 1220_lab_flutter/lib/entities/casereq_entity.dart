import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_lab_app/entities/entities.dart';
import 'package:flutter_lab_app/enums/enums.dart';

part 'casereq_entity.g.dart';

@JsonSerializable()
class CasereqEntity {

   String caseNo;
   CaseMonitorLevelEnum monitorLevel;
   CaseTypeEnum type;
   EmployeeEntity manager;
   EmployeeEntity contact;
   DateTime startDate;
   DateTime endDate;
   String workItemDesc;

  CasereqEntity({this.caseNo, this.monitorLevel, this.type, this.manager, this.contact, this.startDate, this.endDate, this.workItemDesc});

  factory CasereqEntity.fromJson(Map<String, dynamic> json) => _$CasereqEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CasereqEntityToJson(this);

}
