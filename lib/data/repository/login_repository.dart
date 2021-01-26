import 'package:blog_app_fullstackdev/data/api/api_service.dart';
import 'package:blog_app_fullstackdev/data/model/user.dart';

class LoginRepository {
  final ApiService _apiService;

  LoginRepository(this._apiService);

  Future<User> getLogin(String email, String password) =>
      _apiService.getLogin(email, password);
  
}
