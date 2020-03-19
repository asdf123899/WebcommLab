import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_lab_app/changeNotifiers/change_notifiers.dart';
import 'package:flutter_lab_app/repositories/repositories.dart';
import 'package:flutter_lab_app/utils/utils.dart';
import 'package:flutter_lab_app/screens/screens.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => CasereqRepository());
  locator.registerLazySingleton(() => EmployeeRepository());
  locator.registerLazySingleton(() => UnitRepository());
  locator.registerLazySingleton(() => CasereqChangeNotifier()) ;
}