import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_lab_app/entities/entities.dart';
import 'package:flutter_lab_app/searchBeans/search_beans.dart';
import 'package:flutter_lab_app/utils/utils.dart';
import 'package:flutter_lab_app/enums/enums.dart';

part 'casereq_search_bean.g.dart';

@JsonSerializable()
class CasereqSearchBean {

  CaseMonitorLevelEnum monitorLevel;
  CaseTypeEnum type;
  UnitEntity managerUnit;
  UnitEntity contactUnit;

  int size;
  int page;
  String orderBy;

  CasereqSearchBean({this.monitorLevel, this.type, this.managerUnit, this.contactUnit, this.size, this.page, this.orderBy});

  factory CasereqSearchBean.fromJson(Map<String, dynamic> json) =>  _$CasereqSearchBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CasereqSearchBeanToJson(this);

}
