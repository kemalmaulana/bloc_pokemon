import 'package:bloc_pokemon/data/repos/repositories.dart';
import 'package:bloc_pokemon/pokemon_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<Repositories>(Repositories());
  runApp(const PokemonApp());
}
