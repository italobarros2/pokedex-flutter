import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex1/controllers/pokeapiController.dart';
import 'package:pokedex1/model/pokeapi.dart';
import 'package:toast/toast.dart';

class MySearch extends StatefulWidget{

  final String data;

  MySearch({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  State<MySearch> createState() {
    return SearchPageState(data1: data);
  }

}

class SearchPageState extends State<MySearch>{

  final String data1;
  SearchPageState({
    Key key,
    @required this.data1,
  });

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 8,),
            Text("Resultado da Pesquisa", style: TextStyle(
              fontSize: 18,
              color: Color(0xFF02005B),
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w700,
            ),),
            Container(height: 4,),
            Text(data1.capitalize(), style: TextStyle(
                fontSize: 14,
                color: Color(0xFF828282),
                fontFamily: "Open Sans",
                fontWeight: FontWeight.w400
            ),),
            Container(height: 8,)
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF02005B)),
          onPressed: () => Navigator.of(context).pop('Ola mundo'),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,

      ),
      body: _myListView(context, data1),
    );
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context, String data) {
  PokeapiController control = PokeapiController();
  control.txt = data;
  control.fetchPokemonList();
  return

    Observer(builder: (_){
      if(!control.checkFlag()){

        return Center(child: Column(
          children: [Container(height: 50,),CircularProgressIndicator(),Container(height: 50,),Text("Pokémon não encontrado")],
        ),);
      }
      return(
          Container(
              margin: EdgeInsets.only(top: 16),
              child:
              ListView.separated(
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Container(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: SvgPicture.network(
                            control.pokeApi.sprites.other.dreamWorld.frontDefault,
                            placeholderBuilder: (context) => CircularProgressIndicator(),

                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Color(0xFFFD1A55)                            ),
                              borderRadius: BorderRadius.all(Radius.circular(100))
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed('/pokemon', arguments: data);
                      },
                      trailing: Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFFFD1A55),size: 25,),
                      title: Text(control.getNamePoke().toUpperCase(), style: TextStyle(
                          color: Color(0xFFFD1A55),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),),
                      subtitle: Text('Tipo: '+control.getTypePoke()),
                    );
                  },
                  separatorBuilder: (context, index){
                    return Divider(
                      thickness: 2.5,
                      indent: 2,

                    );
                  },
                  itemCount: 1
              )
          )
      );
    });



}
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}