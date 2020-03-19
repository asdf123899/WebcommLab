import 'package:vnum/vnum.dart';

@VnumDefinition
class CaseTypeEnum extends Vnum<String> {

  static const CaseTypeEnum general = const CaseTypeEnum.define("General");
  static const CaseTypeEnum tempControl = const CaseTypeEnum.define("TempControl");
  static const CaseTypeEnum noControl = const CaseTypeEnum.define("NoControl");

  const CaseTypeEnum.define(String fromValue) : super.define(fromValue);

  dynamic toJson() => this.value;
  factory CaseTypeEnum.fromJson(dynamic json) => CaseTypeEnum.define(json);

  String meaning() {
    if (value == CaseTypeEnum.general.value) {
      return "總綱目";
    } else if (value == CaseTypeEnum.tempControl.value) {
      return "臨時列管";
    } else if (value == CaseTypeEnum.noControl.value) {
      return "非列管(原Ａ類案件)";
    }
    return "未知項目";
  }

}
