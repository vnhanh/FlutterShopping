import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping/domain/authentication/bloc/authentication_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:shopping/sample_counter/counter_bloc.dart';
import 'package:shopping/sample_counter/counter_event.dart';
import 'package:shopping/sample_counter/counter_state.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
  
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue
  //     ),
  //     home: BlocProvider<CounterBloc>(
  //       create: (context) => CounterBloc(),
  //       child: HomePage(title: ' Flutter Demo Home Page'),
  //     )
  //   );
  // }
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: HomePage(title: ' Flutter Demo Home Page'),
      )
    );
    // return BlocProvider<CounterBloc>(
    //   create: (context) => CounterBloc(),
    //   child: const HomePage(title: ' Flutter Demo Home Page'),
    // );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final CounterBloc bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Demo Flutter Bloc')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return const CircularProgressIndicator();
                  } else if (state is Success) {
                    return Text("${state.count}", style: Theme.of(context).textTheme.headline4);
                  }
                  return const Text("unknown");
                }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(CounterIncrement());
        },
      ),
    );
  }
}
