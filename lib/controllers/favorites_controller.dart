import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex1/model/favorites_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesController with _$FavoritesController;

abstract class _FavoritesController with Store{

  @observable
  FavoritesModel fav;


  @action
  checkFavoritesList(){
    fav.flag = !fav.flag;
  }

  @observable
  List <FavoritesModel> favlist;

  @action
  checkList(){
    favlist.shuffle();
  }

  List <FavoritesModel> setList(List <FavoritesModel> favlist){
    return this.favlist = favlist;
  }
}