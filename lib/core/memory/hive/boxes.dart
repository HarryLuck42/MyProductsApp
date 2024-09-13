import 'package:hive/hive.dart';
import 'package:my_products/model/local/local_category.dart';
import 'package:my_products/model/local/local_product.dart';

import 'box_keys.dart';

class Boxes{

  static Box<T> getBox<T>(String key) => Hive.box(key);

  static Future<void> initialBoxes()async{
    await Hive.openBox<LocalCategory>(BoxKeys.category);
    await Hive.openBox<LocalProduct>(BoxKeys.product);
  }

}