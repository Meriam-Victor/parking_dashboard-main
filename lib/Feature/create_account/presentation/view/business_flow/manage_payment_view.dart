import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';

class ManagePaymentView extends StatefulWidget {
  const ManagePaymentView({super.key});

  @override
  State<ManagePaymentView> createState() => _ManagePaymentView();
}

class _ManagePaymentView extends State<ManagePaymentView> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorProviderData.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorProviderData.whiteColor,
        title: Text(
          LocaleKeys.kAddParking.tr(),
          style: StylesProvider.textStyleGreyBlue5ColorR16,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          SizeData.s24,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
              //  width: Unit(context).getWidthSize*0.96,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeData.s16,
                  vertical: SizeData.s48,
                ),
                margin: EdgeInsets.all(
                  SizeData.s16,
                ),
                decoration: BoxDecoration(
                  color: ColorProviderData.whiteColor,
                  borderRadius: BorderRadius.circular(
                    SizeData.s16,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorProviderData.shadow1Color,
                      spreadRadius: -2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: ColorProviderData.shadow2Color,
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsProviderData.addSquareIcon,
                    ),
                    SizedBox(
                      width: SizeData.s8,
                    ),
                    Text(
                      LocaleKeys.kAddNewPayoutMethod.tr(),
                      style: StylesProvider.textStyleBlue1ColorM14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
