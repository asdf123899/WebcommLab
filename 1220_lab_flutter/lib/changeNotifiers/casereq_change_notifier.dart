import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vnum/vnum.dart';
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:flutter_lab_app/utils/locator.dart';
import 'package:flutter_lab_app/entities/entities.dart';
import 'package:flutter_lab_app/repositories/repositories.dart';
import 'package:flutter_lab_app/searchBeans/search_beans.dart';
import 'package:flutter_lab_app/enums/enums.dart';

class CasereqChangeNotifier extends ChangeNotifier {

  CasereqRepository _casereqRepository = locator<CasereqRepository>();
  EmployeeRepository _employeeRepository = locator<EmployeeRepository>();
  UnitRepository _unitRepository = locator<UnitRepository>();

  CasereqSearchBean _casereqSearchBean;
  List<UnitEntity> _units;
  List<EmployeeEntity> _employees;
  List<Vnum> _caseTypes;
  List<Vnum> _caseMonitorLevels;
  List<CasereqEntity> _casereqs;
  List<CasereqEntity> _casereqsByPage;
  CasereqEntity _casereq;
  String _caseNo;

  get casereqSearchBean => _casereqSearchBean;
  get units => _units;
  get employees => _employees;
  get caseTypes => _caseTypes;
  get caseMonitorLevels => _caseMonitorLevels;
  get casereqs => _casereqs;
  get casereq => _casereq;
  get caseNo => _caseNo;
  get casereqsByPage => _casereqsByPage;

  CasereqChangeNotifier(){
    _casereqSearchBean = CasereqSearchBean(size: 10, page: -1, orderBy: 'caseNo');
    _casereqsByPage = List<CasereqEntity>();
  }

  Future<bool> preSearch() async {
    try {
      _caseTypes = Vnum.allCasesFor(CaseTypeEnum);
      _caseMonitorLevels = Vnum.allCasesFor(CaseMonitorLevelEnum);
      _units = await _unitRepository.findAll();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> search() async {
    try {
      _casereqs = await _casereqRepository.search(_casereqSearchBean);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> searchByPage() async {
    try {
      _casereqSearchBean.page++;
      _casereqsByPage.addAll(await _casereqRepository.search(_casereqSearchBean));
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> searchByPageInit() async {
    try {
      _casereqSearchBean.page = -1;
      _casereqsByPage = List<CasereqEntity>();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> findAll() async {
    try {
      _casereqs = await _casereqRepository.findAll(_casereqSearchBean);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> preCreate() async {
    try {
      _caseTypes = Vnum.allCasesFor(CaseTypeEnum);
      _caseMonitorLevels = Vnum.allCasesFor(CaseMonitorLevelEnum);
      _employees = await _employeeRepository.findAll();
      _casereq = CasereqEntity(
          type: CaseTypeEnum.general,
          monitorLevel: CaseMonitorLevelEnum.reportForControl,
          manager: EmployeeEntity(empId: _employees.first.empId),
          contact: EmployeeEntity(empId: _employees.first.empId),
          startDate: DateTime.now(),
          endDate: DateTime.now(),
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> create() async {
    try {
      await _casereqRepository.create(_casereq);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> findOne(String caseNo) async {
    try {
      _casereq = await _casereqRepository.findOne(caseNo);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> preUpdate() async {
    try {
      _caseTypes = Vnum.allCasesFor(CaseTypeEnum);
      _caseMonitorLevels = Vnum.allCasesFor(CaseMonitorLevelEnum);
      _employees = await _employeeRepository.findAll();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> update() async {
    try {
      await _casereqRepository.update(_casereq);
      _casereqsByPage = List<CasereqEntity>();
      final json = JsonDecoder().convert(JsonEncoder().convert(_casereqSearchBean));
      CasereqSearchBean casereqSearchBean = CasereqSearchBean.fromJson(json);
      for(int i = 0; i <= _casereqSearchBean.page; i++){
        casereqSearchBean.page = i;
        _casereqsByPage.addAll(await _casereqRepository.search(casereqSearchBean));
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> delete(String caseNo) async {
    try {
      await _casereqRepository.delete(caseNo);
      _casereqsByPage = List<CasereqEntity>();
      final json = JsonDecoder().convert(JsonEncoder().convert(_casereqSearchBean));
      CasereqSearchBean casereqSearchBean = CasereqSearchBean.fromJson(json);
      for(int i = 0; i <= _casereqSearchBean.page; i++){
        casereqSearchBean.page = i;
        _casereqsByPage.addAll(await _casereqRepository.search(casereqSearchBean));
      }
      return true;
    } catch (_) {
      return false;
    }
  }

}
