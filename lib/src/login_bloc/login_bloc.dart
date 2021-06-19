import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginbloc/src/logic/LoginLogic.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginLogic logic;

  LoginBloc({@required this.logic}) : super(null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is DoLoginEvent) {
      yield* _doLogin(event);
    }
  }

  Stream<LoginState> _doLogin(DoLoginEvent event) async* {
    yield LoginInBlocState();

    // hacer el login
    // await Future.delayed(Duration(seconds: 3));

    try {
      var token = await logic.login(event.email, event.password);
      yield LoggedInBlocState(token);
    } on LoginException {
      yield ErrorBlocState("no se puso logear");
    }
  }
}
