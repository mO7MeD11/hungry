import 'package:dio/dio.dart';
import 'package:project/core/utils/pref_helper.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://sonic-zdi0.onrender.com/api'),
  );

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler)async {
          final token =await PrefHelper.getToken() ;
          if(token != null && token.isNotEmpty)
          options.headers['authorization'] = 'Bearer$token';
        },
      ),
    );
  }
  Dio get dio => _dio;
}
