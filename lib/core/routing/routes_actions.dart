import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_products/core/routing/routes.dart';
import 'package:my_products/layout/home/home_screen.dart';
import 'package:my_products/layout/product_detail/product_detail_screen.dart';
import 'package:my_products/layout/products/products_screen.dart';
import 'package:my_products/layout/splash/splash_screen.dart';
import 'package:my_products/model/local/local_product.dart';

class RoutesActions{
  static List<Route<dynamic>> initialAction(_){
    return [MaterialPageRoute(builder: (_) => SplashScreen())];
  }

  static Route<dynamic> allActions(RouteSettings settings){
    switch(settings.name){
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.products:
        return MaterialPageRoute(builder: (_) => ProductsScreen());
      case Routes.productDetail:
        return MaterialPageRoute(builder: (_) => ProductDetailScreen(product: settings.arguments as LocalProduct));
    }
    return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}

