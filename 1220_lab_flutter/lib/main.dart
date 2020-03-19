import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reflectable/reflectable.dart';

import 'main.reflectable.dart';

import 'package:flutter_lab_app/changeNotifiers/change_notifiers.dart';
import 'package:flutter_lab_app/repositories/repositories.dart';
import 'package:flutter_lab_app/utils/utils.dart';
import 'package:flutter_lab_app/screens/screens.dart';
import 'package:flutter_lab_app/utils/locator.dart';
import 'package:flutter_lab_app/enums/enums.dart';
import 'package:flutter_lab_app/entities/entities.dart';

void main() {
  setupLocator();
  initializeReflectable();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => locator<CasereqChangeNotifier>()),
      ],
      child: MaterialApp(
        title: ValueUtil.appName,
        theme: ThemeData(),
        initialRoute: RouteUtil.casereqSearchRoute,
        routes: routes(),
      ),
    );
  }

  Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      RouteUtil.casereqSearchRoute: (context) => CasereqSearchScreen(),
      RouteUtil.casereqSearchResultRoute: (context) => CasereqSearchResultScreen(),
      RouteUtil.casereqCreateRoute: (context) => CasereqCreateScreen(),
      RouteUtil.casereqUpdateRoute: (context) => CasereqUpdateScreen(),
    };
  }

}