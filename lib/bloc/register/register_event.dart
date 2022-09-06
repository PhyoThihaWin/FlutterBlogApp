part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class FetchRegisterEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final Future<MultipartFile> image;

  FetchRegisterEvent(
      {@required this.name, @required this.email, @required this.password, @required this.image})
      : assert(name != null && email != null && password != null && image !=null);

  @override
  // TODO: implement props
  List<Object> get props => [name, email, password,image];
}
