import 'package:bloc_pokemon/base/base_bloc.dart';
import 'package:bloc_pokemon/feature/detail/bloc/detail_pokemon_event.dart';
import 'package:bloc_pokemon/feature/detail/bloc/detail_pokemon_state.dart';
import 'package:bloc_pokemon/data/model/detail_pokemon_model.dart';
import 'package:bloc_pokemon/data/model/form_pokemon_model.dart';
import 'package:bloc_pokemon/data/model/species_pokemon_model.dart';

class DetailPokemonBloc extends BaseBloc<DetailPokemonEvent, DetailPokemonState> {
  final int pokemonId;

  DetailPokemonBloc(this.pokemonId)
      : super(DetailPokemonLoadingState()) {
    on<DetailPokemonEvent>((event, emit) async {
      emit(DetailPokemonLoadingState());
      try {
        await Future.wait([
          repos.getDetailPokemon(pokemonId),
          repos.getFormPokemon(pokemonId),
          repos.getSpeciesPokemon(pokemonId),
        ]).then(
          (futures) => emit(
            DetailPokemonLoadedState(
                futures[0] as DetailPokemonModel,
                futures[1] as FormPokemonModel,
                futures[2] as SpeciesPokemonModel),
          ),
        );
      } catch (e) {
        emit(DetailPokemonErrorState(e.toString()));
      }
    });
  }
}
