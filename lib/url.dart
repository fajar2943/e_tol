import 'package:e_tol/my_storage.dart';

var BasicHeader = {
  'Accept': 'application/json',
};

var AuthHeader = {
  'Accept': 'application/json',
  'Authorization': 'Bearer ${box.read('token')}'
};

String url =
    'http://9dd8-2001-448a-4083-1374-988c-d596-5297-5a5d.ngrok-free.app';
// String url = 'https://domain.com';
String baseUrl = '${url}/api';
