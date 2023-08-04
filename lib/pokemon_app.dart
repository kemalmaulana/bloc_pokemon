import 'package:bloc_pokemon/feature/all/ui/all_pokemon_screen.dart';
import 'package:flutter/material.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BLoC Pokemon',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AllPokemonScreen());
  }
}