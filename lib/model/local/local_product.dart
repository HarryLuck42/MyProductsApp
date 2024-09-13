import 'package:hive/hive.dart';

part 'local_product.g.dart';

@HiveType(typeId: 1)
class LocalProduct extends HiveObject{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? categoryId;

  @HiveField(2)
  String? sku;

  @HiveField(3)
  String? name;

  @HiveField(4)
  String? description;

  @HiveField(5)
  int? weight;

  @HiveField(6)
  int? width;

  @HiveField(7)
  int? height;

  @HiveField(8)
  int? length;

  @HiveField(9)
  String? image;

  @HiveField(10)
  int? price;

  LocalProduct({
    required this.id,
    required this.categoryId,
    required this.sku,
    required this.name,
    required this.description,
    required this.weight,
    required this.width,
    required this.height,
    required this.length,
    required this.image,
    required this.price
  });

  LocalProduct.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categoryId = json['categoryId'];
    sku = json['sku'];
    name = json['name'];
    description = json['description'];
    weight = json['weight'];
    width = json['width'];
    height = json['height'];
    length = json['length'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson(){
    final result = <String, dynamic>{};
    result['id'] = id;
    result['categoryId'] = categoryId;
    result['sku'] = sku;
    result['name'] = name;
    result['description'] = description;
    result['weight'] = weight;
    result['width'] = width;
    result['height'] = height;
    result['length'] = length;
    result['image'] = image;
    result['price'] = price;
    return result;
  }
}