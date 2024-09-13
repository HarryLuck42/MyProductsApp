import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_products/core/constraint/spacer.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/layout/product_detail/product_detail_provider.dart';
import 'package:my_products/model/local/local_product.dart';
import 'package:my_products/widgets/custom_app_bar.dart';
import 'package:my_products/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../core/constraint/asset_path.dart';
import '../../core/constraint/const.dart';
import '../../core/themes/app_colors.dart';
import '../../widgets/custom_cache_image.dart';

class ProductDetailScreen extends StatefulWidget {
  final LocalProduct product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "Product Detail"),
      body: Consumer<ProductDetailProvider>(
        builder: (context, ref, _) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _imageProduct(context),
                  _headerProductDetail(context),
                  _borderDetail(),
                  _bodyProductDetail(context, ref),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container _bodyProductDetail(BuildContext context, ProductDetailProvider ref) {
    return Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 10, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: context.getColorScheme().primary,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                mapCategoryIcon[
                                        widget.product.categoryId ?? ""] ??
                                    const SizedBox.shrink(),
                                fourPx,
                                CustomText(
                                  maxLines: 3,
                                  textToDisplay: ref.getCategoryName(
                                          widget.product.categoryId ?? "") ??
                                      "Undefined",
                                  textStyle: context
                                      .getTextTheme()
                                      .labelMedium
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          sixteenPx,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                fourPx,
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Weight: ",
                                        style: context
                                            .getTextTheme()
                                            .bodyMedium
                                            ?.copyWith(
                                                color: context
                                                    .getColorScheme()
                                                    .primary,
                                                fontWeight: FontWeight.w700)),
                                    TextSpan(
                                        text: "${widget.product.weight} gram",
                                        style: context
                                            .getTextTheme()
                                            .bodyMedium
                                            ?.copyWith(
                                                color: context
                                                    .getColorScheme()
                                                    .secondary,
                                                fontWeight: FontWeight.w500)),
                                  ]),
                                ),
                                eightPx,
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Width: ",
                                      style: context
                                          .getTextTheme()
                                          .bodyMedium
                                          ?.copyWith(
                                              color: context
                                                  .getColorScheme()
                                                  .primary,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text: "${widget.product.width} cm",
                                      style: context
                                          .getTextTheme()
                                          .bodyMedium
                                          ?.copyWith(
                                              color: context
                                                  .getColorScheme()
                                                  .secondary,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                                ),
                                eightPx,
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Height: ",
                                      style: context
                                          .getTextTheme()
                                          .bodyMedium
                                          ?.copyWith(
                                              color: context
                                                  .getColorScheme()
                                                  .primary,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text: "${widget.product.height} cm",
                                      style: context
                                          .getTextTheme()
                                          .bodyMedium
                                          ?.copyWith(
                                              color: context
                                                  .getColorScheme()
                                                  .secondary,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                                ),
                                eightPx,
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Length: ",
                                      style: context
                                          .getTextTheme()
                                          .bodyMedium
                                          ?.copyWith(
                                              color: context
                                                  .getColorScheme()
                                                  .primary,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                      text: "${widget.product.length} cm",
                                      style: context
                                          .getTextTheme()
                                          .bodyMedium
                                          ?.copyWith(
                                              color: context
                                                  .getColorScheme()
                                                  .secondary,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      tenPx,
                    ],
                  ),
                );
  }

  Container _borderDetail() {
    return Container(
      width: double.infinity,
      height: 10,
      color: LightInactive1,
    );
  }

  Widget _headerProductDetail(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            textToDisplay: "Rp${widget.product.price.toString().getCurrency()}",
            textStyle: context.getTextTheme().titleLarge?.copyWith(
                color: context.getColorScheme().primary,
                fontWeight: FontWeight.w800),
          ),
          CustomText(
            textToDisplay: widget.product.name ?? "No Product Name",
            textStyle: context.getTextTheme().bodyMedium?.copyWith(
                color: context.getColorScheme().secondary,
                fontWeight: FontWeight.w500),
          ),
          eightPx,
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "Description: ",
                style: context.getTextTheme().bodyMedium?.copyWith(
                    color: context.getColorScheme().primary,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: widget.product.description ?? "No Description",
                style: context.getTextTheme().bodyMedium?.copyWith(
                    color: context.getColorScheme().secondary,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ),
        ],
      ),
    );
  }

  Widget _imageProduct(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CustomCacheImage(
            width: double.infinity,
            height: context.getWidth() * 0.8,
            imageUrl: widget.product.image,
            errorWidget: (context, url, error, connection) {
              if (connection && url.isNotEmpty) {
                return Stack(fit: StackFit.expand, children: [
                  Image.network(
                    url,
                    width: double.infinity,
                    height: context.getWidth() * 0.8,
                    fit: BoxFit.fitWidth,
                  ),
                  ClipRRect(
                    // Clip it cleanly.
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                        alignment: Alignment.center,
                      ),
                    ),
                  )
                ]);
              }
              return Stack(fit: StackFit.expand, children: [
                Image.asset(
                  "${AssetPath.image}broken_image.png",
                  width: double.infinity,
                  height: context.getWidth() * 0.8,
                  fit: BoxFit.fitWidth,
                ),
                ClipRRect(
                  // Clip it cleanly.
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.grey.withOpacity(0.1),
                      alignment: Alignment.center,
                    ),
                  ),
                )
              ]);
            },
            imageBuilder: (context, image) {
              return Container(
                width: double.infinity,
                height: context.getWidth() * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(image: image, fit: BoxFit.fitWidth),
                ),
                child: ClipRRect(
                  // make sure we apply clip it properly
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                ),
              );
            },
            emptyWidget: Stack(fit: StackFit.expand, children: [
              Image.asset(
                "${AssetPath.image}broken_image.png",
                width: double.infinity,
                height: context.getWidth() * 0.8,
                fit: BoxFit.fitWidth,
              ),
              ClipRRect(
                // Clip it cleanly.
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                    alignment: Alignment.center,
                  ),
                ),
              )
            ]),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CustomCacheImage(
            width: double.infinity,
            height: context.getWidth() * 0.8,
            imageUrl: widget.product.image,
            errorWidget: (context, url, error, connection) {
              if (connection && url.isNotEmpty) {
                return Image.network(
                  url,
                  width: double.infinity,
                  height: context.getWidth() * 0.8,
                  fit: BoxFit.fitHeight,
                );
              }
              return Image.asset(
                "${AssetPath.image}broken_image.png",
                width: double.infinity,
                height: context.getWidth() * 0.8,
                fit: BoxFit.fitHeight,
              );
            },
            imageBuilder: (context, image) {
              return Container(
                width: double.infinity,
                height: context.getWidth() * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(image: image, fit: BoxFit.fitHeight),
                ),
              );
            },
            emptyWidget: Image.asset(
              "${AssetPath.image}broken_image.png",
              width: double.infinity,
              height: context.getWidth() * 0.8,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    );
  }
}
