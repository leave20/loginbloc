import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/src/logic/LoginLogic.dart';
import 'package:loginbloc/src/login_bloc/login_bloc.dart';
import 'package:loginbloc/src/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => LoginBloc(
            logic: SimpleLoginLogic()),
        child: HomePage(),
      ),
    );
  }
}
