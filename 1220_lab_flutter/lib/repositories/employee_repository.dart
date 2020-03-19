import 'dart:async';
import 'dart:core';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_lab_app/entities/entities.dart';
import 'package:flutter_lab_app/searchBeans/search_beans.dart';
import 'package:flutter_lab_app/utils/utils.dart';

class EmployeeRepository {

  static final findAllEmployeesUrl = HttpUtil.baseUrl + 'caseReq/getEmpList';

  Future<List<EmployeeEntity>> findAll() async {
    final response = await http.get(findAllEmployeesUrl);
    if (response.statusCode == 200) {
      final json = JsonDecoder().convert(response.body);
      final employees = json.map<EmployeeEntity>((employee) => EmployeeEntity.fromJson(employee)).toList();
      return employees;
    } else {
      throw Exception('EmployeeRepository findAll failed.');
    }
  }

}
