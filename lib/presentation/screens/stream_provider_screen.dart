import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/provider/provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final randomNames$ = ref.watch(namesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: randomNames$.when(
        loading: () => const Center(child:  CircularProgressIndicator()),
        error: (error, stackTrace) => Text('Error: $error'),
        data: (name) => Center(
          child: Text(name, style: titleStyle),
        ),
      ),
    );
  }
}
