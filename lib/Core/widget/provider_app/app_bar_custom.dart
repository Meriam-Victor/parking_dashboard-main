
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/widget/provider_app/side_bar_view.dart';


class AppBarProviderCustom extends StatelessWidget{
  final String title;

  AppBarProviderCustom({super.key, required this.title, });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: Unit(context).getHeightSize*0.13,
      padding: EdgeInsets.only(
        left: SizeData.s16,
        right: SizeData.s16,
        bottom: SizeData.s16,
        top: SizeData.s48,
      ),
      decoration: BoxDecoration(
          color: ColorData.primaryPColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(SizeData.s16,),
            bottomRight: Radius.circular(SizeData.s16),
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
       children: [
         GestureDetector(
           onTap: (){
             Scaffold.of(context).openDrawer();
           },
           child: Container(
             width: Unit(context).getWidthSize*0.107,
             height: Unit(context).getHeightSize*0.049,
             decoration: BoxDecoration(
               color: ColorData.whiteColor.withOpacity(0.6),
               borderRadius: BorderRadius.circular(
                 SizeData.s8,
               ),
             ),
             child: Icon(Icons.menu,
               size: Unit(context).getWidthSize*0.064,
             ),
           ),
         ),
         Expanded(
           child: Center(
             child: Text(title,
               style: Styles.textStyleWhiteR14,
             ),
           ),
         ),
         SvgPicture.asset(
           AssetsProviderData.kiroTravelLogo,
           width: Unit(context).getWidthSize*0.128,
         ),
       ],

      ),
    );
  }
}
