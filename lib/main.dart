import 'package:flutter/material.dart';

import 'bloc/bloc_provide.dart';
import 'bloc/country_bloc.dart';
import 'models/country.dart';
import 'screens/home_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: CountryBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

