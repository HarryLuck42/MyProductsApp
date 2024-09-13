import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';

import '../core/constraint/asset_path.dart';
import 'custom_icon.dart';

PreferredSizeWidget CustomAppBar(BuildContext context, String title, {bool isBack = true, List<Widget>? actions}){
  return AppBar(
    actions: actions,
    leading: isBack ? IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: CustomIcon(
        iconData: '${AssetPath.vector}back_arrow.svg',
        defaultColor: false,
        color: context.getTheme().colorScheme.primary,
      ),
    ): null,
    title: Text(
      title,
      style: context.getTheme().textTheme.titleMedium,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 1.0,
  );
}
