import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_course/counter_demo.dart';


// for State Notifier Provider
final counterProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());


//Riverpod3: StateNotifierProvider
class StateNotifierProviderExample extends ConsumerWidget {
  const StateNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'StateNotifierProvider',
        ),
      ),
      body: Center(
        child: Text('$counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: Icon(
          Icons.add_outlined,
        ),
      ),
    );
  }
}
