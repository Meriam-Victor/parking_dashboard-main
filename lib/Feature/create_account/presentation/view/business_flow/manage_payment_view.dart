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
      backgroundColor: ColorData.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorData.whiteColor,
        title: Text(
          LocaleKeys.kAddParking.tr(),
          style: Styles.textStyleGray700R16,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          SizeData.s16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  SizeData.s16,
                ),
                margin: EdgeInsets.all(
                  SizeData.s16,
                ),
                decoration: BoxDecoration(
                  color: ColorData.whiteColor,
                  borderRadius: BorderRadius.circular(
                    SizeData.s16,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorData.grayShadow3Color,
                      spreadRadius: -2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: ColorData.grayShadow4Color,
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
                      style: Styles.textStyleBlue500M14,
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
