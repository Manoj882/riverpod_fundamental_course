import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_course/screens/auto_dispose_example/counter_screen.dart';
import 'package:riverpod_course/screens/auto_dispose_example/home_screen.dart';
import 'package:riverpod_course/screens/riverpod01_provider_example/provider_example.dart';
import 'package:riverpod_course/screens/riverpod02_state_provider_example/state_provider_example.dart';
import 'package:riverpod_course/screens/riverpod03_state_notifier_provider_example/state_notifier_provider_example.dart';
import 'package:riverpod_course/screens/riverpod04_future_provider_example/user_data_screen.dart';
import 'package:riverpod_course/screens/riverpod05_stream_provider_example/stream_provider_example.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    //Riverpod01: Provider
    // GoRoute(
    //     path: '/',
    //     builder: (context, state) => const ProviderExample(),
    //   ),

    //Riverpod02: State Provider
    // GoRoute(
    //     path: '/',
    //     builder: (context, state) => const StateProviderExample(),
    //   ),
    
    ////Riverpod03: State Notifier Provider
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const StateNotifierProviderExample(),
    // ),

    // //Riverpod04: Future Provider
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const UserDataScreen(),
    // ),

    //Riverpod05: Stream Provider
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const StreamProviderExample(),
    // ),


    //Riverpod: Auto Dispose, keep alive, timer cancel
    GoRoute(path: '/', builder: (context, state) => const HomeScreen(),),
    GoRoute(
      path: '/counter',
      builder: ((context, state) => const CounterScreen()),
    ),
  ],
);
