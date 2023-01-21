import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Dispose'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push('/counter');
          },
          child: Text('Counter'),
        ),
      ),
    );
  }
}
