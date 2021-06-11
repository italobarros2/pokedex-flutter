// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on HomeController, Store {
  final _$tmobAtom = Atom(name: 'HomeController.tmob');

  @override
  String get tmob {
    _$tmobAtom.reportRead();
    return super.tmob;
  }

  @override
  set tmob(String value) {
    _$tmobAtom.reportWrite(value, super.tmob, () {
      super.tmob = value;
    });
  }

  final _$HomeControllerActionController =
      ActionController(name: 'HomeController');

  @override
  void setTmob(String textfld) {
    final _$actionInfo = _$HomeControllerActionController.startAction(
        name: 'HomeController.setTmob');
    try {
      return super.setTmob(textfld);
    } finally {
      _$HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tmob: ${tmob}
    ''';
  }
}
