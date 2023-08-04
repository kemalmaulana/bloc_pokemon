import 'dart:convert';

import 'package:bloc_pokemon/data/model/all_pokemon_model.dart';
import 'package:bloc_pokemon/data/model/detail_pokemon_model.dart';
import 'package:bloc_pokemon/data/model/form_pokemon_model.dart';
import 'package:bloc_pokemon/data/model/species_pokemon_model.dart';
import 'package:bloc_pokemon/data/remote/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Repositories {
  final network = Network();
  
  Future<AllPokemonModel> getAllPokemon(int pageKey, int limit) async {
    http.Response response = await network.get("/api/v2/pokemon?offset=$pageKey&limit=$limit", false);
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return AllPokemonModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<DetailPokemonModel> getDetailPokemon(int pokemonId) async {
    http.Response response = await network.get("/api/v2/pokemon/$pokemonId", false);
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      debugPrint(response.body.toString());
      return DetailPokemonModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<DetailPokemonModel> getSearchPokemon(String pokemonName) async {
    http.Response response = await network.get("/api/v2/pokemon/$pokemonName", false);
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      debugPrint(response.body.toString());
      return DetailPokemonModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<SpeciesPokemonModel> getSpeciesPokemon(int pokemonId) async {
    http.Response response = await network.get("/api/v2/pokemon-species/$pokemonId", false);
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return SpeciesPokemonModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<FormPokemonModel> getFormPokemon(int pokemonId) async {
    http.Response response = await network.get("/api/v2/pokemon-form/$pokemonId", false);
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return FormPokemonModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }


}