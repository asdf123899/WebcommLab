import 'dart:async';
import 'dart:core';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_lab_app/entities/entities.dart';
import 'package:flutter_lab_app/searchBeans/search_beans.dart';
import 'package:flutter_lab_app/utils/utils.dart';
import 'package:flutter_lab_app/utils/utils.dart';

class CasereqRepository {

  static final casereqUrl = HttpUtil.baseUrl + 'caseReq/';

  static final createCasereqUrl = casereqUrl + 'addOrUpdateCaseReq';

  static final findOneCasereqUrl = casereqUrl + 'getOneCaseReq';

  static final findAllCasereqUrl = casereqUrl + 'caseReqFindAll';

  static final searchCasereqUrl = casereqUrl + 'caseReqSearch';

  static final updateCasereqUrl = casereqUrl + 'addOrUpdateCaseReq';

  static final deleteCasereqUrl = casereqUrl + 'deleteCaseReq';

  static final Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  static final Map<String, String> noneHeaders = {
  };

  Future<List<CasereqEntity>> search(CasereqSearchBean casereqSearchBean) async {
    final response = await http.post(searchCasereqUrl, headers: headers, body: JsonEncoder().convert(casereqSearchBean));
    if (response.statusCode == 200) {
      final json = JsonDecoder().convert(response.body);
      final casereqs = json['content'].map<CasereqEntity>((casereq) => CasereqEntity.fromJson(casereq)).toList();
      return casereqs;
    } else {
      throw Exception('CasereqRepository search failed.');
    }
  }

  Future<List<CasereqEntity>> findAll(CasereqSearchBean casereqSearchBean) async {
    final response = await http.post(findAllCasereqUrl, headers: headers, body: JsonEncoder().convert(casereqSearchBean));
    if (response.statusCode == 200) {
      final json = JsonDecoder().convert(response.body);
      final casereqs = json.map<CasereqEntity>((casereq) => CasereqEntity.fromJson(casereq)).toList();
      return casereqs;
    } else {
      throw Exception('CasereqRepository findAll failed.');
    }
  }

  Future<CasereqEntity> findOne(String caseNo) async {
    final response = await http.post(findOneCasereqUrl, headers: noneHeaders, body: caseNo);
    if (response.statusCode == 200) {
      final json = JsonDecoder().convert(response.body);
      final casereq = CasereqEntity.fromJson(json);
      return casereq;
    } else {
      throw Exception('CasereqRepository findOne failed.');
    }
  }

  Future<CasereqEntity> create(CasereqEntity casereqEntity) async {
    final response = await http.post(createCasereqUrl, headers: headers, body: JsonEncoder().convert(casereqEntity));
    if (response.statusCode == 200) {
      final json = JsonDecoder().convert(response.body);
      final casereq = CasereqEntity.fromJson(json);
      return casereq;
    } else {
      throw Exception('CasereqRepository create failed.');
    }
  }

  Future<CasereqEntity> update(CasereqEntity casereqEntity) async {
    final response = await http.post(updateCasereqUrl, headers: headers, body: JsonEncoder().convert(casereqEntity));
    if (response.statusCode == 200) {
      final json = JsonDecoder().convert(response.body);
      final casereq = CasereqEntity.fromJson(json);
      return casereq;
    } else {
      throw Exception('CasereqRepository update failed.');
    }
  }

  Future<void> delete(String caseNo) async {
    final response = await http.post(deleteCasereqUrl, headers: noneHeaders, body: caseNo);
    if (response.statusCode == 200) {
    } else {
      throw Exception('CasereqRepository delete failed.');
    }
  }

}
