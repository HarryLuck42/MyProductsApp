import 'package:flutter/material.dart';
import 'package:my_products/core/base/base_provider.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/model/local/local_category.dart';
import 'package:my_products/model/local/local_product.dart';
import 'package:my_products/model/response/product_response.dart';

import '../../core/routing/routes.dart';
import '../../service/api_handling.dart';

class HomeProvider extends BaseProvider{


  List<Category> categories = [];
  List<Product> products = [];

  Future getAllCategories(BuildContext ctx) async {
    try {
      setLoading(true);
      await ApiHandling.hitApi<List<Category>>(
          apiRep.apiService.getCategories(), (response) {
            categories.addAll(response);
            List<LocalCategory> local = [];
            final data = memoryAction.getCategories();
            for(final category in categories){
              local.add(category.convert());
            }
            if(data.isEmpty || (data.length < response.length)){
              memoryAction.saveCategories(local).whenComplete((){
                getAllProducts(ctx);
              });
            }else{
              getAllProducts(ctx);
            }


      }, (failed) {
        ctx.showShackBar(failed.messageError);
      });
    } catch (e) {
      ctx.showShackBar(e.toString());
      setLoading(false);
    }
  }

  Future getAllProducts(BuildContext ctx) async {
    try {
      await ApiHandling.hitApi<List<Product>>(
          apiRep.apiService.getProducts(), (response) {
        products.addAll(response);
        List<LocalProduct> local = [];
        final data = memoryAction.getCategories();
        for(final product in products){
          local.add(product.convert());
        }

        if(data.isEmpty || (data.length < response.length)){
          memoryAction.saveProducts(local).whenComplete((){
            Future.delayed(const Duration(milliseconds: 1000), (){
              routing.moveReplacement(Routes.products);
              setLoading(false);
            });

          });
        }else{
          routing.moveReplacement(Routes.products);
          setLoading(false);
        }

      }, (failed) {
        ctx.showShackBar(failed.messageError);
        setLoading(false);
      });
    } catch (e) {
      ctx.showShackBar(e.toString());
      setLoading(false);
    }
  }
}