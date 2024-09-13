import 'package:my_products/core/base/base_provider.dart';

class ProductDetailProvider extends BaseProvider{

  String? getCategoryName(String id){
    final categories = memoryAction.getCategories();
    return categories.where((e) => e.id == id).firstOrNull?.categoryName;
  }
}