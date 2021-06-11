import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex1/route_generator.dart';
import 'package:pokedex1/view/src/fav_page.dart';
import 'package:pokedex1/view/src/pokemon_page.dart';
import 'package:pokedex1/view/src/search_page.dart';

import 'home_page.dart';

class MyPokedex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Pokédex - Desafio",
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

