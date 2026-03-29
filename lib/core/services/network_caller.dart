import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
part '../models/network_response.dart';

class NetworkCaller {
  final Map<String,String> headers;
  final VoidCallback unAuthorized;
  final Logger _logger=Logger();
  NetworkCaller({required this.headers, required this.unAuthorized});
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      logRequest(url);
      Response response = await get(
        uri,
        headers:headers,
      );
      logResponse(url, response);
      final decodedBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccessed: true,
          responseCode: response.statusCode,
          body: decodedBody,
        );
      } else if (response.statusCode == 401) {
        unAuthorized();
        return NetworkResponse(
          isSuccessed: false,
          responseCode: response.statusCode,
          errorMassage: 'Unauthorized',
        );
      } else {
        return NetworkResponse(
          isSuccessed: false,
          responseCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccessed: false,
        responseCode: -1,
        errorMassage: e.toString(),
      );
    }
  }

   Future<NetworkResponse> postRequest(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    try {
      Uri uri = Uri.parse(url);
      logRequest(url, body: body);
      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      logResponse(url, response);
      final decodedBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccessed: true,
          responseCode: response.statusCode,
          body: decodedBody,
        );
      } else if (response.statusCode == 401) {
        unAuthorized();
        return NetworkResponse(
          isSuccessed: false,
          responseCode: response.statusCode,
          errorMassage: 'Unauthorized',
        );
      } else {
        return NetworkResponse(
          isSuccessed: false,
          responseCode: response.statusCode,
          errorMassage: decodedBody['data'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccessed: false,
        responseCode: -1,
        errorMassage: e.toString(),
      );
    }
  }



  void logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      'Url:$url\n'
          'Body:$body',
    );
  }

   void logResponse(String url, Response response) {
    _logger.i(
      'Url:$url\n'
          'Body:${response.body}\n'
          'Status code:${response.body}',
    );
  }
}

