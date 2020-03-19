// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casereq_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CasereqEntity _$CasereqEntityFromJson(Map<String, dynamic> json) {
  return CasereqEntity(
    caseNo: json['caseNo'] as String,
    monitorLevel: json['monitorLevel'] == null
        ? null
        : CaseMonitorLevelEnum.fromJson(json['monitorLevel']),
    type: json['type'] == null ? null : CaseTypeEnum.fromJson(json['type']),
    manager: json['manager'] == null
        ? null
        : EmployeeEntity.fromJson(json['manager'] as Map<String, dynamic>),
    contact: json['contact'] == null
        ? null
        : EmployeeEntity.fromJson(json['contact'] as Map<String, dynamic>),
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    workItemDesc: json['workItemDesc'] as String,
  );
}

Map<String, dynamic> _$CasereqEntityToJson(CasereqEntity instance) =>
    <String, dynamic>{
      'caseNo': instance.caseNo,
      'monitorLevel': instance.monitorLevel,
      'type': instance.type,
      'manager': instance.manager,
      'contact': instance.contact,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'workItemDesc': instance.workItemDesc,
    };
