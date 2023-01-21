import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//For State Provider
final counterProvider = StateProvider<int>((ref) {
  return 0;
});

//Riverpod2: StateProvider
class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('State Provider'),
        actions: [
          IconButton(
            onPressed: () {
              //reset counter data
              // ref.invalidate(counterProvider);
              ref.refresh(counterProvider);
            },
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: Text(
          count.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add_outlined),
      ),
    );
  }
}