import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fwc_album_app/app/core/config/env/env.dart';
import 'package:fwc_album_app/app/core/rest/interceptor/auth_interceptor.dart';

class CustomDio extends DioForNative {
  final _authInterceptor = AuthInterceptor();

  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.i['backend_base_url'] ?? '',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
    ));
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unAuth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
