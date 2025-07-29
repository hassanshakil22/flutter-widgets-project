import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/app_setup/core/consts/api_urls.dart';
import 'package:flutter_widgets/app_setup/core/consts/http_codes.dart';
import 'package:flutter_widgets/app_setup/core/consts/http_exceptions.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl;
  final Duration timeout;

  HttpService({
    this.baseUrl = ApiUrls.baseURL,
    this.timeout = const Duration(seconds: 15),
  });

  void _log(String message) {
    debugPrint('[API LOG]: $message');
  }

  Future<dynamic> get(String path) async {
    try {
      final uri = Uri.parse(baseUrl + path);

      _log("GET Request: $uri");
      _log("Headers: Authorization: ${"AuthProvider.token"}");

      final response = await http
          .get(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': "Bearer \${AuthProvider.token}",
            },
          )
          .timeout(timeout);

      _log("Response Status: ${response.statusCode}");
      _log("Response Body: ${response.body}");

      _handleErrors(response.statusCode, json.decode(response.body));
      return json.decode(response.body);
    } on SocketException {
      throw const SocketException("No internet connection");
    } on TimeoutException {
      throw TimeoutException('API not responded in time');
    }
  }

  Future<dynamic> post(
    String path, {
    required Map<dynamic, dynamic> requestBody,
  }) async {
    try {
      final uri = Uri.parse(baseUrl + path);

      _log("POST Request: $uri");
      _log("Headers: Authorization: \${AuthProvider.token}");
      _log("Request Body: $requestBody");

      final response = await http
          .post(
            uri,
            body: jsonEncode(requestBody),
            headers: {
              'Authorization': "Bearer \${AuthProvider.token}",
              'accept': '*/*',
              'Content-Type': 'application/json',
            },
          )
          .timeout(timeout);

      _log("Response Status: ${response.statusCode}");
      _log("Response Body: ${response.body}");

      _handleErrors(response.statusCode, json.decode(response.body));
      return json.decode(response.body);
    } on SocketException {
      throw const SocketException("No internet connection");
    } on TimeoutException {
      throw TimeoutException('API not responded in time');
    }
  }

  Future<dynamic> patch(String path, {required Map requestBody}) async {
    try {
      final uri = Uri.parse(baseUrl + path);

      _log("POST Request: $uri");
      _log("Headers: Authorization: ${"AuthProvider.token"}");
      _log("Request Body: $requestBody");

      final response = await http
          .patch(
            uri,
            body: jsonEncode(requestBody),
            headers: {
              'Authorization': "Bearer ${"AuthProvider.token"}",
              'Content-Type': 'application/json',
            },
          )
          .timeout(timeout);

      _log("Response Status: ${response.statusCode}");
      _log("Response Body: ${response.body}");

      _handleErrors(response.statusCode, json.decode(response.body));

      return json.decode(response.body);
    } on SocketException {
      throw const SocketException("No internet connection");
    } on TimeoutException {
      throw TimeoutException('API not responded in time');
    }
  }

  Future<dynamic> put(String path, {required Map requestBody}) async {
    try {
      final uri = Uri.parse(baseUrl + path);

      _log("POST Request: $uri");
      _log("Headers: Authorization: ${"AuthProvider.token"}");
      _log("Request Body: $requestBody");

      final response = await http
          .put(
            uri,
            body: jsonEncode(requestBody),
            headers: {
              'Authorization': "Bearer ${"AuthProvider.token"}",
              'Content-Type': 'application/json',
            },
          )
          .timeout(timeout);

      _log("Response Status: ${response.statusCode}");
      _log("Response Body: ${response.body}");

      _handleErrors(response.statusCode, json.decode(response.body));

      return json.decode(response.body);
    } on SocketException {
      throw const SocketException("No internet connection");
    } on TimeoutException {
      throw TimeoutException('API not responded in time');
    }
  }

  Future<void> putForm(String path, File imageFile) async {
    try {
      final imageBytes = await imageFile.readAsBytes();

      _log("Put Request For file form upload to S3: $path");
      _log("Headers: 'Content-Type': 'image/jpeg',");
      _log("Request Body: $imageBytes");

      final response = await http
          .put(
            Uri.parse(path),
            headers: {'Content-Type': 'image/jpeg'},
            body: imageBytes,
          )
          .timeout(timeout);

      _log("Response Status: ${response.statusCode}");
      if (response.statusCode == 200) {
        _log("Uploaded successfully to S3");
      } else {
        _log("Failed to upload");
        throw Exception("Failed to upload image to S3");
      }
    } on SocketException {
      throw const SocketException("No internet connection");
    } on TimeoutException {
      throw TimeoutException('API not responded in time');
    }
  }

  // Future<dynamic> delete(String path, Map<String, dynamic> requestBody) async {
  //   try {
  //     final uri = Uri.parse(baseUrl + path);
  //     final token = AuthProvider.token;
  //     final response = await http.delete(uri, headers: {
  //       'Authorization': token,
  //       'Content-Type': 'application/json',
  //     }).timeout(timeout);
  //     _handleErrors(response);
  //     return json.decode(response.body);
  //   } on SocketException {
  //     throw const SocketException("No internet connection");
  //   } on TimeoutException {
  //     throw TimeoutException('API not responded in time');
  //   }
  // }

  void _handleErrors(int statusCode, Map<String, dynamic> response) {
    // final url = response.request?.url;
    final message = response["message"].toString();

    switch (statusCode) {
      case HttpCodes.OK:
      case HttpCodes.Accepted:
      case HttpCodes.Created:
        return;

      case HttpCodes.BadRequest:
        throw BadRequestException(message);

      case HttpCodes.Unauthorized:
      case HttpCodes.Forbidden:
        throw UnauthorizedException(message);

      case HttpCodes.NotFound:
        throw BadRequestException(message);

      case HttpCodes.InternalServerError:
      case HttpCodes.ServiceUnavailable:
      case HttpCodes.GatewayTimeout:
      default:
        throw UnknownException(message);
    }
  }
}
