import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';

class MainButtonProviderCustom extends StatelessWidget {
  final Function() onTap;
  final String text;
  Color? color;
  Color? colorFont;
  double? sizeFont;
  bool ? height;
  double ? width;
  bool? arrowIcon;
  Color? borderColor;
  double? borderWidth;

  MainButtonProviderCustom({super.key, required this.onTap, required this.text,
    this.color,this.colorFont,this.sizeFont ,this.height, this.width,
    this.arrowIcon,this.borderColor, this.borderWidth, });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height??true?50:null,
      elevation: 0.0,
      minWidth: width??double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeData.s8),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0.0,
        ),
      ),
      color: color??ColorData.purple4Color,
      onPressed: onTap,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
              style: Styles.textStyleWhiteR14.copyWith(
                  color: colorFont??ColorData.whiteColor,
                  fontSize: sizeFont??Unit(context).getWidthSize*0.042
              ),textAlign: TextAlign.center,),
            SizedBox(
              width: SizeData.s4,
            ),
            if(arrowIcon??false)
              Icon(
                Icons.arrow_forward,
                color: ColorData.whiteColor,
              ),
          ],
        ),
      ),);
  }
}
