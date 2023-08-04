import 'package:bloc_pokemon/data/repos/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(super.initialState);
  final Repositories repos = GetIt.I.get<Repositories>();

}