import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';


class NotificationCardCustom extends StatefulWidget {

  String notification;
  String time;


  NotificationCardCustom({
    super.key,
    required this.notification,
    required this.time,
  });

  @override
  State<NotificationCardCustom> createState() => _NotificationCardCustom();
}

class _NotificationCardCustom extends State<NotificationCardCustom> {

  bool clicked = false;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        setState(() {
          clicked = !clicked;
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          SizeData.s16,
        ),
        decoration: BoxDecoration(
          color: clicked ?
          ColorData.purple3Color :
          ColorData.whiteColor,
          borderRadius: BorderRadius.circular(
            SizeData.s12,
          ),
          border: Border.all(
            color: clicked ?
            Colors.transparent :
            ColorData.gray100Color,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Unit(context).getWidthSize*0.107,
              height: Unit(context).getHeightSize*0.049,
              padding: EdgeInsets.all(
                SizeData.s6,
              ),
              decoration: BoxDecoration(
                color: clicked ?
                ColorData.secondary4Color :
                ColorData.white5Color,
                borderRadius: BorderRadius.circular(
                  SizeData.s4,
                ),
              ),
              child: SvgPicture.asset(
                clicked ?
                AssetsProviderData.notificationSelectedIcon :
                AssetsProviderData.notificationIcon,
              ),
            ),
            SizedBox(
              width: SizeData.s8,
            ),
            Column(
              children: [
                // Expanded(
                //   child: Text(
                //     widget.notification,
                //     style: clicked ?
                //     Styles.textStyleGray600R14 :
                //     Styles.textStyleGrey300R14,
                //   ),
                // ),
                SizedBox(
                  height: SizeData.s8,
                ),
                Text(
                  widget.time,
                  style: clicked ?
                  Styles.textStyleGrayR12 :
                  Styles.textStyleGray200R12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}






