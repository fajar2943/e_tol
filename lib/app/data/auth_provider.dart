import 'package:e_tol/url.dart';
import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  Future<Response> register(var data) {
    return post('${baseUrl}/register', data, headers: BasicHeader);
  }

  Future<Response> login(var data) {
    return post('${baseUrl}/login', data, headers: BasicHeader);
  }
}
