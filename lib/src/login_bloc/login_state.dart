part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}
//Estado inicial
class LoginInitial extends LoginState {

  @override
  List<Object> get props => [];
}

//Logeando
class LoginInBlocState extends LoginState{

  @override
  List<Object> get props => [];

}
//Una vez logeado
class LoggedInBlocState extends LoginState{

  final String token;

  LoggedInBlocState(this.token);

  @override
  List<Object> get props => [token];
}
//Error al logear
class ErrorBlocState extends LoginState{
  final String message;
  ErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
