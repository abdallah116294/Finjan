import 'dart:convert';
import 'dart:io';

import 'package:finjan/core/error/exception.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? headers}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
      //  headers: headers,
      );

      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> post(String endpoint, dynamic data, {Map<String, dynamic>? headers}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        body: jsonEncode(data),
        //headers: headers,
      );

      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> put(String endpoint, dynamic data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$endpoint'),
        body: jsonEncode(data),
      );

      return _handleResponse(response);
    } catch (e) {
      _handleError(e);
    }
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      _handleError(response);
    }
  }

  void _handleError(dynamic error) {
    // Handle error based on your requirements
    if (error is SocketException) {
      throw NoInternetConnectionException();
    } else if (error is http.ClientException) {
      throw NoInternetConnectionException();
    } else {
      throw error;
    }
  }
}
