import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex1/view/src/fav_page.dart';
import 'package:pokedex1/view/src/home_page.dart';
import 'package:pokedex1/view/src/pokemon_page.dart';
import 'package:pokedex1/view/src/search_page.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/search':
      // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MySearch(
              data: args,
            ),
          );
        }
        break;
      case '/favorites':
          return MaterialPageRoute(builder: (_) => MyFavorites());

      case '/pokemon':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MyPokemon(
              data: args,
            ),
          );
        }
        break;

        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}