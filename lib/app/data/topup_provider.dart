import 'package:e_tol/url.dart';
import 'package:get/get.dart';

class TopupProvider extends GetConnect {
  Future<Response> getTopup() {
    return get('${baseUrl}/topups', headers: AuthHeader);
  }

  Future<Response> nextData(var page) {
    return get('${baseUrl}/topups?page=${page}', headers: AuthHeader);
  }

  Future<Response> createTopup(var data) {
    return post('${baseUrl}/topups', data, headers: AuthHeader);
  }
}
