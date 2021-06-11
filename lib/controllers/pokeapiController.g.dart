// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapiController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeapiController on _PokeapiController, Store {
  final _$flag2Atom = Atom(name: '_PokeapiController.flag2');

  @override
  bool get flag2 {
    _$flag2Atom.reportRead();
    return super.flag2;
  }

  @override
  set flag2(bool value) {
    _$flag2Atom.reportWrite(value, super.flag2, () {
      super.flag2 = value;
    });
  }

  final _$flag3Atom = Atom(name: '_PokeapiController.flag3');

  @override
  bool get flag3 {
    _$flag3Atom.reportRead();
    return super.flag3;
  }

  @override
  set flag3(bool value) {
    _$flag3Atom.reportWrite(value, super.flag3, () {
      super.flag3 = value;
    });
  }

  final _$flag4Atom = Atom(name: '_PokeapiController.flag4');

  @override
  bool get flag4 {
    _$flag4Atom.reportRead();
    return super.flag4;
  }

  @override
  set flag4(bool value) {
    _$flag4Atom.reportWrite(value, super.flag4, () {
      super.flag4 = value;
    });
  }

  final _$_PokeapiControllerActionController =
      ActionController(name: '_PokeapiController');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeapiControllerActionController.startAction(
        name: '_PokeapiController.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeapiControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchEvoChainUrl() {
    final _$actionInfo = _$_PokeapiControllerActionController.startAction(
        name: '_PokeapiController.fetchEvoChainUrl');
    try {
      return super.fetchEvoChainUrl();
    } finally {
      _$_PokeapiControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchEvoChain() {
    final _$actionInfo = _$_PokeapiControllerActionController.startAction(
        name: '_PokeapiController.fetchEvoChain');
    try {
      return super.fetchEvoChain();
    } finally {
      _$_PokeapiControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
flag2: ${flag2},
flag3: ${flag3},
flag4: ${flag4}
    ''';
  }
}
