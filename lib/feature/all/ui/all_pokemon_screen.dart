import 'package:basic_utils/basic_utils.dart';
import 'package:bloc_pokemon/core/helper/context_extension.dart';
import 'package:bloc_pokemon/feature/all/bloc/all_pokemon_bloc.dart';
import 'package:bloc_pokemon/feature/all/bloc/all_pokemon_event.dart';
import 'package:bloc_pokemon/feature/all/bloc/all_pokemon_state.dart';
import 'package:bloc_pokemon/feature/detail/ui/detail_pokemon_screen.dart';
import 'package:bloc_pokemon/data/model/all_pokemon_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllPokemonScreen extends StatelessWidget {
  const AllPokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllPokemonBloc()..add(LoadAllPokemonEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pokédex"),
        ),
        body: BlocBuilder<AllPokemonBloc, AllPokemonState>(
          builder: (_, state) {
            return switch (state) {
              AllPokemonLoadedState() => PagedGridView(
                  pagingController: state.pagingController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (BuildContext context, Results item,
                              int index) =>
                          InkWell(
                            onTap: () => context.push(destination: DetailPokemonScreen(
                              pokemonId: int.tryParse(
                                  state.getPokemonId(item.url ?? "-")) ??
                                  1,
                              pokemonName: item.name ?? "-",
                            )),
                            child: Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        state.getImageLink(item.url ?? "-"),
                                    fit: BoxFit.cover,
                                    height: 80,
                                  ),
                                  Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: const BoxDecoration(
                                          color: Colors.deepPurple,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            StringUtils.capitalize(
                                                item.name?.toString() ?? "-"),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )),
                ),
              AllPokemonLoadingState() => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              AllPokemonErrorState() => Center(
                  child: Text(state.error),
                )
            };
          },
        ),
      ),
    );
  }
}
