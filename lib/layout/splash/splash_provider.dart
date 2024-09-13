import 'package:my_products/core/base/base_provider.dart';
import 'package:my_products/core/constraint/sp_keys.dart';
import 'package:my_products/core/routing/routes.dart';

class SplashProvider extends BaseProvider{

  void validationPage(){
    final String? token = sharedPre.readStorage(SpKeys.apiToken);
    print('validation: $token');
    Future.delayed(const Duration(seconds: 3), (){
      routing.moveReplacement(Routes.home);

    });
  }
}