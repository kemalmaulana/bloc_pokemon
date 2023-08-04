import 'package:bloc_pokemon/base/base_bloc.dart';
import 'package:bloc_pokemon/data/model/all_pokemon_model.dart';
import 'package:bloc_pokemon/feature/all/bloc/all_pokemon_event.dart';
import 'package:bloc_pokemon/feature/all/bloc/all_pokemon_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllPokemonBloc extends BaseBloc<AllPokemonEvent, AllPokemonState> {

  static const _pageSize = 20;

  final PagingController<int, Results> pagingController =
  PagingController(firstPageKey: 0);

  AllPokemonBloc(): super(AllPokemonLoadingState()) {
    on<AllPokemonEvent>((event, emit) async {
      emit(AllPokemonLoadingState());
      try {
        // final results = await repos.getAllPokemon(0, 20);
        pagingController.addPageRequestListener((pageKey) {
          _fetchPage(pageKey);
        });
        emit(AllPokemonLoadedState(pagingController));
        // emit(AllPokemonLoadedState(results.results));
      } catch(e) {
        emit(AllPokemonErrorState(e.toString()));
      }
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await repos.getAllPokemon(pageKey, _pageSize);
      final isLastPage = (newItems.results?.length ?? 0) < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.results ?? []);
      } else {
        final nextPageKey = pageKey + (newItems.results?.length ?? 0);
        pagingController.appendPage(newItems.results ?? [], nextPageKey.toInt());
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}