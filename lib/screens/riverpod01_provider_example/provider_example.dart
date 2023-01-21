import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Riverpod1 ---> Provider

final nameProvider = Provider<String>((ref) {
  return 'Hello Samikshya';
});

class ProviderExample extends ConsumerStatefulWidget {
  const ProviderExample({super.key});

  @override
  ConsumerState<ProviderExample> createState() => _ProviderExampleState();
}

class _ProviderExampleState extends ConsumerState<ProviderExample> {
  @override
  void initState() {
    final secondName = ref.read(nameProvider);
    super.initState();
    print(secondName);
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod Example'),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}