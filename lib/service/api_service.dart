
import 'package:dio/dio.dart';
import 'package:my_products/model/response/base_response.dart';
import 'package:my_products/model/response/product_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/request/product_request.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService{
  factory ApiService(Dio dio, {required String baseUrl}) = _ApiService;

  @GET("categories")
  Future<List<Category>> getCategories();

  @GET("products")
  Future<List<Product>> getProducts();

  @POST("products")
  Future<Product> createProduct(@Body() ProductRequest request);

  @PUT("products/{id}")
  Future<BaseResponse?> updateProduct(@Path("id")String id, @Body() ProductRequest request);

  @DELETE("products/{id}")
  Future<BaseResponse?> deleteProduct(@Path("id")String id);

}