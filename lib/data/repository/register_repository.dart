import 'package:blog_app_fullstackdev/data/api/api_service.dart';
import 'package:blog_app_fullstackdev/data/model/user.dart';
import 'package:dio/dio.dart';

class RegisterRepository {
  final ApiService _apiService;

  RegisterRepository(this._apiService);

  Future<User> getRegister(
          String name, String email, String password, Future<MultipartFile> image) =>
      _apiService.getRegister(name, email, password, image);
}
