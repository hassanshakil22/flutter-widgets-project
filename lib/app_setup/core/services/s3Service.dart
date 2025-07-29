import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/app_setup/core/consts/api_urls.dart';
import 'package:flutter_widgets/app_setup/core/services/http_service.dart';

class S3Service {
  S3Service({required this.httpService});
  final HttpService httpService;

  Future<String> fileUpload(
    String url,
    File imageFile,
    String fileName,
    String fileType,
  ) async {
    dynamic res = await httpService.post(
      ApiUrls.dataUpload,
      requestBody: {"fileName": fileName, "fileType": fileType},
    );

    final backendResponse = UploadUrlResponse.fromJson(
      res as Map<String, dynamic>,
    );

    debugPrint(
      "status: ${backendResponse.status} \n  message:  ${backendResponse.message} \n data : ${backendResponse.data}  ",
    );

    String uploadUrl = backendResponse.data.uploadUrl;
    String key = backendResponse.data.key;

    debugPrint('UploadData(uploadUrl: $uploadUrl, key: $key)');

    await httpService.putForm(uploadUrl, imageFile);

    return key;
  }
}

class UploadUrlResponse {
  final String status;
  final String message;
  final UploadData data;

  UploadUrlResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UploadUrlResponse.fromJson(Map<String, dynamic> json) {
    return UploadUrlResponse(
      status: json['status'],
      message: json['message'],
      data: UploadData.fromJson(json['data']),
    );
  }
}

class UploadData {
  final String uploadUrl;
  final String key;

  UploadData({required this.uploadUrl, required this.key});

  factory UploadData.fromJson(Map<String, dynamic> json) {
    return UploadData(uploadUrl: json['uploadUrl'], key: json['key']);
  }
}