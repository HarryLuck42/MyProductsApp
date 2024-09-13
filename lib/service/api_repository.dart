
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:my_products/service/api_service.dart';

import '../core/constraint/sp_keys.dart';
import '../core/memory/shared/share_preference.dart';

class ApiRepository{
  late final Dio _dio;
  late final ApiService _apiService;

  ApiRepository(){
    _dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      contentType: "application/json"
    ))..interceptors.add(HttpFormatter());

    _apiService = ApiService(_dio, baseUrl: "https://crudcrud.com/api/c6ae13973c7e4363af8fe6b4d61d5b7c/");
  }

  ApiService get apiService => _apiService;

}