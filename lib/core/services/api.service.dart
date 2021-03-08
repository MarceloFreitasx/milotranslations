import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:milotranslations/core/models/apiresponse.model.dart';
import 'package:milotranslations/core/routes/routes.dart';

class ApiService implements IApi {
  ApiService({this.apiRoute}) {
    dio.options.baseUrl = apiRoute ?? ApiRoutes.baseUrl;
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) => status < 5000;
    dio.options.sendTimeout = 60 * 1000;
    dio.options.receiveTimeout = 60 * 1000;
  }

  final String apiRoute;
  final Dio dio = Dio();

  Future<ApiResponseModel> call(EApiType type, String url,
      {Map<String, dynamic> data, Map<String, dynamic> headers}) async {
    dio.options.headers.clear();
    if (headers != null) dio.options.headers = headers;

    dio.options.headers.addAll({
      "Accept": "application/json",
    });

    var response;
    switch (type) {
      case EApiType.get:
        response = await dio.get(url, queryParameters: data);
        break;
      case EApiType.post:
        response = await dio.post(url, data: jsonEncode(data));
        break;
      case EApiType.put:
        response = await dio.put(url, data: jsonEncode(data));
        break;
      case EApiType.patch:
        response = await dio.patch(url, data: jsonEncode(data));
        break;
      case EApiType.delete:
        response = await dio.delete(url, data: jsonEncode(data));
        break;
    }

    print("======start======");
    print("url: ${dio.options.baseUrl}$url");
    print("paramsData: $data");
    print("headers: ${dio.options.headers}");
    print("statusCode: ${response.statusCode}");
    print("responseData: ${response.data}");
    print("=======end=======");

    return new ApiResponseModel(response.data, response.statusCode);
  }
}

abstract class IApi {
  Future<ApiResponseModel> call(
    EApiType type,
    String url, {
    Map<String, dynamic> data,
    Map<String, dynamic> headers,
  });
}

enum EApiType {
  get,
  post,
  put,
  patch,
  delete,
}
