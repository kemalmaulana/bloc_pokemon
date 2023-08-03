import 'dart:convert';

import 'package:bloc_pokemon/model/all_pokemon_model.dart';
import 'package:bloc_pokemon/model/detail_pokemon_model.dart';
import 'package:bloc_pokemon/model/form_pokemon_model.dart';
import 'package:bloc_pokemon/model/species_pokemon_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Repositories {
  String endPoint = "https://pokeapi.co/";

  Future<AllPokemonModel> getAllPokemon(int pageKey, int limit) async {
    http.Response response = await http.get(Uri.parse("$endPoint/api/v2/pokemon?offset=$pageKey&limit=$limit"));
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return AllPokemonModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<DetailPokemonModel> getDetailPokemon(int pokemonId) async {
    http.Response response = await http.get(Uri.parse("$endPoint/api/v2/pokemon/$pokemonId"));
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      debugPrint(response.body.toString());
      return DetailPokemonModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<SpeciesPokemonModel> getSpeciesPokemon(int pokemonId) async {
    http.Response response = await http.get(Uri.parse("$endPoint/api/v2/pokemon-species/$pokemonId"));
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return SpeciesPokemonModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<FormPokemonModel> getFormPokemon(int pokemonId) async {
    http.Response response = await http.get(Uri.parse("$endPoint/api/v2/pokemon-form/$pokemonId"));
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return FormPokemonModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }


}