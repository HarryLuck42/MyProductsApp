import 'package:json_annotation/json_annotation.dart';
import 'package:my_products/model/local/local_category.dart';
import 'package:my_products/model/local/local_product.dart';

part 'product_response.g.dart';

@JsonSerializable()
class Product{
  @JsonKey(name: '_id')
  String? id;

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

  Product({
    this.id,
    this.categoryId,
    this.sku,
    this.name,
    this.description,
    this.weight,
    this.width,
    this.height,
    this.length,
    this.image,
    this.price
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  LocalProduct convert(){
    return LocalProduct(id: id, categoryId: categoryId, sku: sku, name: name, description: description, weight: weight, width: width, height: height, length: length, image: image, price: price);
  }
}

@JsonSerializable()
class Category{
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'categoryName')
  String? categoryName;

  Category({
    this.id,
    this.categoryName
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  LocalCategory convert(){
    return LocalCategory(id: id, categoryName: categoryName);
  }
}


