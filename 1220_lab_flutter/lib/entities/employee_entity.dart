import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_lab_app/entities/entities.dart';
import 'package:flutter_lab_app/enums/enums.dart';

part 'employee_entity.g.dart';

@JsonSerializable()
class EmployeeEntity {

  String empId;
  String name;
  UnitEntity unit;

  EmployeeEntity({this.empId, this.name, this.unit});

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) => _$EmployeeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeEntityToJson(this);

}
