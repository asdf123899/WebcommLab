// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casereq_search_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CasereqSearchBean _$CasereqSearchBeanFromJson(Map<String, dynamic> json) {
  return CasereqSearchBean(
    monitorLevel: json['monitorLevel'] == null
        ? null
        : CaseMonitorLevelEnum.fromJson(json['monitorLevel']),
    type: json['type'] == null ? null : CaseTypeEnum.fromJson(json['type']),
    managerUnit: json['managerUnit'] == null
        ? null
        : UnitEntity.fromJson(json['managerUnit'] as Map<String, dynamic>),
    contactUnit: json['contactUnit'] == null
        ? null
        : UnitEntity.fromJson(json['contactUnit'] as Map<String, dynamic>),
    size: json['size'] as int,
    page: json['page'] as int,
    orderBy: json['orderBy'] as String,
  );
}

Map<String, dynamic> _$CasereqSearchBeanToJson(CasereqSearchBean instance) =>
    <String, dynamic>{
      'monitorLevel': instance.monitorLevel,
      'type': instance.type,
      'managerUnit': instance.managerUnit,
      'contactUnit': instance.contactUnit,
      'size': instance.size,
      'page': instance.page,
      'orderBy': instance.orderBy,
    };
