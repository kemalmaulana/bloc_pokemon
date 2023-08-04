import 'package:bloc_pokemon/base/base_bloc.dart';
import 'package:bloc_pokemon/feature/search/bloc/search_pokemon_event.dart';
import 'package:bloc_pokemon/feature/search/bloc/search_pokemon_state.dart';

class SearchPokemonBloc
    extends BaseBloc<SearchPokemonEvent, SearchPokemonState> {
  SearchPokemonBloc() : super(SearchPokemonStandbyState()) {
    on<LoadDetailPokemon>((event, emit) async {
      emit(SearchPokemonLoadingState());
      try {
        var detail = await repos.getSearchPokemon(event.pokemonName);
        emit(SearchPokemonLoadedState(detail));
      } on Exception catch (e) {
        emit(SearchPokemonErrorState(e.toString()));
      }
    });
  }
}
