import 'package:equatable/equatable.dart';

abstract class AllPokemonEvent extends Equatable {}

class LoadAllPokemonEvent extends AllPokemonEvent {

  @override
  List<Object?> get props => [];

}