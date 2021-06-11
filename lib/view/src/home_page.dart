import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex1/controllers/home_controller.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() {
    return HomePageState();
  }

}

Controller controle = new Controller();

TextEditingController txtfld = new TextEditingController();

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return
      MaterialApp(
          title: "teste pokemon",
          home: new Scaffold(
              backgroundColor: Color(0xFFFD1A55),
              body:
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 24, top: 72, left: 24, right: 24),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Center( child:Image.asset("assets/img/logo.png", width: 231,))
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                    children: [
                                      Container(
                                        width: 270,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 8, top: 16, bottom: 16),
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Color(0xFF052595), width: 2),
                                            color: Color(0xFFE6245C),
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 8, top: 16, bottom: 16),
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Color(0xFF052595), width: 2),
                                            color: Color(0xFFF1EE71),
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 8, top: 16, bottom: 16),
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Color(0xFF052595), width: 2),
                                            color: Color(0xFF7AFC90),
                                            shape: BoxShape.circle
                                        ),
                                      )
                                    ]
                                ),
                                ConstrainedBox(
                                    constraints: BoxConstraints(
                                        minWidth: 330,
                                        minHeight: 400,
                                        maxWidth: double.infinity,
                                        maxHeight: double.infinity
                                    ),
                                    child:
                                    Container(
                                        padding: EdgeInsets.only(left: 16, right: 16, top: 46, bottom: 27),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            const BoxShadow(
                                              color: Colors.black12,
                                            ),
                                            const BoxShadow(
                                              color: Colors.white,
                                              spreadRadius: -1.0,
                                              blurRadius: 1.0,
                                            ),
                                          ],
                                        ),
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("Conheça a Pokédex", style: TextStyle(
                                                    color: Color(0xFF02005B),
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 22
                                                )),
                                                Container(height: 8),
                                                Text("Utilize a pokédex para encontrar mais\ninformações sobre os seus pokémons.", style: TextStyle(
                                                    color: Color(0xFF02005B),
                                                    fontWeight: FontWeight.w300,
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 16,
                                                    height: 1.53
                                                ),),
                                                Container(height: 40,),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children:[
                                                          Container(
                                                              width: 280,
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  boxShadow: [BoxShadow(
                                                                      color: Colors.black.withOpacity(.15),
                                                                      blurRadius: 8,
                                                                      spreadRadius: -5,
                                                                      offset: Offset(4,6)
                                                                  )],
                                                                  border: Border.all(
                                                                      color: Colors.black.withOpacity(0.15)
                                                                  ),
                                                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                                              ),
                                                              child: TextField(
                                                                controller: txtfld,
                                                                decoration: InputDecoration(
                                                                  contentPadding: EdgeInsets.only(left: 16, top: 12, bottom: 13),
                                                                  hasFloatingPlaceholder: false,
                                                                  border: InputBorder.none,
                                                                  labelText: 'Digite o nome do pokémon:',
                                                                  suffixIcon: Icon(
                                                                    Icons.search,
                                                                  ),
                                                                ),
                                                                onChanged: (text){
                                                                  controle.setTmob(txtfld.value.text);
                                                                },
                                                              )
                                                          ),
                                                          Container(height: 77,),
                                                          Observer(builder: (_){
                                                            if(controle.analiser()){
                                                              return RaisedButton(
                                                                child: const Text('PESQUISAR', style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.white,
                                                                    fontFamily: 'Open Sans',
                                                                    fontWeight: FontWeight.bold
                                                                ),),
                                                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                                                                // ignore: unrelated_type_equality_checks
                                                                color: Color(0xFF02005B),
                                                                padding: EdgeInsets.only(left: 100, right: 100, top: 10, bottom: 10),
                                                                onPressed: () {
                                                                  Navigator.of(context).pushNamed('/search',
                                                                    arguments: txtfld.value.text.toLowerCase()
                                                                  );
                                                                },

                                                              );
                                                            }
                                                            return RaisedButton(
                                                              child: const Text('PESQUISAR', style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors.white,
                                                                  fontFamily: 'Open Sans',
                                                                  fontWeight: FontWeight.bold
                                                              ),),
                                                              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                                                              // ignore: unrelated_type_equality_checks
                                                              color: Color(0xFFBDBDBD),
                                                              padding: EdgeInsets.only(left: 100, right: 100, top: 10, bottom: 10),
                                                            );
                                                          }),
                                                          Container(height: 16,),
                                                          RaisedButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pushNamed('/favorites');
                                                            },
                                                            child: const Text('VER FAVORITOS', style: TextStyle(
                                                                fontSize: 14,
                                                                color: Color(0xFF02005B),
                                                                fontFamily: 'Open Sans',
                                                                fontWeight: FontWeight.bold
                                                            ),),
                                                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                                                            color: Color(0xFFFFCB05),
                                                            padding: EdgeInsets.only(left: 85, right: 85, top: 10, bottom: 10),
                                                          ),
                                                        ]
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                    )
                                )
                              ],
                            )
                          ]
                      )
                  )
                ],
              )
          )
      );
  }
}