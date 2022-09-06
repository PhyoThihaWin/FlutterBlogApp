part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterEmptyState extends RegisterState {}

class RegisterLoadedState extends RegisterState {
  final User user;

  RegisterLoadedState({@required this.user}) : assert(user != null);

  List<Object> get props => [user];
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}
