
import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';

class OutLineButtonCustom extends StatelessWidget {
  final Function() onTap;
  final String text;
  Color? color;
  double? sizeFont;
  Widget ? widget;
  bool ? isProvider;
  OutLineButtonCustom({super.key, required this.onTap, required this.text,this.color,this.sizeFont ,this.widget , this.isProvider});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
       onPressed: onTap,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeData.s8))),
        side: WidgetStateProperty.all(BorderSide(
          color: color??(isProvider??false ? ColorData.purple4Color : ColorData.primaryColor),
          width: 1
        )),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity,50))
      ),
      child: FittedBox(
        child: widget??Text(text,
        style: Styles.textStyle14.copyWith(
          fontSize: sizeFont??Unit(context).getWidthSize*0.037,
          color: color??(isProvider??false ? ColorData.purple4Color : ColorData.primaryColor),
        ),textAlign: TextAlign.center,),
      ),
    );
  }
}
