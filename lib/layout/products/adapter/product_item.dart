import 'package:flutter/material.dart';
import 'package:my_products/core/constraint/asset_path.dart';
import 'package:my_products/core/constraint/spacer.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/core/themes/app_colors.dart';
import 'package:my_products/model/local/local_product.dart';
import 'package:my_products/widgets/custom_cache_image.dart';
import 'package:my_products/widgets/custom_gesture.dart';
import 'package:my_products/widgets/custom_text.dart';

class ProductItem extends StatelessWidget {
  final LocalProduct product;
  final OnActionProductItem listener;

  const ProductItem({super.key, required this.product, required this.listener});

  @override
  Widget build(BuildContext context) {
    final width = context.getWidth();
    final height = context.getHeight();
    final widthItem = (width / 2) - 8;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: CustomGesture(
        onTap: () {
          listener.onDetail(product);
        },
        radius: 10,
        child: Container(
          width: widthItem,
          height: height * 0.35,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 2)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomCacheImage(
                width: widthItem,
                height: widthItem,
                imageUrl: product.image,
                errorWidget: (context, url, error, connection) {
                  if (connection && url.isNotEmpty) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        url,
                        width: widthItem,
                        height: widthItem,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "${AssetPath.image}broken_image.png",
                      width: widthItem,
                      height: widthItem,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                imageBuilder: (context, image) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: widthItem,
                      height: widthItem,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: image, fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
                emptyWidget: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "${AssetPath.image}broken_image.png",
                    width: widthItem,
                    height: widthItem,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              fourPx,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: CustomText(
                  textToDisplay: product.name ?? "",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  textOverflow: TextOverflow.ellipsis,
                  textStyle: context.getTextTheme().labelLarge?.copyWith(
                      color: context.getColorScheme().secondary,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    textToDisplay:
                        "Rp ${product.price.toString().getCurrency()}",
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: context.getTextTheme().labelMedium?.copyWith(
                        color: context.getColorScheme().primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomGesture(
                        onTap: () {
                          listener.onUpdate(product);
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
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                "Update",
                                style: context
                                    .getTheme()
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                    fourPx,
                    Expanded(
                      child: CustomGesture(
                        onTap: () {
                          listener.onDelete(product);
                        },
                        radius: 10,
                        splashColor: Red,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Red.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              "Delete",
                              style: context
                                  .getTheme()
                                  .textTheme
                                  .labelMedium
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
            ],
          ),
        ),
      ),
    );
  }
}

abstract class OnActionProductItem{
  void onDetail(LocalProduct product);
  void onUpdate(LocalProduct product);
  void onDelete(LocalProduct product);
}
