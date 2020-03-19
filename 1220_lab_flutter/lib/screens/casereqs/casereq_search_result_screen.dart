import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter_lab_app/changeNotifiers/change_notifiers.dart';
import 'package:flutter_lab_app/entities/entities.dart';
import 'package:flutter_lab_app/utils/utils.dart';
import 'package:flutter_lab_app/utils/locator.dart';
import 'package:flutter_lab_app/searchBeans/search_beans.dart';
import 'package:flutter_lab_app/screens/screens.dart';
import 'package:flutter_lab_app/enums/enums.dart';

class CasereqSearchResultScreen extends StatefulWidget {
  @override
  _CasereqSearchResultScreenState createState() => _CasereqSearchResultScreenState();
}

class _CasereqSearchResultScreenState extends State<CasereqSearchResultScreen> {

  ScrollController _scrollController;
  List<CasereqEntity> casereqsByPage;
  CasereqSearchBean casereqSearchBean;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    CasereqChangeNotifier _casereqChangeNotifier = locator<CasereqChangeNotifier>();
    casereqSearchBean = _casereqChangeNotifier.casereqSearchBean;

    print('in the result init : ' + casereqSearchBean.page.toString());
    super.initState();
  }

  _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        print('Loading the next page...');
      });
    }
  }

  @override
  void dispose() {
    print('in the result dispose : ' + casereqSearchBean.page.toString());

    _scrollController.dispose();
    CasereqChangeNotifier _casereqChangeNotifier = locator<CasereqChangeNotifier>();
    _casereqChangeNotifier.searchByPageInit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _casereqProvider = Provider.of<CasereqChangeNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(ValueUtil.searchResultViewName),
        ),
        body: FutureBuilder<bool>(
          future:  _casereqProvider.searchByPage(),
          builder: (context, snapshot) {
            casereqsByPage = _casereqProvider.casereqsByPage;
            if (snapshot.data == true && casereqsByPage.length != 0) {
              return ListView.builder(
                  itemCount: casereqsByPage.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    if(index == 0) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButton<String>(
                          items: CasereqUtilScreen.getOrderByDropDownMenuItems(),
                          onChanged: (value) {
                            casereqSearchBean.orderBy = value;
                            _casereqProvider.searchByPageInit().whenComplete((){
                              setState(() {});
                            });
                          },
                          value: casereqSearchBean.orderBy,
                        ),
                      );
                    }
                    CasereqEntity aCasereq = casereqsByPage[index-1];
                    return Card(
                        child: Slidable(
                            key: ValueKey(index),
                            actionPane: SlidableDrawerActionPane(),
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                caption: ValueUtil.updateName,
                                color: Colors.blue,
                                icon: Icons.edit,
                                onTap: () {
                                  _casereqProvider.findOne(aCasereq.caseNo).whenComplete((){
                                    Navigator.pushNamed(context, RouteUtil.casereqUpdateRoute);
                                  });
                                },
                              ),
                              IconSlideAction(
                                caption: ValueUtil.deleteName,
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () {
                                  _casereqProvider.delete(aCasereq.caseNo).whenComplete((){
                                    setState(() {});
                                  });
                                },
                              ),
                            ],
                            child: ListTile(
                                title: Text(aCasereq.caseNo + ': ' + aCasereq.type.meaning() + ', ' + aCasereq.monitorLevel.meaning()),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(ValueUtil.casereqManagerUnitName + ': ' + StringUtil.formatValueAndSubValue(aCasereq.manager.unit.unitName, aCasereq.manager.name)),
                                    Text(ValueUtil.casereqContactUnitName + ': ' + StringUtil.formatValueAndSubValue(aCasereq.contact.unit.unitName, aCasereq.contact.name)),
                                    Text(ValueUtil.casereqStartDateToEndDateName + ': ' + DateUtil.getDateString(aCasereq.startDate) + ' ~ ' + DateUtil.getDateString(aCasereq.endDate)),
                                  ],
                                )
                            )
                        )
                    );
                  },
                );
            } else if (snapshot.data == true && casereqsByPage.length == 0) {
              return Center(child: Text('查無資料'));
            } else if (snapshot.data == false) {
              return Text('Error: ' + '${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        )
    );
  }
}
