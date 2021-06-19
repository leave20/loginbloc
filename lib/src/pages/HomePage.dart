import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginbloc/src/login_bloc/login_bloc.dart';

import 'MainPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocListener<LoginBloc, LoginState>(
          listener: ( context, state) {
            if (state is ErrorBlocState) {
              _showError(context, state.message);
            }
            if (state is LoggedInBlocState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ( context) => MainPage()));
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
              builder: ( context, state) {
            return Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'email'),
                    controller: emailController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'password'),
                    obscureText: true,
                    controller: passwordController,
                  ),
                  if (state is LoginInBlocState)
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircularProgressIndicator())
                  else
                    ElevatedButton(
                      onPressed: _doLogin,
                      child: Text('Login'),
                    )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  void _doLogin() {
    BlocProvider.of<LoginBloc>(context)
        .add(DoLoginEvent(emailController.text, passwordController.text));
  }

  void _showError( context, String message) {
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
    ScaffoldMessenger(child: Text(message));
  }
}
