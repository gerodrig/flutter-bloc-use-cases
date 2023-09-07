import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app/presentation/blocs/blocs.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  int pokemonId = 25;

  @override
  Widget build(BuildContext context) {
    final pokemonBloc = context.watch<PokemonBloc>();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'PokemonID: $pokemonId',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        ),
        body: Center(
            child: FutureBuilder(
                future: pokemonBloc.fetchPokemonName(pokemonId),
                initialData:
                    pokemonBloc.state.pokemons[pokemonId] ?? '...Loading',
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(color: Colors.red);
                  }

                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  return Text(snapshot.data);
                })),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn-add',
              backgroundColor: Colors.white,
              child: const Icon(Icons.plus_one),
              onPressed: () {
                setState(() {
                  pokemonId++;
                });
              },
            ),
            const SizedBox(height: 15),
            FloatingActionButton(
              heroTag: 'btn-minus',
              backgroundColor: Colors.red,
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                setState(() {
                  if (pokemonId > 1) {
                    pokemonId--;
                  }
                });
              },
            ),
          ],
        ));
  }
}
