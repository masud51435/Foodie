import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:foodie/backend/app_error.dart';

class DioExceptionHandler {
  static AppError handle(DioException e) {
    final response = e.response;
    int? statusCode = response?.statusCode;
    String message = _resolveMessage(e, response);
    String? errorCode = _extractErrorCode(response);

    return AppError(message: message, statusCode: statusCode, code: errorCode);
  }

  /// Maps Dio error types and response messages .
  static String _resolveMessage(DioException e, Response? response) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return 'Connection timed out. Please check your internet connection.';
      case DioExceptionType.badResponse:
        return _handleBadResponse(response);
      case DioExceptionType.cancel:
        return 'The request was cancelled.';
      case DioExceptionType.unknown:
        return 'Unable to connect to the server. Please check your internet.';
      default:
        return 'Unexpected error occurred. Please try again.';
    }
  }

  /// Extracts and formats server-side messages.
  static String _handleBadResponse(Response? response) {
    if (response == null) return 'No response from the server.';

    developer.log(
      '❌ Dio Error Response (${response.statusCode}): ${response.data}',
      name: 'DioClient',
    );

    final data = response.data;
    String message = 'Unexpected error from server.';
    if (data is Map<String, dynamic>) {
      //Try simple message fields first
      message = data['message'] ?? data['error'] ?? message;

      //Case 1: Laravel-style map of errors
      if (data['errors'] is Map) {
        final errors = (data['errors'] as Map).values
            .expand((v) => v)
            .map((e) => e.toString())
            .toList();
        if (errors.isNotEmpty) {
          message = errors.join('\n');
        }
      }
      //Case 2: Array of error objects 
      else if (data['errors'] is List) {
        final List errors = data['errors'];
        final messages = errors
            .map(
              (e) => (e is Map && e.containsKey('message'))
                  ? e['message']
                  : e.toString(),
            )
            .toList();
        if (messages.isNotEmpty) {
          message = messages.join('\n');
        }
      }
    }

    switch (response.statusCode) {
      case 400:
        return message.isNotEmpty ? message : 'Bad Request.';
      case 401:
        return message.isNotEmpty
            ? message
            : 'Authentication failed. Please log in again.';
      case 403:
        return 'You do not have permission to perform this action.';
      case 404:
        return 'Requested resource not found.';
      case 409:
        return 'Conflict detected. Please try again.';
      case 422:
        return message.isNotEmpty
            ? message
            : 'Validation failed. Please check your input.';
      case 500:
      case 502:
      case 503:
        return 'Server error. Please try again later.';
      default:
        return message;
    }
  }

  /// Extracts error code if available from API.
  static String? _extractErrorCode(Response? response) {
    if (response?.data is Map<String, dynamic>) {
      return response?.data['code'];
    }
    return null;
  }
}
