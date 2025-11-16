import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppInterceptor extends Interceptor {
  final Map<String, dynamic> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  String? _authToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // You can modify the request here (e.g., add headers)
    if (kDebugMode) {
      print('Request[${options.method}] => PATH: ${options.path}');
    }
    options.headers.addAll(_defaultHeaders);
    if (_authToken != null) {
      options.headers['Authorization'] = 'Bearer $_authToken';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // You can process the response here
    if (kDebugMode) {
      print(
      'Response[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // You can handle errors here
    if (kDebugMode) {
      print(
      'Error[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    }
    super.onError(err, handler);
  }

  void setAuthToken(String token) {
    _authToken = token;
  }

  // Method to clear auth token
  void clearAuthToken() {
    _authToken = null;
  }

  // Method to add custom headers
  void addHeader(String key, dynamic value) {
    _defaultHeaders[key] = value;
  }

  // Method to remove header
  void removeHeader(String key) {
    _defaultHeaders.remove(key);
  }
}
