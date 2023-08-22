import 'package:dio/dio.dart';

class BaseAPI {
  static String base = "";

  dynamic client;

  BaseAPI() {
    client = Dio(BaseOptions(
      baseUrl: base,
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 10000),
      followRedirects: false,
    ));
  }

  Future<Response> get(String url, {params}) async {
    return await client.get(url, queryParameters: params);
  }

  Future<Response> post(String url, {body}) async {
    return await client.post(url,
        data: body != null ? FormData.fromMap(body) : null);
  }
}

class PublicAPI extends BaseAPI {
  Future<User> login(
      String email, String password, String? otpCode, String captcha) async {
    var body = {
      'email': email,
      'password': password,
      "captcha_response": captcha,
      'otp_code': otpCode ?? ""
    };

    final response = await post("auth/identity/sessions", body: body);

    return User.fromJson(response.data);
  }

  Future getUser() async {
    final response = await get("auth/resource/users/me");

    return User.fromJson(response.data);
  }
}
