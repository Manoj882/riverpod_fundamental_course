import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//Riverpd5: Stream Provider

// for stream provider
final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (computationCount) => computationCount,
  );
});

class StreamProviderExample extends ConsumerWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Provider'),
      ),
      body: streamData.when(
        data: (data) => Center(
          child: Text(data.toString()),
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}