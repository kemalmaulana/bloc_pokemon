import 'package:equatable/equatable.dart';

abstract class SearchPokemonEvent extends Equatable {}

class LoadDetailPokemon extends SearchPokemonEvent {
  LoadDetailPokemon(this.pokemonName);
  final String pokemonName;

  @override
  List<Object?> get props => [pokemonName];

}