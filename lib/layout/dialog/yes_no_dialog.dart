import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';

import '../../core/constraint/spacer.dart';
import '../../core/themes/app_colors.dart';
import '../../widgets/custom_gesture.dart';
import '../../widgets/custom_text.dart';

class YesNoDialog extends StatefulWidget {
  String message;
  String yes;
  String no;
  OnClickDialog listener;
  dynamic data;
  YesNoDialog(
      {super.key,
        required this.message,
        required this.no,
        required this.yes,
        required this.listener,
        this.data
      });

  @override
  State<YesNoDialog> createState() => _YesNoDialogState();
}

class _YesNoDialogState extends State<YesNoDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.getTheme().colorScheme.background,
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 150,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: CustomText(
                textToDisplay: widget.message,
                maxLines: 5,
                textStyle: context
                    .getTheme()
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: findColor, fontWeight: FontWeight.w700),
              ),
            ),
            sixteenPx,
            Row(
              children: [
                Expanded(
                    child: _customButton(context, widget.no, Red, (){
                      widget.listener.onNo();
                      Navigator.pop(context);
                    })),
                fourPx,
                Expanded(
                    child: _customButton(context, widget.yes, context.getColorScheme().primary, () async{
                      await widget.listener.onYes(context, widget.data);
                      Navigator.pop(context);
                    },),)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _customButton(
      BuildContext context, String caption, Color color, Function() action) {
    return CustomGesture(onTap: () => action(),
      radius: 10, child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(10)),
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(caption, style: context.getTheme().textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),)),
      ),);
  }
}

abstract class OnClickDialog{
  Future onYes(BuildContext context, dynamic data);
  void onNo();
}