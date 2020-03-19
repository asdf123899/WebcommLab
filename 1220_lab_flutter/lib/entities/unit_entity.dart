import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_lab_app/entities/entities.dart';
import 'package:flutter_lab_app/enums/enums.dart';

part 'unit_entity.g.dart';

@JsonSerializable()
class UnitEntity {

  String unitId;
  String unitName;

  UnitEntity({this.unitId, this.unitName});

  factory UnitEntity.fromJson(Map<String, dynamic> json) => _$UnitEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UnitEntityToJson(this);

}
