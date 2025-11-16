import 'package:banking/providers/interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProvider {
  late final Dio _dio;
  late final AppInterceptor _interceptor;
  ApiProvider() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
    _interceptor = AppInterceptor();
    _dio.interceptors.add(_interceptor);
  }

  // GET method - no headers parameter needed
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // POST method - no headers parameter needed
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // PUT method - no headers parameter needed
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // DELETE method - no headers parameter needed
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(DioException e) {
    if (e.response != null) {
      if (kDebugMode) {
        print('Error Response data: ${e.response?.data}');
        print('Error Response status: ${e.response?.statusCode}');
      }
    } else {
      if (kDebugMode) {
        print('Error without response: ${e.message}');
      }
    }
  }

  // Expose interceptor methods for header management
  void setAuthToken(String token) {
    _interceptor.setAuthToken(token);
  }

  void clearAuthToken() {
    _interceptor.clearAuthToken();
  }

  void addHeader(String key, dynamic value) {
    _interceptor.addHeader(key, value);
  }

  void removeHeader(String key) {
    _interceptor.removeHeader(key);
  }
}
