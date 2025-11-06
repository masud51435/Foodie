import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:foodie/backend/dio_exception_handler.dart';
import 'package:foodie/core/utils/snackbar_helper.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      'zoneId': '[1]',
      'latitude': '23.735129',
      'longitude': '90.425614',
    });

    // Debug logs
    if (kDebugMode) {
      print('🟦 [REQUEST] => ${options.method} ${options.uri}');
      print('Headers: ${options.headers}');
      if (options.data != null) {
        print('Body: ${options.data}');
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log response
    if (kDebugMode) {
      print('🟩 [RESPONSE] (${response.statusCode}) => ${response.realUri}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle and log Dio errors centrally
    final appError = DioExceptionHandler.handle(err);

    if (kDebugMode) {
      print('🟥 [ERROR] => ${appError.message} (Code: ${appError.statusCode})');
    }

    SnackbarHelper.showError(
      appError.message,
      title: 'Error ${appError.statusCode}',
    );

    // Forward the error as AppError instead of DioException
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: appError,
      ),
    );
  }
}
