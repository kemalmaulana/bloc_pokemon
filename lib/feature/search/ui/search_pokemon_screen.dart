import 'package:bloc_pokemon/feature/search/bloc/search_pokemon_bloc.dart';
import 'package:bloc_pokemon/feature/search/bloc/search_pokemon_event.dart';
import 'package:bloc_pokemon/feature/search/bloc/search_pokemon_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPokemonScreen extends StatelessWidget {
  const SearchPokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchPokemonBloc(),
      child: BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: const Text("Search Pokemon"),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onSubmitted: (pokemonName) {
                        context.read<SearchPokemonBloc>().add(LoadDetailPokemon(pokemonName));
                      },
                    ),
                  ),
                ),
              ),
              body: Center(
                child: switch (state) {
                  SearchPokemonStandbyState() => const Offstage(),
                  SearchPokemonLoadedState() => Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.96,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 72,
                            ),
                            const Text(
                              "About",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.scale),
                                        ),
                                        Text(
                                            "${((state.detailPokemonModel?.weight ?? 0) / 10).toString()} Kg")
                                      ],
                                    ),
                                    const Text("Weight", style: TextStyle(fontWeight: FontWeight.w600),)
                                  ],
                                ),
                                Container(
                                  height: 60,
                                  width: 1,
                                  margin: const EdgeInsets.all(8),
                                  color: Colors.grey,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.straighten),
                                        ),
                                        Text(
                                            "${((state.detailPokemonModel?.height ?? 0) / 10).toString()} m")
                                      ],
                                    ),
                                    const Text("Height", style: TextStyle(fontWeight: FontWeight.w600),)
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Base Stat",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text("ATK"),
                                      Text("DEF"),
                                      Text("HP"),
                                      Text("SP-ATK"),
                                      Text("SP-DEF"),
                                      Text("SPD"),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.grey,
                                  height: 133,
                                  width: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: state.detailPokemonModel?.stats
                                        ?.map((e) => Text(
                                        (e.baseStat?.toInt()).toString()))
                                        .toList() ??
                                        [],
                                  ),
                                ),
                                Column(
                                  children: state.detailPokemonModel?.stats
                                      ?.map((e) => SizedBox(
                                      height: 20,
                                      width: MediaQuery.sizeOf(context)
                                          .width *
                                          0.66,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.all(8.0),
                                        child: LinearProgressIndicator(
                                            value:
                                            (e.baseStat?.toDouble() ??
                                                0) /
                                                255),
                                      )))
                                      .toList() ??
                                      [],
                                )
                              ],
                            ),
                            const SizedBox(height: 24)
                          ],
                        ),
                      ),
                      Positioned(
                        top: -120,
                        left: 0,
                        right: 0,
                        child: CachedNetworkImage(
                          imageUrl: state.getImageLink(
                            state.detailPokemonModel?.id.toString(),
                          ),
                          height: 200,
                          width: 200,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                  SearchPokemonLoadingState() => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  SearchPokemonErrorState() => Center(
                    child: Text(state.error),
                  )
                },
              ),
            );
          }),
    );
  }
}
