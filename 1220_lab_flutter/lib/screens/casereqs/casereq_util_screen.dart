import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vnum/vnum.dart';

import 'package:flutter_lab_app/utils/locator.dart';
import 'package:flutter_lab_app/utils/utils.dart';
import 'package:flutter_lab_app/changeNotifiers/change_notifiers.dart';
import 'package:flutter_lab_app/widgets/widgets.dart';
import 'package:flutter_lab_app/searchBeans/search_beans.dart';
import 'package:flutter_lab_app/enums/enums.dart';
import 'package:flutter_lab_app/entities/entities.dart';

class CasereqUtilScreen {

  static List<DropdownMenuItem<String>> getSearchCaseMonitorLevelDropDownMenuItems(List<Vnum> caseMonitorLevels) {
    List<DropdownMenuItem<String>> list = new List();
    list.add(getDropDownMenuItem('全部', 'all'));
    caseMonitorLevels.forEach((aCaseMonitorLevel) => list.add(getDropDownMenuItem(CaseMonitorLevelEnum.fromJson(aCaseMonitorLevel.value).meaning(), aCaseMonitorLevel.value)));
    return list;
  }

  static List<DropdownMenuItem<String>> getSearchCaseTypeDropDownMenuItems(List<Vnum> caseTypes) {
    List<DropdownMenuItem<String>> list = new List();
    list.add(getDropDownMenuItem('全部', 'all'));
    caseTypes.forEach((aCaseType) => list.add(getDropDownMenuItem(CaseTypeEnum.fromJson(aCaseType.value).meaning(), aCaseType.value)));
    return list;
  }

  static List<DropdownMenuItem<String>> getSearchUnitsDropDownMenuItems(List<UnitEntity> units) {
    List<DropdownMenuItem<String>> list = new List();
    list.add(getDropDownMenuItem('全部', 'all'));
    units.forEach((aUnit) => list.add(getDropDownMenuItem(aUnit.unitName, aUnit.unitId)));
    return list;
  }

  static List<DropdownMenuItem<String>> getCaseMonitorLevelDropDownMenuItems(List<Vnum> caseMonitorLevels) {
    List<DropdownMenuItem<String>> list = new List();
    caseMonitorLevels.forEach((aCaseMonitorLevel) => list.add(getDropDownMenuItem(CaseMonitorLevelEnum.fromJson(aCaseMonitorLevel.value).meaning(), aCaseMonitorLevel.value)));
    return list;
  }

  static List<DropdownMenuItem<String>> getCaseTypeDropDownMenuItems(List<Vnum> caseTypes) {
    List<DropdownMenuItem<String>> list = new List();
    caseTypes.forEach((aCaseType) => list.add(getDropDownMenuItem(CaseTypeEnum.fromJson(aCaseType.value).meaning(), aCaseType.value)));
    return list;
  }

  static List<DropdownMenuItem<String>> getEmployeesDropDownMenuItems(List<EmployeeEntity> employees) {
    List<DropdownMenuItem<String>> list = new List();
    employees.forEach((aEmployee) => list.add(getDropDownMenuItem(aEmployee.unit.unitName + ' - ' + aEmployee.name, aEmployee.empId)));
    return list;
  }

  static List<DropdownMenuItem<String>> getOrderByDropDownMenuItems() {
    List<DropdownMenuItem<String>> list = new List();
    list.add(getDropDownMenuItem('依' + ValueUtil.casereqCaseNoName + '排序', 'caseNo'));
    list.add(getDropDownMenuItem('依' + ValueUtil.casereqStartDateName + '排序', 'startDate'));
    list.add(getDropDownMenuItem('依' + ValueUtil.casereqEndDateName + '排序', 'endDate'));
    return list;
  }

  static Widget getDropDownMenuItem(String name, String value) {
    return DropdownMenuItem<String>(
      child: Text(name),
      value: value,
    );
  }
}

class FormItemWidget extends StatelessWidget {
  final String label;
  final Widget childWidget;

  FormItemWidget(this.label, this.childWidget);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
            ),
          ),

          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1
                ),
              ),
              child: childWidget
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
          ),
        ]
    );
  }
}

class FormDateItemWidget extends StatelessWidget {

  final String label;
  final Function onPressFunction;
  final Widget childWidget;

//  FormDateItemWidget(this.label, this.childWidget);
  FormDateItemWidget(this.label, this.onPressFunction, this.childWidget);

  @override
  Widget build(BuildContext context) {
    return FormItemWidget(
      label,
      SizedBox(
        width: double.infinity,
        child: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 0),
          onPressed: () {
            onPressFunction();
          },
          child: SizedBox(
              width: double.infinity,
              child: childWidget
          ),
        ),
      ),
    );
  }
}