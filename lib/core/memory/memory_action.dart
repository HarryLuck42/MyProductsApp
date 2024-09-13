import 'package:my_products/core/memory/hive/box_keys.dart';
import 'package:my_products/model/local/local_category.dart';
import 'package:my_products/model/local/local_product.dart';

import 'hive/boxes.dart';

class MemoryAction {
  final IMemoryAction memoryAction;

  MemoryAction(this.memoryAction);

  Future saveProducts(List<LocalProduct> products) async {
    await memoryAction.saveProducts(products);
  }

  Future saveProduct(LocalProduct product) async {
    await memoryAction.saveProduct(product);
  }

  Future deleteProduct(LocalProduct product) async {
    await memoryAction.deleteProduct(product);
  }

  Future updateProduct(LocalProduct product) async {
    await memoryAction.updateProduct(product);
  }

  List<LocalProduct> getProducts() {
    return memoryAction.getProducts();
  }

  Future saveCategories(List<LocalCategory> categories) async {
    await memoryAction.saveCategories(categories);
  }

  List<LocalCategory> getCategories() {
    return memoryAction.getCategories();
  }
}

abstract class IMemoryAction {
  Future saveProducts(List<LocalProduct> products);

  Future saveProduct(LocalProduct product);

  Future deleteProduct(LocalProduct product);

  Future updateProduct(LocalProduct product);

  List<LocalProduct> getProducts();

  Future saveCategories(List<LocalCategory> categories);

  List<LocalCategory> getCategories();
}

class HiveMemoryAction implements IMemoryAction {
  @override
  Future deleteProduct(LocalProduct product) async {
    final box = Boxes.getBox<LocalProduct>(BoxKeys.product);
    final Map<dynamic, LocalProduct> map = box.toMap();
    dynamic targetKey;
    map.forEach((key, value) {
      if (value.id == product.id) {
        targetKey = key;
      }
    });
    await box.delete(targetKey);
  }

  @override
  List<LocalCategory> getCategories() {
    return Boxes.getBox<LocalCategory>(BoxKeys.category).values.toList();
  }

  @override
  List<LocalProduct> getProducts() {
    return Boxes.getBox<LocalProduct>(BoxKeys.product).values.toList();
  }

  @override
  Future saveProducts(List<LocalProduct> products) async {
    final local = getProducts();
    final box = Boxes.getBox<LocalProduct>(BoxKeys.product);
    if (local.isEmpty) {
      await box.addAll(products);
    } else {
      await box.clear();
      Future.delayed(const Duration(milliseconds: 500), (){
        box.addAll(products);
      });

    }
  }

  @override
  Future saveProduct(LocalProduct product) async {
    await Boxes.getBox<LocalProduct>(BoxKeys.product).add(product);
  }

  @override
  Future updateProduct(LocalProduct product) async {
    final box = Boxes.getBox<LocalProduct>(BoxKeys.product);
    final Map<dynamic, LocalProduct> map = box.toMap();
    dynamic targetKey;
    map.forEach((key, value) {
      if (value.id == product.id) {
        targetKey = key;
      }
    });
    await box.put(targetKey, product);
  }

  @override
  Future saveCategories(List<LocalCategory> categories) async {
    final local = getCategories();
    final box = Boxes.getBox<LocalCategory>(BoxKeys.category);
    if (local.isEmpty) {
      await box.addAll(categories);
    } else {
      await box.clear();
      Future.delayed(const Duration(milliseconds: 500), (){
        box.addAll(categories);
      });
    }
  }
}
