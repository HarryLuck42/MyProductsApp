import 'package:hive/hive.dart';

part 'local_category.g.dart';

@HiveType(typeId: 0)
class LocalCategory extends HiveObject{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? categoryName;

  LocalCategory({required this.id, required this.categoryName});

  LocalCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson(){
    final result = <String, dynamic>{};
    result['id'] = id;
    result['categoryName'] = categoryName;
    return result;
  }
}