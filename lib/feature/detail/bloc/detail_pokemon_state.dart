import 'package:bloc_pokemon/model/detail_pokemon_model.dart';
import 'package:bloc_pokemon/model/form_pokemon_model.dart';
import 'package:bloc_pokemon/model/species_pokemon_model.dart';
import 'package:equatable/equatable.dart';

sealed class DetailPokemonState extends Equatable {}

class DetailPokemonLoadingState extends DetailPokemonState {
  @override
  List<Object?> get props => [];
}

class DetailPokemonLoadedState extends DetailPokemonState {
  DetailPokemonLoadedState(this.detailPokemonModel, this.formPokemonModel, this.speciesPokemonModel);
  final DetailPokemonModel? detailPokemonModel;
  final FormPokemonModel? formPokemonModel;
  final SpeciesPokemonModel? speciesPokemonModel;

  String getImageLink(String pokemonId) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$pokemonId.png";
  }

  String getFlavorText() {
    var flavorText = "";
    var species = speciesPokemonModel?.flavorTextEntries?.takeWhile((value) => value.language?.name == "en").toList();
    if((species?.length ?? 0) > 0) {
      species?.getRange(0, 3).forEach((element) {
        flavorText += "${element.flavorText} ";
      });
    } else {
      species?.forEach((element) {
        flavorText += "${element.flavorText} ";
      });
    }
    return flavorText.replaceAll("\n", " ").replaceAll("\f", " ");
  }
  
  @override
  List<Object?> get props => [detailPokemonModel, formPokemonModel, speciesPokemonModel];
}

class DetailPokemonErrorState extends DetailPokemonState {
  DetailPokemonErrorState(this.error);

  final String error;

  @override
  List<Object?> get props => [];


}