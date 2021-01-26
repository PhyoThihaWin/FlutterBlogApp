part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class FetchLoginEvent extends LoginEvent {
  final String email;
  final String password;

  FetchLoginEvent({@required this.email, @required this.password})
      : assert(email != null && password != null);

  @override
  // TODO: implement props
  List<Object> get props => [email, password];
}
