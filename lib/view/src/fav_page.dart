import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex1/controllers/favorites_controller.dart';
import 'package:pokedex1/model/favorites_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFavorites extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyFavoritesState();

  }

}

class MyFavoritesState extends State<MyFavorites>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Favoritos", style: TextStyle(
              fontSize: 18,
              color: Color(0xFF02005B),
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w700
          ),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF02005B)),
            onPressed: () => Navigator.of(context).pop('Ola mundo'),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
        ),
        body: myListView(context),
      );
  }

}
// replace this function with the code in the examples
Widget myListView(BuildContext context){
  FavoritesController favcontrol = new FavoritesController();
  getFavs(favcontrol);
  return
    Observer(builder: (_) {
      if (favcontrol.favlist == null || favcontrol.favlist.length==0) {
        return Center(
            child: Column(
                children: [
                  CircularProgressIndicator(),
                  Text("Sem pokémons favoritados")
                ]));
      }
      return
        Container(
            margin: EdgeInsets.only(top: 16),
            child:
            ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: SvgPicture.network(
                          favcontrol.favlist[index].urlimage,
                          placeholderBuilder: (context) =>
                              CircularProgressIndicator(),

                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Color(0xFFFD1A55)),
                            borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          '/pokemon', arguments: favcontrol.favlist[index].id.toString());
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined, color: Color(0xFFFD1A55),
                      size: 25,),
                    title: Text(favcontrol.favlist[index].nome.capitalize(), style: TextStyle(
                        color: Color(0xFFFD1A55),
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                    ),),
                    subtitle: Text('Tipo: '+favcontrol.favlist[index].type),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2.5,
                    indent: 2,

                  );
                },
                itemCount: favcontrol.favlist.length
            )
        );
    });
}


extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}


void getFavs(FavoritesController favcontrol) async{
  SharedPreferences favs = await SharedPreferences.getInstance();
  List <FavoritesModel> listafavorites = new List();

  for(int i = 0; i < favs.getKeys().length; i++){

    FavoritesModel fav_model;

    String jsonfav = favs.get(favs.getKeys().elementAt(i));
    print(jsonfav);

    Map<String, dynamic> mapFav = json.decode(jsonfav);
    fav_model = FavoritesModel.fromJson(mapFav);
    listafavorites.add(fav_model);
  }

  print("Tamanho da lista:" + listafavorites.length.toString());

  favcontrol.setList(listafavorites);

}
