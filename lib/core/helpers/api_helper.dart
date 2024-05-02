import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:jala/core/const/app_const.dart';
import 'package:jala/core/error/exception.dart';

@injectable
class ApiHelper {
  final Dio dio;

  ApiHelper()
      : dio = Dio(
          BaseOptions(
            connectTimeout: AppConst.connectTimeout,
            receiveTimeout: AppConst.receiveTimeout,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            responseType: ResponseType.json,
          ),
        );

  Future<Map<String, dynamic>> get({
    String? path,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      Map<String, dynamic> headers = {};

      if (token?.isNotEmpty ?? false) {
        headers['Authorization'] = 'Bearer $token';
      }

      String urlPath = '${AppConst.baseApiUrl}$path';

      final Response res = await dio.get(
        urlPath,
        queryParameters: query,
      );

      List<String> print = [
        '${res.statusCode} $urlPath',
        'HEADER ${json.encode(res.requestOptions.headers)}',
        'QUERY ${json.encode(query)}',
        'RESPONSE ${json.encode(res.data)}'
      ];
      log(print.join('\n'), name: 'GET');

      if ((res.statusCode ?? 0) >= 200 && (res.statusCode ?? 0) < 300) {
        return res.data as Map<String, dynamic>;
      }

      throw res.data;
    } catch (err) {
      throw ServerException(message: err.toString());
    }
  }
}
