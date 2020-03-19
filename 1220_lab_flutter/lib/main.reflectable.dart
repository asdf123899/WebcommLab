// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import "dart:core";
import 'package:flutter_lab_app/enums/case_monitor_level_enum.dart' as prefix2;
import 'package:flutter_lab_app/enums/case_type_enum.dart' as prefix1;
import 'package:vnum/vnum.dart' as prefix0;

// ignore_for_file: unnecessary_const

// ignore:unused_import
import "package:reflectable/mirrors.dart" as m;
// ignore:unused_import
import "package:reflectable/src/reflectable_builder_based.dart" as r;
// ignore:unused_import
import "package:reflectable/reflectable.dart" as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.VnumTypeReflectable(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r"CaseTypeEnum",
            r".CaseTypeEnum",
            7,
            0,
            const prefix0.VnumTypeReflectable(),
            const <int>[0, 1, 2, 8, 9, 13, 14],
            const <int>[15, 16, 17, 18, 19, 8, 20, 9],
            const <int>[10, 11, 12],
            -1,
            {
              r"general": () => prefix1.CaseTypeEnum.general,
              r"tempControl": () => prefix1.CaseTypeEnum.tempControl,
              r"noControl": () => prefix1.CaseTypeEnum.noControl
            },
            {},
            {
              r"define": (b) => (fromValue) =>
                  b ? prefix1.CaseTypeEnum.define(fromValue) : null,
              r"fromJson": (b) =>
                  (json) => b ? prefix1.CaseTypeEnum.fromJson(json) : null
            },
            -1,
            -1,
            const <int>[-1],
            null,
            null),
        r.NonGenericClassMirrorImpl(
            r"CaseMonitorLevelEnum",
            r".CaseMonitorLevelEnum",
            7,
            1,
            const prefix0.VnumTypeReflectable(),
            const <int>[4, 5, 6, 7, 21, 22, 27, 28, 29],
            const <int>[15, 16, 17, 18, 19, 21, 20, 22],
            const <int>[23, 24, 25, 26],
            -1,
            {
              r"reportForControl": () =>
                  prefix2.CaseMonitorLevelEnum.reportForControl,
              r"deptControl": () => prefix2.CaseMonitorLevelEnum.deptControl,
              r"bureauControl": () =>
                  prefix2.CaseMonitorLevelEnum.bureauControl,
              r"noControl": () => prefix2.CaseMonitorLevelEnum.noControl
            },
            {},
            {
              r"define": (b) => (fromValue) =>
                  b ? prefix2.CaseMonitorLevelEnum.define(fromValue) : null,
              r"": (b) =>
                  (value) => b ? prefix2.CaseMonitorLevelEnum(value) : null,
              r"fromJson": (b) => (json) =>
                  b ? prefix2.CaseMonitorLevelEnum.fromJson(json) : null
            },
            -1,
            -1,
            const <int>[-1],
            null,
            null),
        r.GenericClassMirrorImpl(
            r"Vnum",
            r"vnum.Vnum",
            519,
            2,
            const prefix0.VnumTypeReflectable(),
            const <int>[3, 30, 31, 15, 18, 32, 33, 34, 35],
            const <int>[15, 16, 17, 18, 19, 31, 20],
            const <int>[30],
            -1,
            {r"allCasesFor": () => prefix0.Vnum.allCasesFor},
            {},
            {
              r"fromValue": (b) => (value, baseType) =>
                  b ? prefix0.Vnum.fromValue(value, baseType) : null,
              r"fromJson": (b) =>
                  (json) => b ? prefix0.Vnum.fromJson(json) : null
            },
            -1,
            -1,
            const <int>[-1],
            null,
            null,
            (o) => false,
            const <int>[3],
            2),
        r.TypeVariableMirrorImpl(r"T", r"vnum.Vnum.T",
            const prefix0.VnumTypeReflectable(), -1, 2, null)
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(r"general", 33941, 0,
            const prefix0.VnumTypeReflectable(), 0, 0, 0, null, null),
        r.VariableMirrorImpl(r"tempControl", 33941, 0,
            const prefix0.VnumTypeReflectable(), 0, 0, 0, null, null),
        r.VariableMirrorImpl(r"noControl", 33941, 0,
            const prefix0.VnumTypeReflectable(), 0, 0, 0, null, null),
        r.VariableMirrorImpl(r"value", 1029, 2,
            const prefix0.VnumTypeReflectable(), -1, -1, -1, null, null),
        r.VariableMirrorImpl(r"reportForControl", 33941, 1,
            const prefix0.VnumTypeReflectable(), 1, 1, 1, null, null),
        r.VariableMirrorImpl(r"deptControl", 33941, 1,
            const prefix0.VnumTypeReflectable(), 1, 1, 1, null, null),
        r.VariableMirrorImpl(r"bureauControl", 33941, 1,
            const prefix0.VnumTypeReflectable(), 1, 1, 1, null, null),
        r.VariableMirrorImpl(r"noControl", 33941, 1,
            const prefix0.VnumTypeReflectable(), 1, 1, 1, null, null),
        r.MethodMirrorImpl(r"toJson", 65538, 0, null, null, null, null,
            const <int>[], const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"meaning", 131074, 0, -1, 3, 3, null, const <int>[],
            const prefix0.VnumTypeReflectable(), null),
        r.ImplicitGetterMirrorImpl(
            const prefix0.VnumTypeReflectable(), 0, 0, 0, 10),
        r.ImplicitGetterMirrorImpl(
            const prefix0.VnumTypeReflectable(), 1, 0, 0, 11),
        r.ImplicitGetterMirrorImpl(
            const prefix0.VnumTypeReflectable(), 2, 0, 0, 12),
        r.MethodMirrorImpl(r"define", 128, 0, -1, 0, 0, null, const <int>[0],
            const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"fromJson", 1, 0, -1, 0, 0, null, const <int>[1],
            const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"==", 131074, 2, -1, 4, 4, null, const <int>[2],
            const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"toString", 131074, null, -1, 3, 3, null,
            const <int>[], const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"noSuchMethod", 65538, null, null, null, null, null,
            const <int>[3], const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"hashCode", 131075, 2, -1, 5, 5, null,
            const <int>[], const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"runtimeType", 131075, null, -1, 6, 6, null,
            const <int>[], const prefix0.VnumTypeReflectable(), null),
        r.ImplicitGetterMirrorImpl(
            const prefix0.VnumTypeReflectable(), 3, -1, -1, 20),
        r.MethodMirrorImpl(r"toJson", 65538, 1, null, null, null, null,
            const <int>[], const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"meaning", 131074, 1, -1, 3, 3, null, const <int>[],
            const prefix0.VnumTypeReflectable(), null),
        r.ImplicitGetterMirrorImpl(
            const prefix0.VnumTypeReflectable(), 4, 1, 1, 23),
        r.ImplicitGetterMirrorImpl(
            const prefix0.VnumTypeReflectable(), 5, 1, 1, 24),
        r.ImplicitGetterMirrorImpl(
            const prefix0.VnumTypeReflectable(), 6, 1, 1, 25),
        r.ImplicitGetterMirrorImpl(
            const prefix0.VnumTypeReflectable(), 7, 1, 1, 26),
        r.MethodMirrorImpl(r"define", 128, 1, -1, 1, 1, null, const <int>[4],
            const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"", 1, 1, -1, 1, 1, null, const <int>[5],
            const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"fromJson", 1, 1, -1, 1, 1, null, const <int>[6],
            const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"allCasesFor", 4325394, 2, -1, 7, 8, null,
            const <int>[7], const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"toJson", 65538, 2, null, null, null, null,
            const <int>[], const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"", 128, 2, -1, 9, 2, null, const <int>[],
            const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"define", 128, 2, -1, 9, 2, null, const <int>[8],
            const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"fromValue", 1, 2, -1, 9, 2, null,
            const <int>[9, 10], const prefix0.VnumTypeReflectable(), null),
        r.MethodMirrorImpl(r"fromJson", 1, 2, -1, 9, 2, null, const <int>[11],
            const prefix0.VnumTypeReflectable(), null)
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r"fromValue",
            32774,
            13,
            const prefix0.VnumTypeReflectable(),
            -1,
            3,
            3,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"json",
            16390,
            14,
            const prefix0.VnumTypeReflectable(),
            null,
            null,
            null,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"o",
            16390,
            15,
            const prefix0.VnumTypeReflectable(),
            null,
            null,
            null,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"invocation",
            32774,
            17,
            const prefix0.VnumTypeReflectable(),
            -1,
            10,
            10,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"fromValue",
            32774,
            27,
            const prefix0.VnumTypeReflectable(),
            -1,
            3,
            3,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"value",
            32774,
            28,
            const prefix0.VnumTypeReflectable(),
            -1,
            3,
            3,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"json",
            16390,
            29,
            const prefix0.VnumTypeReflectable(),
            null,
            null,
            null,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"object",
            16390,
            30,
            const prefix0.VnumTypeReflectable(),
            null,
            null,
            null,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"value",
            6,
            33,
            const prefix0.VnumTypeReflectable(),
            null,
            -1,
            -1,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"value",
            6,
            34,
            const prefix0.VnumTypeReflectable(),
            null,
            -1,
            -1,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"baseType",
            16390,
            34,
            const prefix0.VnumTypeReflectable(),
            null,
            null,
            null,
            null,
            null,
            null,
            null),
        r.ParameterMirrorImpl(
            r"json",
            16390,
            35,
            const prefix0.VnumTypeReflectable(),
            null,
            null,
            null,
            null,
            null,
            null,
            null)
      ],
      <Type>[
        prefix1.CaseTypeEnum,
        prefix2.CaseMonitorLevelEnum,
        prefix0.Vnum,
        String,
        bool,
        int,
        Type,
        const m.TypeValue<List<prefix0.Vnum<dynamic>>>().type,
        List,
        const r.FakeType(r"vnum.Vnum<T>"),
        Invocation
      ],
      3,
      {
        r"==": (dynamic instance) => (x) => instance == x,
        r"toString": (dynamic instance) => instance.toString,
        r"noSuchMethod": (dynamic instance) => instance.noSuchMethod,
        r"hashCode": (dynamic instance) => instance.hashCode,
        r"runtimeType": (dynamic instance) => instance.runtimeType,
        r"toJson": (dynamic instance) => instance.toJson,
        r"value": (dynamic instance) => instance.value,
        r"meaning": (dynamic instance) => instance.meaning
      },
      {},
      null,
      [])
};

final _memberSymbolMap = null;

initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}