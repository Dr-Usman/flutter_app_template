import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shapes/core/constants/api_endpoints.dart';
import 'package:shapes/services/api/base_api_model.dart';
import 'package:shapes/shared/utils/internet_checker.dart';
import 'package:shapes/shared/utils/loading/custom_loading_dialog.dart';
import 'package:shapes/shared/utils/toast/custom_toast.dart';

enum ApiMethod { get, post, put, patch, delete }

class ApiService {
  static const int _timeoutSeconds = 60;

  static Future<dynamic> request({
    required String endpoint,
    ApiMethod method = ApiMethod.get,
    Map<String, dynamic>? data,
    Map<String, String>? queryParams,
    dynamic Function(Map<String, dynamic>)? fromJson,
    bool showLoading = true,
    bool showSuccessToast = false,
    bool returnStatusOnly = false,
  }) async {
    if (showLoading) CustomLoadingDialog.show(message: 'Loading...');

    try {
      final bool hasInternet = await InternetChecker.hasInternet();
      if (!hasInternet) {
        debugPrint('No internet connection');
        CustomToast.show(
          'No internet connection. Please check your connection and try again.',
        );
        return null;
      }

      final String url = '${ApiEndpoints.baseUrl}$endpoint';
      Uri? uri = Uri.tryParse(url);

      if (uri == null) {
        debugPrint('Invalid URL: $url');
        CustomToast.show('Invalid URL: $url');
        return null;
      }

      if (queryParams != null && queryParams.isNotEmpty) {
        uri = uri.replace(queryParameters: queryParams);
      }

      final Map<String, String> headers = await _getHeaders();

      debugPrint('APIRequest [${method.name.toUpperCase()}] $uri');
      if (data != null) debugPrint('APIRequest body: ${json.encode(data)}');

      final Duration timeout = const Duration(seconds: _timeoutSeconds);
      final String? body = data != null ? json.encode(data) : null;

      http.Response response;
      switch (method) {
        case ApiMethod.get:
          response = await http.get(uri, headers: headers).timeout(timeout);
          break;
        case ApiMethod.post:
          response = await http
              .post(uri, headers: headers, body: body)
              .timeout(timeout);
          break;
        case ApiMethod.put:
          response = await http
              .put(uri, headers: headers, body: body)
              .timeout(timeout);
          break;
        case ApiMethod.patch:
          response = await http
              .patch(uri, headers: headers, body: body)
              .timeout(timeout);
          break;
        case ApiMethod.delete:
          response = await http
              .delete(uri, headers: headers, body: body)
              .timeout(timeout);
          break;
      }

      debugPrint('APIResponse [${response.statusCode}] $uri\n${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final BaseApiModel baseResult = BaseApiModel.fromJson(responseBody);

        if (baseResult.status == true) {
          if (showSuccessToast) {
            CustomToast.show(
              baseResult.message ?? 'Request successful',
              isSuccess: true,
            );
          }

          if (returnStatusOnly) return baseResult.status;

          if (fromJson != null && baseResult.data != null) {
            if (baseResult.data is List) {
              return (baseResult.data as List)
                  .map((item) => fromJson(item as Map<String, dynamic>))
                  .toList();
            }
            return fromJson(baseResult.data as Map<String, dynamic>);
          }

          return baseResult.data;
        } else {
          debugPrint(
            'APIResponse status=false [$endpoint]: ${baseResult.message}',
          );
          CustomToast.show(
            baseResult.message ?? 'Something went wrong. Please try again.',
          );
          return returnStatusOnly ? baseResult.status : null;
        }
      } else {
        debugPrint('APIResponse HTTP ${response.statusCode} [$endpoint]');
        CustomToast.show(
          'Request failed (${response.statusCode}). Please try again.',
        );
        return null;
      }
    } on TimeoutException {
      debugPrint('APIRequest timed out [$endpoint]');
      CustomToast.show('Request timed out. Please try again.');
      return null;
    } catch (e) {
      debugPrint('APIRequest error [$endpoint]: $e');
      CustomToast.show('Something went wrong. Please try again.');
      return null;
    } finally {
      if (showLoading) CustomLoadingDialog.hide();
    }
  }

  static Future<Map<String, String>> _getHeaders() async {
    // final token = await SecureStorage.getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // if (token != null) 'Authorization': 'Bearer $token',
    };
  }
}
