import 'package:bloc_pokemon/data/model/detail_pokemon_model.dart';
import 'package:equatable/equatable.dart';

sealed class SearchPokemonState extends Equatable {}

class SearchPokemonStandbyState extends SearchPokemonState {
  @override
  List<Object?> get props => [];

}

class SearchPokemonLoadingState extends SearchPokemonState {
  @override
  List<Object?> get props => [];
}

class SearchPokemonLoadedState extends SearchPokemonState {
  SearchPokemonLoadedState(this.detailPokemonModel);

  final DetailPokemonModel? detailPokemonModel;

  String getImageLink(String? pokemonId) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$pokemonId.png";
  }

  @override
  List<Object?> get props => [detailPokemonModel];
}

class SearchPokemonErrorState extends SearchPokemonState {
  SearchPokemonErrorState(this.error);

  final String error;

  @override
  List<Object?> get props => [];


}