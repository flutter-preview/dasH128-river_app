import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/provider/provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    final pokemonId = ref.watch(pokemonIdProvider);
    // final pokemonAsync = ref.watch(pokemonNameProvider(pokemonId));
    final pokemonAsync = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon: $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (value) => Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: colorScheme.primaryContainer,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png',
                  width: 100,
                  height: 100,
                ),
                Text(value, style: titleStyle),
              ],
            ),
          ),
          error: (error, stackTrace) => Text('err $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Icon(Icons.plus_one_rounded),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state + 1);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Icon(Icons.exposure_minus_1_rounded),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state - 1);
            },
          ),
        ],
      ),
    );
  }
}
