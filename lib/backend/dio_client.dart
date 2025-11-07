import 'package:dio/dio.dart';
import 'package:foodie/backend/app_interceptors.dart';
import 'api_client.dart';
import 'method_types.dart';
import 'dart:developer' as developer;

class DioClient implements ApiClient {
  late Dio _client;

  DioClient({required String baseUrl}) {
    _client = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(AppInterceptor())
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  @override
  Future<T> request<T>({
    required String path,
    required MethodType method,
    Object? payload,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    T Function(Map<String, dynamic> json)? parse,
    T Function(List<dynamic> json)? parseList,
    bool? showLoader,
  }) async {
    T result;
    Response? response;
    final options = Options(headers: headers);

    try {
      switch (method) {
        case MethodType.get:
          response = await _client.get(
            path,
            data: payload,
            queryParameters: queryParams,
            options: options,
          );
          break;
        case MethodType.post:
          response = await _client.post(
            path,
            data: payload,
            queryParameters: queryParams,
            options: options,
          );
          break;
        case MethodType.put:
          response = await _client.put(
            path,
            data: payload,
            queryParameters: queryParams,
            options: options,
          );
          break;
        case MethodType.delete:
          response = await _client.delete(
            path,
            data: payload,
            queryParameters: queryParams,
            options: options,
          );
          break;
        case MethodType.patch:
          response = await _client.patch(
            path,
            data: payload,
            queryParameters: queryParams,
            options: options,
          );
          break;
      }

      developer.log('DioClient.request: $response');
      result = await parseData(response, parse, parseList);
    } on DioException {
      // Interceptor already shows snackbar & logs
      rethrow;
    }

    return result;
  }

  Future<T> parseData<T>(
    Response? response,
    T Function(Map<String, dynamic> json)? parse,
    T Function(List<dynamic> json)? parseList,
  ) async {
    if (response?.data is List && parseList != null) {
      return parseList(response!.data);
    } else if (response?.data is Map && parse != null) {
      return parse(response!.data);
    } else {
      return response?.data as T;
    }
  }
}
