import 'package:dio/dio.dart';
import '../storage/local_storage.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://zouad-n2k6.onrender.com/api",
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  )..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await LocalStorage.getToken();

        if (token != null && token.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $token";
        }

        return handler.next(options);
      },
    ),
  );
}
