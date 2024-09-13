import 'package:flutter/material.dart';
import 'package:my_products/core/base/base_state.dart';
import 'package:my_products/core/constraint/enum.dart';
import 'package:my_products/core/constraint/spacer.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/layout/products/products_provider.dart';
import 'package:my_products/model/local/local_category.dart';
import 'package:my_products/model/local/local_product.dart';
import 'package:my_products/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_gesture.dart';
import '../../../widgets/custom_loading.dart';
import '../../../widgets/custom_text_field.dart';
import 'categories_dialog.dart';

class AddEditProductDialog extends StatefulWidget {
  final LocalProduct? product;

  const AddEditProductDialog({super.key, this.product});

  @override
  State<AddEditProductDialog> createState() => _AddEditProductDialogState();
}

class _AddEditProductDialogState extends State<AddEditProductDialog>
    with BaseState {
  @override
  void afterFirstLayout(BuildContext context) {
    context.read<ProductsProvider>().clearTextEditing();
    if (widget.product != null) {
      context.read<ProductsProvider>().bindDataUpdate(widget.product!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(builder: (context, ref, _) {
      return Container(
        height: context.getHeight() * 0.9,
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sixteenPx,
                    CustomText(
                      textToDisplay: "Create a product",
                      textStyle: context
                          .getTextTheme()
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    twentyPx,
                    _inputProductName(context, ref),
                    fourPx,
                    _inputProductDesc(context, ref),
                    fourPx,
                    _inputCategoryAndLength(context, ref),
                    fourPx,
                    _inputWeightAndLength(context, ref),
                    fourPx,
                    _inputWidthAndHeight(context, ref),
                    fourPx,
                    _inputImage(context, ref),
                  ],
                ),
              ),
            ),
            _submitButton(ref, context)
          ],
        ),
      );
    });
  }

  Container _submitButton(ProductsProvider ref, BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(10),
            child: CustomGesture(
              onTap: () {
                var skuTemp = helper.generateSKU();
                while (ref.checkSkuExist(skuTemp)) {
                  skuTemp = helper.generateSKU();
                }
                ref.submitProduct(context, widget.product, skuTemp, () {
                  Navigator.pop(context);
                }, () {
                  Navigator.pop(context);
                });
              },
              radius: 10,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: context.getColorScheme().primary.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: ref.isLoading
                      ? const CustomLoading()
                      : Text(
                          widget.product == null ? "Create" : "Update",
                          style: context
                              .getTheme()
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                        ),
                ),
              ),
            ),
          );
  }

  Column _inputImage(BuildContext context, ProductsProvider ref) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: CustomText(
                          textToDisplay: 'Image:',
                          textAlign: TextAlign.start,
                          textStyle: context
                              .getTheme()
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                              color: context.getTheme().colorScheme.primary,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      CustomTextField(
                        controller: ref.imageCtrl,
                        hintText: 'Image', //name
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8 * context.scaleDiagonal(),
                            horizontal: 12),
                        errorText: ref.checkNotValidate(ValidateInput.imageEmpty)
                            ? "Product image is empty"
                            : ref.checkNotValidate(ValidateInput.imageNotUrl)
                            ? "image is not url link"
                            : null,
                      )
                    ],
                  );
  }

  Row _inputWidthAndHeight(BuildContext context, ProductsProvider ref) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: CustomText(
                  textToDisplay: 'Width(cm):',
                  textAlign: TextAlign.start,
                  textStyle: context.getTheme().textTheme.labelMedium?.copyWith(
                      color: context.getTheme().colorScheme.primary,
                      fontWeight: FontWeight.w700),
                ),
              ),
              CustomTextField(
                controller: ref.widthCtrl,
                hintText: 'Width',
                //name
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8 * context.scaleDiagonal(), horizontal: 12),
                textInputType: TextInputType.number,
                errorText: ref.checkNotValidate(ValidateInput.widthEmpty)
                    ? "Product width is empty"
                    : ref.checkNotValidate(ValidateInput.widthMin)
                        ? "Minimum 1 cm"
                        : null,
              ),
            ],
          ),
        ),
        fourPx,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: CustomText(
                  textToDisplay: 'Height(cm):',
                  textAlign: TextAlign.start,
                  textStyle: context.getTheme().textTheme.labelMedium?.copyWith(
                      color: context.getTheme().colorScheme.primary,
                      fontWeight: FontWeight.w700),
                ),
              ),
              CustomTextField(
                controller: ref.heightCtrl,
                hintText: 'Height(cm)',
                //name
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8 * context.scaleDiagonal(), horizontal: 12),
                textInputType: TextInputType.number,
                errorText: ref.checkNotValidate(ValidateInput.heightEmpty)
                    ? "Product height is empty"
                    : ref.checkNotValidate(ValidateInput.heightMin)
                        ? "Minimum 1 cm"
                        : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _inputWeightAndLength(BuildContext context, ProductsProvider ref) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: CustomText(
                  textToDisplay: 'Weight(gram):',
                  textAlign: TextAlign.start,
                  textStyle: context.getTheme().textTheme.labelMedium?.copyWith(
                      color: context.getTheme().colorScheme.primary,
                      fontWeight: FontWeight.w700),
                ),
              ),
              CustomTextField(
                controller: ref.weightCtrl,
                hintText: 'Weight',
                //name
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8 * context.scaleDiagonal(), horizontal: 12),
                textInputType: TextInputType.number,
                errorText: ref.checkNotValidate(ValidateInput.weightEmpty)
                    ? "Product weight is empty"
                    : ref.checkNotValidate(ValidateInput.weightMin)
                        ? "Minimum 1 gram"
                        : null,
              ),
            ],
          ),
        ),
        fourPx,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: CustomText(
                  textToDisplay: 'Length(cm):',
                  textAlign: TextAlign.start,
                  textStyle: context.getTheme().textTheme.labelMedium?.copyWith(
                      color: context.getTheme().colorScheme.primary,
                      fontWeight: FontWeight.w700),
                ),
              ),
              CustomTextField(
                controller: ref.lengthCtrl,
                hintText: 'Length',
                //name
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8 * context.scaleDiagonal(), horizontal: 12),
                textInputType: TextInputType.number,
                errorText: ref.checkNotValidate(ValidateInput.lengthEmpty)
                    ? "Product length is empty"
                    : ref.checkNotValidate(ValidateInput.lengthMin)
                        ? "Minimum 1 cm"
                        : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _inputCategoryAndLength(BuildContext context, ProductsProvider ref) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: CustomText(
                  textToDisplay: 'Category:',
                  textAlign: TextAlign.start,
                  textStyle: context.getTheme().textTheme.labelMedium?.copyWith(
                      color: context.getTheme().colorScheme.primary,
                      fontWeight: FontWeight.w700),
                ),
              ),
              CustomTextField(
                controller: ref.categoryCtrl,
                hintText: 'Category',
                //name
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8 * context.scaleDiagonal(), horizontal: 12),
                readOnly: true,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: context.getColorScheme().primary,
                ),
                onTap: () async {
                  LocalCategory? data = await showDialog(
                      context: context,
                      builder: (context) {
                        return DialogCategories();
                      });
                  ref.selectedCategory = data;
                  if (data != null) {
                    ref.categoryCtrl.text = data.categoryName ?? "";
                  }
                },
                errorText: ref.checkNotValidate(ValidateInput.categoryEmpty)
                    ? "Product category is empty"
                    : null,
              ),
            ],
          ),
        ),
        fourPx,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: CustomText(
                  textToDisplay: 'Price(Rp):',
                  textAlign: TextAlign.start,
                  textStyle: context.getTheme().textTheme.labelMedium?.copyWith(
                      color: context.getTheme().colorScheme.primary,
                      fontWeight: FontWeight.w700),
                ),
              ),
              CustomTextField(
                controller: ref.priceCtrl,
                hintText: 'Price',
                //name
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8 * context.scaleDiagonal(), horizontal: 12),
                textInputType: TextInputType.number,
                errorText: ref.checkNotValidate(ValidateInput.priceEmpty)
                    ? "Product price is empty"
                    : ref.checkNotValidate(ValidateInput.priceMin)
                        ? "Minimum Rp. 500"
                        : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _inputProductDesc(BuildContext context, ProductsProvider ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: CustomText(
            textToDisplay: 'Product Description:',
            textAlign: TextAlign.start,
            textStyle: context.getTheme().textTheme.labelMedium?.copyWith(
                color: context.getTheme().colorScheme.primary,
                fontWeight: FontWeight.w700),
          ),
        ),
        CustomTextField(
          controller: ref.descCtrl,
          hintText: 'Product Description',
          //name
          contentPadding: EdgeInsets.symmetric(
              vertical: 8 * context.scaleDiagonal(), horizontal: 12),
          textInputType: TextInputType.multiline,
          minLines: 1,
          maxLines: 5,
          errorText: ref.checkNotValidate(ValidateInput.descEmpty)
              ? "Product description is empty"
              : ref.checkNotValidate(ValidateInput.descMin)
                  ? "Minimum 15 characters"
                  : null,
        )
      ],
    );
  }

  Column _inputProductName(BuildContext context, ProductsProvider ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: CustomText(
            textToDisplay: 'Product Name:',
            textAlign: TextAlign.start,
            textStyle: context.getTheme().textTheme.labelMedium?.copyWith(
                color: context.getTheme().colorScheme.primary,
                fontWeight: FontWeight.w700),
          ),
        ),
        CustomTextField(
          controller: ref.nameCtrl,
          hintText: 'Product Name', //name
          contentPadding: EdgeInsets.symmetric(
              vertical: 8 * context.scaleDiagonal(), horizontal: 12),
          errorText: ref.checkNotValidate(ValidateInput.nameEmpty)
              ? "Product name is empty"
              : ref.checkNotValidate(ValidateInput.nameMin)
                  ? "Minimum 5 characters"
                  : null,
        )
      ],
    );
  }
}
