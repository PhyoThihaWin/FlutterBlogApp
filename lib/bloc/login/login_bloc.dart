import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:blog_app_fullstackdev/data/model/user.dart';
import 'package:blog_app_fullstackdev/data/repository/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({@required this.loginRepository}) : assert(loginRepository != null);

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is FetchLoginEvent) {
      //yield CityLoadingState();
      try {
        final response = await loginRepository.getLogin(event.email, event.password);
        yield LoginLoadedState(user: response);
      } on SocketException catch (e) {
        yield LoginErrorState(e.toString());
      } on Exception catch (e) {
        yield LoginErrorState(e.toString());
      }
    }
  }

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginEmptyState();
}
