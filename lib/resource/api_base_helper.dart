import 'dart:developer';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:newyorktimes/utils/constants.dart';

class ApiBaseHelper {
  static final client = http.Client();

  static Future<Response> httpGetRequest(String endPoint) async {
    try {
      log("URL:   ${AppConstants.baseUrl}$endPoint");
      Response response = await client.get(
        Uri.parse('${AppConstants.baseUrl}$endPoint'),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
