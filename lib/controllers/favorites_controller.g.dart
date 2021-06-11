// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesController on _FavoritesController, Store {
  final _$favAtom = Atom(name: '_FavoritesController.fav');

  @override
  FavoritesModel get fav {
    _$favAtom.reportRead();
    return super.fav;
  }

  @override
  set fav(FavoritesModel value) {
    _$favAtom.reportWrite(value, super.fav, () {
      super.fav = value;
    });
  }

  final _$favlistAtom = Atom(name: '_FavoritesController.favlist');

  @override
  List<FavoritesModel> get favlist {
    _$favlistAtom.reportRead();
    return super.favlist;
  }

  @override
  set favlist(List<FavoritesModel> value) {
    _$favlistAtom.reportWrite(value, super.favlist, () {
      super.favlist = value;
    });
  }

  final _$_FavoritesControllerActionController =
      ActionController(name: '_FavoritesController');

  @override
  dynamic checkFavoritesList() {
    final _$actionInfo = _$_FavoritesControllerActionController.startAction(
        name: '_FavoritesController.checkFavoritesList');
    try {
      return super.checkFavoritesList();
    } finally {
      _$_FavoritesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkList() {
    final _$actionInfo = _$_FavoritesControllerActionController.startAction(
        name: '_FavoritesController.checkList');
    try {
      return super.checkList();
    } finally {
      _$_FavoritesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fav: ${fav},
favlist: ${favlist}
    ''';
  }
}
