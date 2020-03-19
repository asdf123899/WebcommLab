// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeEntity _$EmployeeEntityFromJson(Map<String, dynamic> json) {
  return EmployeeEntity(
    empId: json['empId'] as String,
    name: json['name'] as String,
    unit: json['unit'] == null
        ? null
        : UnitEntity.fromJson(json['unit'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EmployeeEntityToJson(EmployeeEntity instance) =>
    <String, dynamic>{
      'empId': instance.empId,
      'name': instance.name,
      'unit': instance.unit,
    };
