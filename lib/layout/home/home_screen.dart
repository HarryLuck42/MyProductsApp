import 'package:flutter/material.dart';
import 'package:my_products/core/constraint/spacer.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/layout/home/home_provider.dart';
import 'package:my_products/widgets/custom_gesture.dart';
import 'package:my_products/widgets/custom_loading.dart';
import 'package:my_products/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../core/constraint/asset_path.dart';
import '../../core/themes/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, ref, _) {
      return Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            Positioned.fill(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Sky,
            )),
            Positioned(
              left: -150,
              right: -150,
              bottom: 0,
              child: Image.asset(
                '${AssetPath.image}green_hill.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 20,
              bottom: context.getHeight() * 0.295,
              child: Image.asset('${AssetPath.image}barn.png',
                  fit: BoxFit.contain, width: context.getWidth() * 0.3),
            ),
            Positioned(
              left: 0,
              bottom: 10,
              child: Image.asset('${AssetPath.image}tree.png',
                  fit: BoxFit.contain, width: context.getWidth() * 0.47),
            ),
            Positioned(
              left: -50,
              bottom: 0,
              child: Image.asset('${AssetPath.image}tree.png',
                  fit: BoxFit.contain, width: context.getWidth() * 0.5),
            ),
            Positioned(
              left: 40,
              bottom: 0,
              child: Image.asset('${AssetPath.image}tree.png',
                  fit: BoxFit.contain, width: context.getWidth() * 0.5),
            ),
            Positioned(
              right: -70,
              bottom: -5,
              child: Image.asset(
                '${AssetPath.image}dairy_products.png',
                fit: BoxFit.contain,
                width: context.getWidth() * 0.8,
              ),
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
              bottom: context.getHeight() * 0.6,
              child: Image.asset(
                '${AssetPath.image}clouds.png',
                fit: BoxFit.contain,
                width: context.getWidth() * 0.5,
              ),
            ),
            Positioned(
              right: 10,
              bottom: context.getHeight() * 0.6,
              child: Image.asset(
                '${AssetPath.image}cloud.png',
                fit: BoxFit.contain,
                width: context.getWidth() * 0.5,
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: context.getHeight() * 0.45,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      textToDisplay: "You can see what you need",
                      textAlign: TextAlign.start,
                      textStyle: context
                          .getTheme()
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    fourPx,
                    CustomText(
                      textToDisplay:
                          "Remain faithful in choosing quality goods for your family",
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      textStyle: context
                          .getTheme()
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    tenPx,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomGesture(
                        onTap: () {
                          ref.getAllCategories(context);
                        },
                        radius: 10,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: context
                                  .getColorScheme()
                                  .primary
                                  .withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: ref.isLoading
                                ? const CustomLoading()
                                : Text(
                                    "Get Started",
                                    style: context
                                        .getTheme()
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      );
    });
  }
}
