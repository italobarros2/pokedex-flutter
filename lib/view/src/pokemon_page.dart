import 'dart:convert';
import 'dart:ui';
import 'package:toast/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex1/controllers/favorites_controller.dart';
import 'package:pokedex1/controllers/pokeapiController.dart';
import 'package:pokedex1/model/favorites_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPokemon extends StatefulWidget{
  final String data;

  MyPokemon({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyPokemonState(data1: data);
  }

}

class MyPokemonState extends State<MyPokemon>{

  final String data1;

  MyPokemonState({
    Key key,
    @required this.data1,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: "teste pokemon",
        home: new Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: IconButton(
                icon: Image.asset('assets/img/vector.png'),
                iconSize: 50,
                onPressed: () => Navigator.pushReplacementNamed(context, "/"),
              ),
              backgroundColor: Color(0xFFFD1A55),
              elevation: 0
          ),
          body: _myPoke(context, data1),
        )
    );
  }
}
// replace this function with the code in the examples
Widget _myPoke(BuildContext context, String data) {

  PokeapiController poke = PokeapiController();
  FavoritesController favcontrol = FavoritesController();
  FavoritesModel fav;
  poke.txt = data;
  poke.fetchPokemonList();
  poke.fetchEvoChainUrl();

  return

    Observer(builder: (_){
      if(!(poke.flag4)){
        return Center(child: CircularProgressIndicator(),);
      }
      fav = new FavoritesModel(poke.pokeEsp.id, poke.pokeApi.sprites.other.dreamWorld.frontDefault,poke.pokeEsp.name, poke.getTypePoke(),false);
      check_fav(favcontrol, fav);
      favcontrol.fav = fav;
      return ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 16),
                color: Color(0xFFFD1A55),
                child: Row(
                  children: [
                    Builder(builder: (_){
                      if(!poke.checkFlag()){
                        return Center(child: CircularProgressIndicator());
                      }
                      return
                        Container(
                          width: 100,
                          height: 100,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 3, color: Colors.white)
                          ),
                          child: SvgPicture.network(
                            poke.pokeApi.sprites.other.dreamWorld.frontDefault,
                            placeholderBuilder: (context) => CircularProgressIndicator(),

                          ),
                        );

                    }),

                    Container(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(poke.getNamePoke().capitalize(), style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 22
                        ),),
                        Container(height: 5,),
                        Text("Tipo: "+poke.getTypePoke().capitalize(), style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16
                        ),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(width: 50,),
                        Column(
                          children: [
                            Container(height: 60,),
                            Observer(builder: (_){
                              if(favcontrol.fav.flag){
                                return
                                  IconButton(
                                      icon: Image.asset('assets/img/starfill.png'),
                                      iconSize: 27,
                                      onPressed: () {
                                        delete_fav(context, poke.pokeEsp.id.toString(), fav, favcontrol);
                                      }
                                  );
                              }
                              return
                                IconButton(
                                  icon: Image.asset('assets/img/star.png'),
                                  iconSize: 27,
                                  onPressed: () {
                                    save_fav(context, poke.pokeEsp.id.toString(), fav, favcontrol);
                                  },
                                );

                            }),

                          ],
                        )

                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Características", style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF02005B),
                                fontSize: 18
                            ),),
                            Container(height: 10,),
                            Text("Peso", style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF02005B),
                                fontSize: 16
                            ),),
                            Container(height: 10,),
                            Text(((poke.pokeApi.weight)/2.2).ceil().toString()+" kg", style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFD1A55),
                                fontSize: 18
                            ),),
                            Container(height: 32,),
                            Text("Evoluções", style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF02005B),
                                fontSize: 16
                            ),),
                            Container(height: 10,),
                            Row(
                              children: [
                                Builder(builder: (_){
                                  if(poke.evochain.chain.species.name != null){
                                    return
                                      Text(poke.evochain.chain.species.name.capitalize(), style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFFD1A55),
                                          fontSize: 18
                                      ),);
                                  } return Container();
                                }),
                                Text(" (${poke.getTypePoke()})", style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFD1A55),
                                    fontSize: 14
                                ),),
                              ],
                            ),
                            Container(height: 10,),
                            Row(
                              children: [
                                Builder(builder: (_){
                                  if(poke.evochain.chain.evolvesTo.length > 0){
                                    return
                                      Text(poke.evochain.chain.evolvesTo[0].species.name.capitalize(), style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFFD1A55),
                                          fontSize: 18
                                      ),);
                                  } return Container();
                                }),
                                Builder(builder: (_){
                                  if(poke.evochain.chain.evolvesTo.length > 0){
                                    return
                                      Text(" (${poke.getTypePoke()})", style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFD1A55),
                                          fontSize: 14
                                      ),);
                                  } return Container();
                                }),
                              ],
                            ),
                            Container(height: 10,),
                            Row(
                              children: [
                                Builder(builder: (_){
                                  if(poke.evochain.chain.evolvesTo.length > 0 && poke.evochain.chain.evolvesTo[0].evolvesTo.length>0){
                                    return
                                      Text(poke.evochain.chain.evolvesTo[0].evolvesTo[0].species.name.capitalize(), style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFFD1A55),
                                          fontSize: 18
                                      ),);
                                  } return Container();
                                }),
                                Builder(builder: (_){
                                  if(poke.evochain.chain.evolvesTo.length > 0 && poke.evochain.chain.evolvesTo[0].evolvesTo.length>0){
                                    return
                                      Text(" (${poke.getTypePoke()})", style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFD1A55),
                                          fontSize: 14
                                      ),);
                                  } return Container();
                                }),
                              ],
                            ),
                            Container(height: 32,),
                            Text("Status base", style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF02005B),
                                fontSize: 16
                            ),),
                            Container(height: 10,)
                          ])
                    ]),
              ),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(poke.pokeApi.stats[0].baseStat.toString(), style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFD1A55),
                              ),),
                              Text(poke.pokeApi.stats[0].stat.name, style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFD1A55),
                              ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text(poke.pokeApi.stats[1].baseStat.toString(), style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFD1A55),
                              ),),
                              Text(poke.pokeApi.stats[1].stat.name, style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFD1A55),
                              ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text(poke.pokeApi.stats[2].baseStat.toString(), style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFD1A55),
                              ),),
                              Text(poke.pokeApi.stats[2].stat.name, style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFD1A55),
                              ),),
                            ],
                          ),
                          Column(
                            children: [
                              Text(poke.pokeApi.stats[3].baseStat.toString(), style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFD1A55),
                              ),),
                              Text(poke.pokeApi.stats[3].stat.name, style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFD1A55),
                              ),),
                            ],
                          ),
                        ],
                      ),
                      Container(height: 32,),
                      Text("Habilidades", style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF02005B),
                          fontSize: 14
                      ),),
                      ListTile(
                        leading: Icon(Icons.fiber_manual_record, size: 20, color: Color(0xFFFD1A55), textDirection: TextDirection.ltr,),
                        title: Text(poke.pokeApi.moves[0].move.name.capitalize(), style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFD1A55),
                        ),),
                      ),
                      ListTile(
                        leading: Icon(Icons.fiber_manual_record, size: 20, color: Color(0xFFFD1A55), textDirection: TextDirection.ltr,),
                        title: Text(poke.pokeApi.moves[1].move.name.capitalize(), style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFD1A55),
                        ),),
                      ),
                      ListTile(
                        leading: Icon(Icons.fiber_manual_record, size: 20, color: Color(0xFFFD1A55), textDirection: TextDirection.ltr,),
                        title: Text(poke.pokeApi.moves[2].move.name.capitalize(), style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFD1A55),
                        ),),
                      ),
                      ListTile(
                        leading: Icon(Icons.fiber_manual_record, size: 20, color: Color(0xFFFD1A55), textDirection: TextDirection.ltr,),
                        title: Text(poke.pokeApi.moves[3].move.name.capitalize(), style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFD1A55),
                        ),),
                      )
                    ],
                  )

              ),
            ],
          )
        ],
      );
    });

}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

void save_fav(BuildContext context, String chave, FavoritesModel fav, FavoritesController favcontrol) async{
  SharedPreferences favorites = await SharedPreferences.getInstance();
  fav.flag = true;
  favcontrol.fav = fav;
  favorites.setString("FAVORITES_"+chave, json.encode(fav.toJson()));
  print(favorites.getKeys());
  Toast.show("Pokémon Favoritado", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
}

void delete_fav(BuildContext context, String chave, FavoritesModel fav, FavoritesController favcontrol) async{
  SharedPreferences favorites = await SharedPreferences.getInstance();
  fav.flag = false;
  att_fav(favcontrol, fav);
  favorites.remove("FAVORITES_"+chave);
  print(favorites.getKeys());
  Toast.show("Pokémon removido dos Favoritos", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
}

void check_fav(FavoritesController favcontrol, FavoritesModel fav) async{
  SharedPreferences favorites = await SharedPreferences.getInstance();
  print(favorites.getKeys());
  print("CHECK FAV:"+favorites.containsKey("FAVORITES_"+fav.id.toString()).toString());
  if(favorites.containsKey("FAVORITES_"+fav.id.toString())){
    fav.flag = true;
    att_fav(favcontrol, fav);
  }else{
    fav.flag = false;
    att_fav(favcontrol, fav);
  }

}

void att_fav(FavoritesController favcontrol, FavoritesModel fav){
  favcontrol.fav = fav;
}