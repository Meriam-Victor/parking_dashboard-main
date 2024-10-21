import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(
        SizeData.s16,
      ),
      decoration: BoxDecoration(
          color: ColorData.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
                SizeData.s16,
            ),
            bottomRight: Radius.circular(
                SizeData.s16,
            ),
          )
      ),
      child: AppBar(
        title: Text(
          title,
          style: Styles.textStyleWhiteR14,
        ),
        centerTitle: true,
        backgroundColor: ColorData.primaryColor,
        leading: IconButton(
          onPressed: () => {},
          icon: Container(
            width: Unit(context).getWidthSize*0.107,
            height: Unit(context).getHeightSize*0.049,
            decoration: BoxDecoration(
              color: ColorData.whiteColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(
                SizeData.s8,
              ),
            ),
            child: IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset(
                AssetsData.menuIcon,
                width: Unit(context).getWidthSize*0.064,
              ),
            ),
          ),
        ),
        actions: [
          SvgPicture.asset(
            AssetsData.kiroTravelLogo,
            width: Unit(context).getWidthSize*0.128,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight+35);

}
