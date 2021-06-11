import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class Controller = HomeController with _$Controller;

abstract class HomeController with Store{
  @observable
  String tmob;


  @action
  void setTmob(String textfld){
    tmob = textfld;
  }

  bool analiser(){
    print(tmob);
    return (tmob!=null && tmob.length>0);
  }
}