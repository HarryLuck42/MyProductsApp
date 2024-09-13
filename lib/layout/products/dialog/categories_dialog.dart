import 'package:flutter/material.dart';
import 'package:my_products/core/base/base_state.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/layout/products/products_provider.dart';
import 'package:my_products/model/local/local_category.dart';
import 'package:provider/provider.dart';

import '../../../core/constraint/const.dart';
import '../../../core/constraint/spacer.dart';
import '../../../widgets/custom_search.dart';
import '../../../widgets/custom_text.dart';

class DialogCategories extends StatefulWidget {
  DialogCategories({Key? key}) : super(key: key);

  @override
  State<DialogCategories> createState() => _DialogCategoriesState();
}

class _DialogCategoriesState extends State<DialogCategories> with BaseState {
  final searchCtrl = TextEditingController();

  List<LocalCategory> categories = [];

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      categories = context.read<ProductsProvider>().categories;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightDialog = context.getHeight() * 0.8;
    final widthDialog = context.getWidth() * 0.9;
    return Consumer<ProductsProvider>(builder: (context, ref, _) {
      return AlertDialog(
        backgroundColor: context.getTheme().colorScheme.background,
        content: Builder(builder: (context) {
          return Container(
            height: heightDialog,
            width: widthDialog,
            decoration:
                BoxDecoration(color: context.getTheme().colorScheme.background),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _searchLayout(context, ref),
                eightPx,
                Expanded(
                  child: _listCategoryLayout(context),
                ),
              ],
            ),
          );
        }),
      );
    });
  }

  Widget _listCategoryLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(categories.length, (index) {
          return Material(
            color: context.getTheme().colorScheme.background,
            child: InkWell(
              onTap: () {
                Navigator.pop(context, categories[index]);
              },
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        left: 10, top: 5, bottom: 5, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        mapCategorySmallIcon[categories[index].id ?? ""] ?? const SizedBox.shrink() ,
                        tenPx,
                        CustomText(
                          textToDisplay: categories[index].categoryName ?? '-',
                          textStyle: context
                              .getTextTheme()
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: context.getTheme().colorScheme.onBackground,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _searchLayout(BuildContext context, ProductsProvider ref) {
    return Material(
      color: context.getTheme().colorScheme.background,
      child: CustomSearch(
        controller: searchCtrl,
        contentPadding:
            EdgeInsets.symmetric(vertical: 16 * context.scaleDiagonal()),
        hintText: 'Search',
        onChanged: (value) {
          if (value.isNotEmpty) {
            Future.delayed(const Duration(milliseconds: 500), () {
              if (searchCtrl.text == value) {
                setState(() {
                  final search = searchCtrl.text;
                  categories = ref.categories
                      .where((element) => (element.categoryName ?? '')
                          .toLowerCase()
                          .contains(search.toLowerCase()))
                      .toList();
                });
              }
            });
          }
        },
      ),
    );
  }
}
