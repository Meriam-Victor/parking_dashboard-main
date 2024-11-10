import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';

class ViewDetailsTextFieldCustom extends StatelessWidget {

  String? icon;
  String data;
  double? height;


  ViewDetailsTextFieldCustom({
    super.key,
    this.icon,
    required this.data,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Container(
      height: height,
      padding: EdgeInsets.all(
        SizeData.s8,
      ),
      decoration: BoxDecoration(
        color: ColorData.gray25Color,
        borderRadius: BorderRadius.circular(
          SizeData.s6,
        ),
        border: Border.all(
          color: ColorData.gray100Color,
        ),
      ),
      child: Row(
        children: [
          if(icon != null)
            SvgPicture.asset(
              icon!,
              width: Unit(context).getWidthSize*0.05,
            ),
          SizedBox(
            width: SizeData.s4,
          ),
          Expanded(
            child: Text(
              data,
              style: Styles.textStyleGrey300R14,
              overflow: TextOverflow.visible
            ),
          ),
        ],
      ),
    );
  }
}






