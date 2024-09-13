import 'package:flutter/cupertino.dart';
import 'package:my_products/core/constraint/enum.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/model/local/local_category.dart';
import 'package:my_products/model/local/local_product.dart';
import 'package:my_products/model/request/product_request.dart';
import 'package:my_products/model/response/product_response.dart';

import '../../core/base/base_provider.dart';
import '../../model/response/base_response.dart';
import '../../service/api_handling.dart';

class ProductsProvider extends BaseProvider {
  final nameCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final weightCtrl = TextEditingController();
  final lengthCtrl = TextEditingController();
  final widthCtrl = TextEditingController();
  final heightCtrl = TextEditingController();
  final imageCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final categoryCtrl = TextEditingController();
  final searchCtrl = TextEditingController();

  void clearTextEditing() {
    nameCtrl.clear();
    descCtrl.clear();
    weightCtrl.clear();
    lengthCtrl.clear();
    widthCtrl.clear();
    heightCtrl.clear();
    imageCtrl.clear();
    priceCtrl.clear();
    categoryCtrl.clear();
    _selectedCategory = null;
  }

  void bindDataUpdate(LocalProduct product) {
    nameCtrl.text = product.name ?? "";
    descCtrl.text = product.description ?? "";
    weightCtrl.text = "${product.weight ?? 0}";
    lengthCtrl.text = "${product.weight ?? 0}";
    widthCtrl.text = "${product.width ?? 0}";
    heightCtrl.text = "${product.height ?? 0}";
    imageCtrl.text = product.image ?? "";
    priceCtrl.text = "${product.price ?? 0}";
    nameCtrl.text = product.name ?? "";
    descCtrl.text = product.description ?? "";
    final category = memoryAction
        .getCategories()
        .where((e) => e.id == product.categoryId)
        .firstOrNull;
    if (category != null) {
      categoryCtrl.text = category.categoryName ?? '';
      _selectedCategory = category;
    }
  }

  bool checkSkuExist(String sku) {
    return memoryAction.getProducts().where((e) => e.sku == sku).isNotEmpty;
  }

  LocalCategory? _selectedCategory;

  LocalCategory? get selectedCategory => _selectedCategory;

  set selectedCategory(LocalCategory? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  List<LocalCategory> _categories = [];

  List<LocalCategory> get categories => _categories;

  set categories(List<LocalCategory> values) {
    _categories = values;
    notifyListeners();
  }

  List<LocalProduct> _products = [];

  List<LocalProduct> get products => _products;

  set products(List<LocalProduct> values) {
    _products = values;
    notifyListeners();
  }

  LocalCategory? _filter;

  LocalCategory? get filter => _filter;

  set filter(LocalCategory? value) {
    _filter = value;
    notifyListeners();
  }

  void fetchAllData() {
    _filter = null;
    _categories.addAll(memoryAction.getCategories());
    _products.addAll(memoryAction.getProducts());
    notifyListeners();
  }

  void filterProductByCategory() {
    _products = memoryAction
        .getProducts()
        .where((e) => e.categoryId == _filter?.id)
        .toList();
    notifyListeners();
  }

  void searchProduct(String keyword){
    _products = memoryAction
        .getProducts()
        .where((e) => (e.name?.toLowerCase().contains(keyword.toLowerCase()) ?? false) || (e.description?.toLowerCase().contains(keyword.toLowerCase()) ?? false))
        .toList();
    notifyListeners();
  }

  void resetProductList() {
    searchCtrl.clear();
    _filter = null;
    _products.clear();
    _products.addAll(memoryAction.getProducts());
    notifyListeners();
  }

  Future createProduct(
      BuildContext ctx, ProductRequest request, Function() onSuccess, Function() onError) async {
    try {
      setLoading(true);
      await ApiHandling.hitApi<Product>(
          apiRep.apiService.createProduct(request), (response) async {
        await memoryAction.saveProduct(response.convert());
        resetProductList();
        Future.delayed(const Duration(microseconds: 500), (){
          onSuccess();
        });
      }, (failed) {
        ctx.showShackBar(failed.messageError);
        onError();
      }, onAfter: () {
        setLoading(false);
      });
    } catch (e) {
      ctx.showShackBar(e.toString());
      onError();
      setLoading(false);
    }
  }

  Future updateProduct(BuildContext ctx, ProductRequest request, String id,
      Function() onSuccess, Function() onError) async {
    try {
      setLoading(true);
      await ApiHandling.hitApi<BaseResponse?>(
          apiRep.apiService.updateProduct(id, request), (response) async {
        await memoryAction.updateProduct(request.convert(id));
        resetProductList();
        Future.delayed(const Duration(microseconds: 500), (){
          onSuccess();
        });
      }, (failed) {
        ctx.showShackBar(failed.messageError);
        onError();
      }, onAfter: () {
        setLoading(false);
      });
    } catch (e) {
      ctx.showShackBar(e.toString());
      onError();
      setLoading(false);
    }
  }

  Future deleteProduct(BuildContext ctx, LocalProduct product) async {
    try {
      setLoading(true);
      await ApiHandling.hitApi<BaseResponse?>(
          apiRep.apiService.deleteProduct(product.id ?? ""), (response) async {
        await memoryAction.deleteProduct(product);
        Future.delayed(const Duration(microseconds: 500), (){
          resetProductList();
        });

      }, (failed) {
        ctx.showShackBar(failed.messageError);
      }, onAfter: () {
        setLoading(false);
      });
    } catch (e) {
      ctx.showShackBar(e.toString());
      setLoading(false);
    }
  }

  List<ValidateInput> _listValidate = [];

  List<ValidateInput> get listValidate => _listValidate;

  bool checkNotValidate(ValidateInput value) {
    return _listValidate.contains(value);
  }

  void submitProduct(BuildContext context, LocalProduct? product, String sku,
      Function() onSuccess, Function() onError) async {
    try {
      var isValidated = true;
      _listValidate.clear();
      if (nameCtrl.text.isEmpty) {
        isValidated = false;
        _listValidate.add(ValidateInput.nameEmpty);
      } else if (nameCtrl.text.length < 5) {
        isValidated = false;
        _listValidate.add(ValidateInput.nameMin);
      }

      if (descCtrl.text.isEmpty) {
        isValidated = false;
        _listValidate.add(ValidateInput.descEmpty);
      } else if (descCtrl.text.length < 15) {
        isValidated = false;
        _listValidate.add(ValidateInput.descMin);
      }

      if (_selectedCategory == null) {
        isValidated = false;
        _listValidate.add(ValidateInput.categoryEmpty);
      }

      if (priceCtrl.text.isEmpty) {
        isValidated = false;
        _listValidate.add(ValidateInput.priceEmpty);
      } else if (int.parse(priceCtrl.text) < 500) {
        isValidated = false;
        _listValidate.add(ValidateInput.priceMin);
      }

      if (weightCtrl.text.isEmpty) {
        isValidated = false;
        _listValidate.add(ValidateInput.weightEmpty);
      } else if (int.parse(weightCtrl.text) < 1) {
        isValidated = false;
        _listValidate.add(ValidateInput.weightMin);
      }

      if (lengthCtrl.text.isEmpty) {
        isValidated = false;
        _listValidate.add(ValidateInput.lengthEmpty);
      } else if (int.parse(lengthCtrl.text) < 1) {
        isValidated = false;
        _listValidate.add(ValidateInput.lengthMin);
      }

      if (widthCtrl.text.isEmpty) {
        isValidated = false;
        _listValidate.add(ValidateInput.widthEmpty);
      } else if (int.parse(widthCtrl.text) < 1) {
        isValidated = false;
        _listValidate.add(ValidateInput.widthMin);
      }

      if (heightCtrl.text.isEmpty) {
        isValidated = false;
        _listValidate.add(ValidateInput.heightEmpty);
      } else if (int.parse(heightCtrl.text) < 1) {
        isValidated = false;
        _listValidate.add(ValidateInput.heightMin);
      }

      if (imageCtrl.text.isEmpty) {
        isValidated = false;
        _listValidate.add(ValidateInput.imageEmpty);
      } else if (!imageCtrl.text.isUrlLink()) {
        isValidated = false;
        _listValidate.add(ValidateInput.imageNotUrl);
      }

      if (isValidated) {
        final request = ProductRequest(
            categoryId: _selectedCategory?.id,
            sku: sku,
            name: nameCtrl.text,
            description: descCtrl.text,
            weight: int.parse(weightCtrl.text),
            width: int.parse(widthCtrl.text),
            height: int.parse(heightCtrl.text),
            length: int.parse(lengthCtrl.text),
            image: imageCtrl.text,
            price: int.parse(priceCtrl.text));
        if (product == null) {
          createProduct(context, request, onSuccess, onError);
        } else {
          if (product.id != null) {
            updateProduct(context, request, product.id!, onSuccess, onError);
          }
        }
      }
      notifyListeners();
    } catch (e) {
      e.logger();
    }
  }
}
