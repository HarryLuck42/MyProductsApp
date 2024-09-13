import 'package:flutter/material.dart';
import 'package:my_products/core/base/base_state.dart';
import 'package:my_products/core/constraint/asset_path.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/layout/splash/splash_provider.dart';
import 'package:my_products/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../core/themes/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Sky,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              '${AssetPath.image}green_hill.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: -150,
            bottom: 0,
            child: Image.asset('${AssetPath.image}barn.png',
                fit: BoxFit.contain, width: context.getWidth()),
          ),
          Positioned(
            left: 100,
            top: context.getHeight() * 0.06,
            child: Image.asset(
              '${AssetPath.image}sun.png',
              fit: BoxFit.contain,
              width: context.getWidth() * 0.45,
            ),
          ),
          Positioned(
            left: 10,
            bottom: context.getHeight() * 0.65,
            child: Image.asset(
              '${AssetPath.image}clouds.png',
              fit: BoxFit.contain,
              width: context.getWidth() * 0.5,
            ),
          ),
          Positioned(
            right: 10,
            bottom: context.getHeight() * 0.65,
            child: Image.asset(
              '${AssetPath.image}cloud.png',
              fit: BoxFit.contain,
              width: context.getWidth() * 0.5,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: Image.asset(
                      '${AssetPath.image}splash_image.png',
                      width: 200,
                      height: 200,
                    )),
                CustomText(
                  textToDisplay: 'My Store Products',
                  textStyle: context.getTextTheme().titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.getColorScheme().primary),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    context.read<SplashProvider>().validationPage();
  }
}
