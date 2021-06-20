import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/third_screen.dart';

import 'cubit/counter_cubit.dart';
import 'cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) =>
            BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(
                title: 'HomeScreen',
                color: Colors.blueAccent,
              ),
            ),
        '/second': (context) =>
            BlocProvider.value(
              value: _counterCubit,
              child:SecondScreen(
                title: 'SecondScreen',
                color: Colors.redAccent,
              ),),
        '/third': (context) =>
            BlocProvider.value(
              value: _counterCubit,
              child: ThirdScreen(
                title: 'ThirdScreen',
                color: Colors.greenAccent,
              ),
            )
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}


