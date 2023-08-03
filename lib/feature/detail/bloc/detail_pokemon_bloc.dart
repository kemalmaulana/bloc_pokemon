import 'package:bloc_pokemon/feature/detail/bloc/detail_pokemon_event.dart';
import 'package:bloc_pokemon/feature/detail/bloc/detail_pokemon_state.dart';
import 'package:bloc_pokemon/model/detail_pokemon_model.dart';
import 'package:bloc_pokemon/model/form_pokemon_model.dart';
import 'package:bloc_pokemon/model/species_pokemon_model.dart';
import 'package:bloc_pokemon/repos/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPokemonBloc extends Bloc<DetailPokemonEvent, DetailPokemonState> {
  final Repositories repos;
  final int pokemonId;

  DetailPokemonBloc(this.repos, this.pokemonId)
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
