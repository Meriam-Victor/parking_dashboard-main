import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/out_line_button_custom.dart';

buildSwitchTravelingDialog({required BuildContext context,}) {

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeData.s16,
          ),
        ),
        backgroundColor: ColorData.whiteColor,
        child: Padding(
          padding: EdgeInsets.all(
            SizeData.s24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                AssetsProviderData.great,
                width: Unit(context).getWidthSize*0.6,
                height: Unit(context).getWidthSize*0.4,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: SizeData.s16,
              ),
              Text(
                LocaleKeys.kAreYouSureYouWantToSwitchToTravelling.tr(),
                style: Styles.textStyleGray500R16,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeData.s24,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutLineButtonCustom(
                      onTap: (){},
                      text: LocaleKeys.kCancel.tr(),
                      color: ColorData.whiteColor,
                      isProvider: true,
                    ),
                  ),
                  SizedBox(
                    width: SizeData.s8,
                  ),
                  Expanded(
                    child: MainButtonCustom(
                      onTap: (){
                      },
                      isProvider: true,
                      text: LocaleKeys.kContinue.tr(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}