import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/layout/dialog/yes_no_dialog.dart';
import 'package:my_products/layout/products/adapter/product_item.dart';
import 'package:my_products/layout/products/dialog/add_edit_product_dialog.dart';
import 'package:my_products/layout/products/dialog/categories_dialog.dart';
import 'package:my_products/layout/products/products_provider.dart';
import 'package:my_products/widgets/custom_app_bar.dart';
import 'package:my_products/widgets/custom_icon.dart';
import 'package:my_products/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../core/base/base_state.dart';
import '../../core/constraint/asset_path.dart';
import '../../core/routing/routes.dart';
import '../../core/themes/app_colors.dart';
import '../../model/local/local_product.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_search.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with BaseState, OnActionProductItem, OnClickDialog {
  ProductsProvider? provider;

  @override
  void afterFirstLayout(BuildContext context) {
    provider = context.read<ProductsProvider>();
    provider?.fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(builder: (context, ref, _) {
      return Scaffold(
        appBar: CustomAppBar(context, isBack: false, "Product List", actions: [
          CustomIconButton(
            defaultColor: false,
            color: context.getColorScheme().primary,
            onPressed: () async {
              if (ref.filter == null) {
                ref.resetProductList();
                ref.filter = await showDialog(
                    context: context,
                    builder: (context) {
                      return DialogCategories();
                    });
                if (ref.filter?.id != null) {
                  ref.filterProductByCategory();
                }
              } else {
                ref.resetProductList();
              }
            },
            iconData: ref.filter != null
                ? "${AssetPath.vector}close.svg"
                : "${AssetPath.vector}filter.svg",
          ),
          CustomIconButton(
            defaultColor: false,
            color: context.getColorScheme().primary,
            onPressed: () async {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return const AddEditProductDialog();
                  });
            },
            iconData: "${AssetPath.vector}add.svg",
          ),
        ]),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomSearch(
                  controller: ref.searchCtrl,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12 * context.scaleDiagonal()),
                  hintText: 'Search',
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        if (ref.searchCtrl.text == value) {
                          setState(() {
                            final search = ref.searchCtrl.text;
                            ref.searchProduct(search);
                          });
                        }
                      });
                    }
                  },
                  onPressedRightIcon: () {
                    ref.resetProductList();
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: LightInactive1,
              ),
              ref.products.isEmpty
                  ? Expanded(
                      child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomIcon(
                            iconData: "${AssetPath.vector}empty.svg",
                            width: 200,
                            height: 200,
                            defaultColor: false,
                          ),
                          CustomText(
                            textToDisplay: "There's no data",
                            textStyle:
                                context.getTextTheme().titleMedium?.copyWith(
                                      color: context.getColorScheme().secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ))
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          children: ref.products
                              .map((data) => ProductItem(
                                    product: data,
                                    listener: this,
                                  ))
                              .toList(),
                        ),
                      ),
                    )
            ],
          ),
        ),
      );
    });
  }

  @override
  void onDelete(LocalProduct product) {
    showDialog(
        context: context,
        builder: (context) {
          return YesNoDialog(
            message: "Are you sure to delete this product?",
            no: "No",
            yes: "Yes",
            listener: this,
            data: product,
          );
        });
  }

  @override
  void onDetail(LocalProduct product) {
    provider?.routing.move(Routes.productDetail, argument: product);
  }

  @override
  void onUpdate(LocalProduct product) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return AddEditProductDialog(
            product: product,
          );
        });
  }

  @override
  void onNo() {
    provider?.resetProductList();
  }

  @override
  Future onYes(BuildContext context, dynamic data) async {
    if (data is LocalProduct) {
      provider?.deleteProduct(context, data);
    }
  }
}
