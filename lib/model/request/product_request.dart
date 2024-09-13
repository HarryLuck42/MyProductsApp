import 'package:json_annotation/json_annotation.dart';
import 'package:my_products/model/local/local_product.dart';

part 'product_request.g.dart';

@JsonSerializable()
class ProductRequest {
  @JsonKey(name: 'categoryId')
  String? categoryId;

  @JsonKey(name: 'sku')
  String? sku;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'weight')
  int? weight;

  @JsonKey(name: 'width')
  int? width;

  @JsonKey(name: 'height')
  int? height;

  @JsonKey(name: 'length')
  int? length;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'price')
  int? price;

  ProductRequest(
      {this.categoryId,
      this.sku,
      this.name,
      this.description,
      this.weight,
      this.width,
      this.height,
      this.length,
      this.image,
      this.price});

  factory ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRequestToJson(this);

  LocalProduct convert(String id) {
    return LocalProduct(
        id: id,
        categoryId: categoryId,
        sku: sku,
        name: name,
        description: description,
        weight: weight,
        width: width,
        height: height,
        length: length,
        image: image,
        price: price);
  }
}
