import 'package:equatable/equatable.dart';

abstract class DetailPokemonEvent extends Equatable {}

class LoadDetailPokemon extends DetailPokemonEvent {
  @override
  List<Object?> get props => [];

}