part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginEmptyState extends LoginState {}
//
// class CityLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final User user;

  LoginLoadedState({@required this.user}) : assert(user != null);

  List<Object> get props => [user];
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}
