import 'dart:async';
import 'dart:core';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_lab_app/entities/entities.dart';
import 'package:flutter_lab_app/searchBeans/search_beans.dart';
import 'package:flutter_lab_app/utils/utils.dart';

class UnitRepository {

  static final findAllUnitsUrl = HttpUtil.baseUrl + 'caseReq/getUnitList';

  Future<List<UnitEntity>> findAll() async {
    final response = await http.get(findAllUnitsUrl);
    if (response.statusCode == 200) {
      final json = JsonDecoder().convert(response.body);
      final units = json.map<UnitEntity>((unit) => UnitEntity.fromJson(unit)).toList();
      return units;
    } else {
      throw Exception('UnitRepository findAll failed.');
    }
  }

}
