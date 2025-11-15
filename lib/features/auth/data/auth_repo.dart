import 'package:dio/dio.dart';
import 'package:project/core/network/api_error.dart';
import 'package:project/core/network/api_exception.dart';
import 'package:project/core/network/api_service.dart';
import 'package:project/core/utils/pref_helper.dart';
import 'package:project/features/auth/data/user_model.dart';

class AuthRepo {
  ApiService service = ApiService();

  Future<UserModel> login(String email, String password) async {
    try {
      var response = await service.post('/login', {
        'email': email,
        'password': password,
      });

      final user = UserModel.fromjson(response['data']);
      if (user.token != null) {
        PrefHelper.saveToken(user.token!);
      }
      return user;
    } on DioException catch (e) {
      throw ApiException.handelError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      var response = await service.post('/register', {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      });

      final user = UserModel.fromjson(response['data']);
      if (user.token != null) {
        PrefHelper.saveToken(user.token!);
      }

      return user;
    } on DioException catch (e) {
      throw ApiException.handelError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<UserModel> getProfileData() async {
    try {
      final response = await service.get('/profile');

      final user = UserModel.fromjson(response['data']);
      return user;
    } on DioException catch (e) {
      throw ApiException.handelError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<UserModel> updateProfileData({
    String? name,
    String? email,

    String? address,
  }) async {
    try {
      final response = await service.post('/update-profile', {
        'name': name,
        'email': email,

        'address': address,
      });

      final user = UserModel.fromjson(response['data']);
      return user;
    } on DioException catch (e) {
      throw ApiException.handelError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<void> logout() async {
    final response = await service.post('/logout', {});

    await PrefHelper.clearToken();
  }
  
  
  
  
}
