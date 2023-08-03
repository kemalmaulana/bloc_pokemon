import 'package:bloc_pokemon/model/all_pokemon_model.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

sealed class AllPokemonState extends Equatable {}

class AllPokemonLoadingState extends AllPokemonState {
  @override
  List<Object?> get props => [];
}

class AllPokemonLoadedState extends AllPokemonState {
  AllPokemonLoadedState(this.pagingController);
  final PagingController<int, Results> pagingController;

  String getImageLink(String url) {
    var listString = url.split("/");
    listString.removeWhere((element) => element.isEmpty);
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${listString.last}.png";
  }

  String getPokemonId(String url) {
    var listString = url.split("/");
    listString.removeWhere((element) => element.isEmpty);
    return listString.last;
  }

  @override
  List<Object?> get props => [pagingController];
}

class AllPokemonErrorState extends AllPokemonState {
  AllPokemonErrorState(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}
