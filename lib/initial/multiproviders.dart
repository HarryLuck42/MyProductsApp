import 'package:my_products/initial/provider.dart';
import 'package:my_products/layout/home/home_provider.dart';
import 'package:my_products/layout/product_detail/product_detail_provider.dart';
import 'package:my_products/layout/products/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../layout/splash/splash_provider.dart';

class Multiproviders{
  static List<SingleChildWidget> inject({required AppProvider rootNotifier}) => [
    ChangeNotifierProvider.value(value: rootNotifier),
    ChangeNotifierProvider(create: (_) => SplashProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => ProductsProvider()),
    ChangeNotifierProvider(create: (_) => ProductDetailProvider()),
  ];
}