import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_products/model/request/product_request.dart';
import 'package:my_products/model/response/product_response.dart';
import 'package:my_products/service/api_repository.dart';
import 'package:my_products/service/api_service.dart';

import 'api_test.mocks.dart';

@GenerateNiceMocks( [MockSpec<ApiRepository>(onMissingStub: OnMissingStub.returnDefault), MockSpec<ApiService>(onMissingStub: OnMissingStub.returnDefault), MockSpec<ProductRequest>(onMissingStub: OnMissingStub.returnDefault)])
void main() {
  group("Api Service", () {
    late MockApiRepository service;
    setUp(() {
      service = MockApiRepository();
    });
    test("Check is not empty categories data", () async {
      when(service.apiService).thenAnswer((_) => MockApiService());
      final data = await service.apiService.getCategories();
      expect(data, isEmpty);
    });

    test("Check is not empty products data", () async {
      when(service.apiService).thenAnswer((_) => MockApiService());
      final data = await service.apiService.getProducts();
      expect(data, isEmpty);
    });

    test("Check delete product data", () async {
      when(service.apiService).thenAnswer((_) => MockApiService());
      final data = await service.apiService.deleteProduct("66e4005cfe837603e816be7e");
      expect(data, isNull);
    });

    test("Check update product data", () async {

      final request = ProductRequest(
          categoryId: "66e0516d028a7803e87a71ad",
          sku: "HSTBHX",
          name: "Apel Fuji Super",
          description: "Apel segar dan fresh mengandung banyak vitamin",
          weight: 1000,
          height: 20,
          length: 20,
          width: 20,
          image:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/90/MTA-162160270/no-brand_apel-fuji-premium_full01-0152cd40.jpg",
          price: 50000);
      when(service.apiService).thenAnswer((_) => MockApiService());
      final data = await service.apiService.updateProduct("66e4005cfe837603e816be7e", request);
      expect(data, isNull);
    });

  });


}
