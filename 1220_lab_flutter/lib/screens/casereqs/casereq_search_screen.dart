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
import 'package:flutter_lab_app/screens/screens.dart';

class CasereqSearchScreen extends StatefulWidget {
  @override
  _CasereqSearchScreenState createState() => _CasereqSearchScreenState();
}

class _CasereqSearchScreenState extends State<CasereqSearchScreen> {

  String selectedCaseType;
  String selectedCaseMonitorLevel;
  String selectedManager;
  String selectedContact;

  Future<bool> preSearch;
  CasereqSearchBean casereqSearchBean;

  @override
  void initState() {
    super.initState();
    CasereqChangeNotifier _casereqChangeNotifier = locator<CasereqChangeNotifier>();
    preSearch = _casereqChangeNotifier.preSearch();
    casereqSearchBean = _casereqChangeNotifier.casereqSearchBean;
    selectedCaseType = (casereqSearchBean.type != null) ? casereqSearchBean.type.value : 'all';
    selectedCaseMonitorLevel = (casereqSearchBean.monitorLevel != null) ? casereqSearchBean.monitorLevel.value : 'all';
    selectedManager = (casereqSearchBean.managerUnit != null) ? casereqSearchBean.managerUnit.unitId : 'all';
    selectedContact = (casereqSearchBean.contactUnit != null) ? casereqSearchBean.contactUnit.unitId : 'all';
  }

  @override
  Widget build(BuildContext context) {
    final _casereqProvider = Provider.of<CasereqChangeNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(ValueUtil.oaName),
        ),
        drawer: DrawerWidget.getDrawerWidget(),
        body: FutureBuilder<bool>(
          future: preSearch,
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return SingleChildScrollView(
                  child:Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FormItemWidget(
                            ValueUtil.casereqTypeName,
                            DropdownButton<String>(
                              items: CasereqUtilScreen.getSearchCaseTypeDropDownMenuItems(_casereqProvider.caseTypes),
                              onChanged: (value) {
                                setState(() {
                                  selectedCaseType = value;
                                  casereqSearchBean.type = (selectedCaseType != 'all') ? CaseTypeEnum.fromJson(selectedCaseType): null;
                                });
                              },
                              isExpanded: true,
                              value: selectedCaseType,
                            )
                        ),
                        FormItemWidget(
                            ValueUtil.casereqMonitorLevelName,
                            DropdownButton<String>(
                              items: CasereqUtilScreen.getSearchCaseMonitorLevelDropDownMenuItems(_casereqProvider.caseMonitorLevels),
                              onChanged: (value) {
                                setState(() {
                                  selectedCaseMonitorLevel = value;
                                  casereqSearchBean.monitorLevel = (selectedCaseMonitorLevel != 'all') ? CaseMonitorLevelEnum.fromJson(selectedCaseMonitorLevel) : null;
                                });
                              },
                              isExpanded: true,
                              value: selectedCaseMonitorLevel,
                            )
                        ),
                        FormItemWidget(
                            ValueUtil.casereqManagerUnitName,
                            DropdownButton<String>(
                              items: CasereqUtilScreen.getSearchUnitsDropDownMenuItems(_casereqProvider.units),
                              onChanged: (value) {
                                setState(() {
                                  selectedManager = value;
                                  casereqSearchBean.managerUnit = (selectedManager != 'all') ? UnitEntity(unitId: selectedManager) : null;
                                });
                              },
                              isExpanded: true,
                              value: selectedManager,
                            )
                        ),
                        FormItemWidget(
                            ValueUtil.casereqContactUnitName,
                            DropdownButton<String>(
                              items: CasereqUtilScreen.getSearchUnitsDropDownMenuItems(_casereqProvider.units),
                              onChanged: (value) {
                                setState(() {
                                  selectedContact = value;
                                  casereqSearchBean.contactUnit = (selectedContact != 'all') ? UnitEntity(unitId: selectedContact) : null;
                                });
                              },
                              isExpanded: true,
                              value: selectedContact,
                            )
                        ),
                        Center(
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RouteUtil.casereqSearchResultRoute);
                              },
                              child: Text(ValueUtil.searchName),
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
