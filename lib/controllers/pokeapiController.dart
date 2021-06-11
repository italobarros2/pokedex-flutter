import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:pokedex1/model/pokeapi.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex1/model/pokeapichain.dart';
import 'package:pokedex1/model/pokeapichain_obj.dart';
part 'pokeapiController.g.dart';



class PokeapiController = _PokeapiController with _$PokeapiController;

abstract class _PokeapiController with Store{
  String chain_url;
  PokeApi pokeApi;
  SpeciePokemon pokeEsp;
  EvolutionChainObj evochain;
  String txt;
  @observable
  bool flag2 = false;
  @action
  fetchPokemonList(){
    loadPokeApi(txt).then((pokelist){
      pokeApi = pokelist;
      flag2 = true;
      print("Flag2: "+flag2.toString());
    });
  }

  @observable
  bool flag3 = false;
  @action
  fetchEvoChainUrl(){
    loadEvoChainApi(txt).then((pokelist){
      pokeEsp = pokelist;
      chain_url = pokeEsp.evolutionChain.url;
      flag3 = true;
      print("Flag3: "+flag3.toString());
      fetchEvoChain();
    });
  }
  @observable
  bool flag4 = false;
  @action
  fetchEvoChain(){
    loadEvoChainObjApi().then((pokelist){
      evochain = pokelist;
      if(evochain.chain != null){
        flag4 = true;
      }
      print("Flag4: "+flag4.toString());
    });
  }








  bool checkFlag(){
    if(pokeApi != null || (flag2==true && flag3 == true && flag4==true)){
      return true;
    }
    return false;
  }

  Future<PokeApi> loadPokeApi(String txt) async{
    try {
      String txttotal = 'https://pokeapi.co/api/v2/pokemon/' + txt;
      print(txttotal);
      final response = await http.get(Uri.parse(txttotal));
      var decodeJson = jsonDecode(response.body);
      return PokeApi.fromJson(decodeJson);
    }catch(error){
      print(error);
      return null;
    }
  }

  Future<SpeciePokemon> loadEvoChainApi(String txt) async{
    try {
      String txttotal = 'https://pokeapi.co/api/v2/pokemon-species/' + txt;
      print(txttotal);
      final response = await http.get(Uri.parse(txttotal));
      var decodeJson = jsonDecode(response.body);
      return SpeciePokemon.fromJson(decodeJson);
    }catch(error){
      print(error);
      return null;
    }
  }

  Future<EvolutionChainObj> loadEvoChainObjApi() async{
    try {
      print("Evochain Url: "+chain_url);
      final response = await http.get(Uri.parse(chain_url));
      var decodeJson = jsonDecode(response.body);
      return EvolutionChainObj.fromJson(decodeJson);
    }catch(error){
      print(error);
      return null;
    }
  }

  String getNamePoke(){
    return pokeApi.name;
  }

  String getTypePoke(){
    // print(pokeApi.types[0].type.name);
    String cache;
    for(int i = 0; i<pokeApi.types.length;i++){
      if(i == 0){
        cache = pokeApi.types[i].type.name;
      }else{
        cache = cache + "/" + pokeApi.types[i].type.name;
      }
    }
    print (cache);
    return cache;
  }



}