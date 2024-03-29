import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_course/counter_demo.dart';

final counterProvider =
    StateNotifierProvider.autoDispose<CounterDemo, int>((ref) {
  // ref.keepAlive();

  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 5), () {
    link.close();
  });
  ref.onDispose(
    () => timer.cancel(),
  );

  return CounterDemo();
});

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Dispose Example'),
      ),
      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: Icon(
          (Icons.add_outlined),
        ),
      ),
    );
  }
}
