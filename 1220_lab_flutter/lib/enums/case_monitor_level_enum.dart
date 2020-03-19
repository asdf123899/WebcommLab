import 'package:vnum/vnum.dart';

@VnumDefinition
class CaseMonitorLevelEnum extends Vnum<String> {

  static const CaseMonitorLevelEnum reportForControl = const CaseMonitorLevelEnum.define("ReportForControl");
  static const CaseMonitorLevelEnum deptControl = const CaseMonitorLevelEnum.define("DeptControl");
  static const CaseMonitorLevelEnum bureauControl = const CaseMonitorLevelEnum.define("BureauControl");
  static const CaseMonitorLevelEnum noControl = const CaseMonitorLevelEnum.define("NoControl");

  const CaseMonitorLevelEnum.define(String fromValue) : super.define(fromValue);
  factory CaseMonitorLevelEnum(String value) => Vnum.fromValue(value, CaseMonitorLevelEnum);

  dynamic toJson() => this.value;
  factory CaseMonitorLevelEnum.fromJson(dynamic json) => CaseMonitorLevelEnum.define(json);

  String meaning() {
    if (value == CaseMonitorLevelEnum.reportForControl.value) {
      return "報部列管";
    } else if (value == CaseMonitorLevelEnum.deptControl.value) {
      return "科室列管";
    } else if (value == CaseMonitorLevelEnum.bureauControl.value) {
      return "局列管";
    } else if (value == CaseMonitorLevelEnum.noControl.value) {
      return "不列管";
    }
    return "未知項目";
  }

}