import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:blog_app_fullstackdev/bloc/login/login_bloc.dart';
import 'package:blog_app_fullstackdev/data/model/user.dart';
import 'package:blog_app_fullstackdev/data/repository/register_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository registerRepository;

  RegisterBloc({@required this.registerRepository}) : assert(registerRepository != null);

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is FetchRegisterEvent) {
      //yield CityLoadingState();
      try {
        final response = await registerRepository.getRegister(event.name,event.email, event.password,event.image);
        yield RegisterLoadedState(user: response);
      } on SocketException catch (e) {
        yield RegisterErrorState(e.toString());
      } on Exception catch (e) {
        yield RegisterErrorState(e.toString());
      }
    }
  }

  @override
  // TODO: implement initialState
  RegisterState get initialState => RegisterEmptyState();
}
