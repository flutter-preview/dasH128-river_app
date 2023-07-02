import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/domain/domain.dart';
import 'package:river_app/presentation/provider/provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de invitados'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(todosProvider.notifier).addTodo();
        },
      ),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final todos = ref.watch(todosProvider);

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        Todo todo = todos[index];
        return SwitchListTile(
          title: Text(
            todo.description,
            style: titleStyle,
          ),
          value: todo.done,
          onChanged: (_) {
            ref.read(todosProvider.notifier).toggleTodo(todo.id);
          },
        );
      },
    );
  }
}
