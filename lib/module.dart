import 'package:blog_app_fullstackdev/bloc/login/login_bloc.dart';
import 'package:blog_app_fullstackdev/data/api/api_service.dart';
import 'package:blog_app_fullstackdev/data/repository/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.I;

void locator() {
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);

  ApiService apiService = ApiService(getIt.call());
  getIt.registerLazySingleton(() => apiService);

  LoginRepository loginRepository = LoginRepository(getIt.call());
  getIt.registerLazySingleton(() => loginRepository);

  // ignore: close_sinks
  LoginBloc loginBloc = LoginBloc(loginRepository: getIt.call());
  getIt.registerLazySingleton(() => loginBloc);
}
