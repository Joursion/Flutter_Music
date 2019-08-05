import 'package:dio/dio.dart';

class Fetch {
  Dio _dio = new Dio();

  request(String url, {Options options, Object params, Map<String, dynamic> headers}) async {
    var list = url.toLowerCase().split(' ');
    var reqUrl = '';
    var method = '';
    if (list.length == 2) {
      method = list[0];
      reqUrl = list[1];
    } else if (list.length == 1) {
      reqUrl = list[0];
      method = 'get';
    }
    
    if (options != null) {
      options.method = method;
    } else {
      options = new Options(method: method);
    }
    options.headers = headers;

    Response response;
    try {
      response = await _dio.request(reqUrl, data: params, options: options);
      if(response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Net error');
      }
    } catch (e) {
      print('ERROR: $e');
      return null;
    }
  }
}

final Fetch fetch = new Fetch();