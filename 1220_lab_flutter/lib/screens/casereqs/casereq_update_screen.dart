import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:flutter_lab_app/changeNotifiers/change_notifiers.dart';
import 'package:flutter_lab_app/entities/entities.dart';
import 'package:flutter_lab_app/utils/utils.dart';
import 'package:flutter_lab_app/widgets/widgets.dart';
import 'package:flutter_lab_app/utils/locator.dart';
import 'package:flutter_lab_app/screens/screens.dart';
import 'package:flutter_lab_app/enums/enums.dart';

class CasereqUpdateScreen extends StatefulWidget {
  @override
  _CasereqUpdateScreenState createState() => _CasereqUpdateScreenState();
}

class _CasereqUpdateScreenState extends State<CasereqUpdateScreen> {

  Future<bool> preUpdate;
  CasereqEntity casereq;

  @override
  void initState() {
    super.initState();
    CasereqChangeNotifier _casereqChangeNotifier = locator<CasereqChangeNotifier>();
    preUpdate = _casereqChangeNotifier.preUpdate();
  }

  @override
  Widget build(BuildContext context) {
    final _casereqProvider = Provider.of<CasereqChangeNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(ValueUtil.updateViewName),
        ),
        body: FutureBuilder<bool>(
          future: preUpdate,
          builder: (context, snapshot) {
            casereq = _casereqProvider.casereq;
            if (snapshot.data == true) {
              return SingleChildScrollView(
                  child:Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        FormItemWidget(
                          ValueUtil.casereqCaseNoName,
                          TextFormField(
                            initialValue: casereq.caseNo,
                            readOnly: true,
                          ),
                        ),
                        FormItemWidget(
                            ValueUtil.casereqMonitorLevelName,
                            DropdownButton<String>(
                              items: CasereqUtilScreen.getCaseMonitorLevelDropDownMenuItems(_casereqProvider.caseMonitorLevels),
                              onChanged: (value) {
                                setState(() {
                                  casereq.monitorLevel = CaseMonitorLevelEnum.fromJson(value);
                                });
                              },
                              isExpanded: true,
                              value: casereq.monitorLevel.value,
                            )
                        ),
                        FormItemWidget(
                            ValueUtil.casereqTypeName,
                            DropdownButton<String>(
                              items: CasereqUtilScreen.getCaseTypeDropDownMenuItems(_casereqProvider.caseTypes),
                              onChanged: (value) {
                                setState(() {
                                  casereq.type = CaseTypeEnum.fromJson(value);
                                });
                              },
                              isExpanded: true,
                              value: casereq.type.value,
                            )
                        ),
                        FormItemWidget(
                            ValueUtil.casereqManagerName,
                            DropdownButton<String>(
                              items: CasereqUtilScreen.getEmployeesDropDownMenuItems(_casereqProvider.employees),
                              onChanged: (value) {
                                setState(() {
                                  casereq.manager = EmployeeEntity(empId: value);
                                });
                              },
                              isExpanded: true,
                              value: casereq.manager.empId,
                            )
                        ),
                        FormItemWidget(
                            ValueUtil.casereqContactName,
                            DropdownButton<String>(
                              items: CasereqUtilScreen.getEmployeesDropDownMenuItems(_casereqProvider.employees),
                              onChanged: (value) {
                                setState(() {
                                  casereq.contact = EmployeeEntity(empId: value);
                                });
                              },
                              isExpanded: true,
                              value: casereq.contact.empId,
                            )
                        ),
                        FormDateItemWidget(
                          ValueUtil.casereqStartDateName,
                              () {
                            DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() {
                                    casereq.startDate = date;
                                  });
                                },
                                currentTime: casereq.startDate,
                                locale: LocaleType.zh
                            );
                          },
                          Text(DateUtil.getDateString(casereq.startDate)),
                        ),
                        FormDateItemWidget(
                          ValueUtil.casereqEndDateName,
                              () {
                            DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() {
                                    casereq.endDate = date;
                                  });
                                },
                                currentTime: casereq.endDate,
                                locale: LocaleType.zh
                            );
                          },
                          Text(DateUtil.getDateString(casereq.endDate)),
                        ),
                        FormItemWidget(
                          ValueUtil.casereqWorkItemDescName,
                          TextFormField(
                            initialValue: casereq.workItemDesc,
                            maxLines: 3,
                            onChanged: (value){
                              setState(() {
                                casereq.workItemDesc = value;
                              });
                            },
                          ),
                        ),
                        Center(
                            child: RaisedButton(
                              onPressed: () {
                                _casereqProvider.update().whenComplete((){
//                                  Navigator.popAndPushNamed(context, RouteUtil.casereqSearchResultRoute);
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(ValueUtil.updateName),
                            )
                        ),
                      ],
                    ),
                  )
              );
            } else if (snapshot.data == false) {
              return Text('Error: ' + '${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        )
    );
  }

}