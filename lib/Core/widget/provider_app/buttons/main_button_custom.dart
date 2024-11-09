
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';


class MainButtonCustom extends StatelessWidget {
  final Function() onTap;
  final String text;
  Color? color;
  Color? colorFont;
  double? sizeFont;
  bool? arrowIcon;
  bool? isProvider;
  String? prefix;
  MainButtonCustom({super.key, required this.onTap, required this.text,this.color,this.colorFont,this.sizeFont,this.arrowIcon,this.isProvider,this.prefix});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0.0,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeData.s8)
        ),
        padding:EdgeInsets.all(SizeData.s15),
        color: color??((isProvider??false)?ColorData.purple4Color:ColorData.primaryColor),
        onPressed: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(prefix != null) ...[
              SvgPicture.asset(
                prefix!,
              ),
              SizedBox(
                width: SizeData.s4,
              ),
            ],
            FittedBox(
              child: Text(text,
              style: Styles.textStyle14.copyWith(
                color: colorFont??ColorData.whiteColor,
                fontSize: sizeFont??Unit(context).getWidthSize*0.042
              ),textAlign: TextAlign.center,),
            ),
            if(arrowIcon??false)
              SizedBox(
                width: SizeData.s4,
              ),
            if(arrowIcon??false)
              Icon(
                Icons.arrow_forward,
                color: ColorData.whiteColor,
              ),
          ],
        ),);
  }
}
