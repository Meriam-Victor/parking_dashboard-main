import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';

buildCongratulationsDialog({required BuildContext context,}) {

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
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(
                SizeData.s24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.kCongratulation.tr(),
                    style: Styles.textStyleGray7005R18,
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
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
                    LocaleKeys.kYourAccountHasBeenSuccessfullyVerifiedAndYourParkingIsNowOnline.tr(),
                    style: Styles.textStyleGray500R16,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeData.s24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Unit(context).getWidthSize*0.148,
                    ),
                    child: MainButtonCustom(
                      onTap: (){
                        GoRouter.of(context).push(AppRouter.kManagePaymentView);
                      },
                      isProvider: true,
                      text: LocaleKeys.kAddBankDetails.tr(),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -25.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius: SizeData.s20,
                  backgroundColor: ColorData.whiteColor,
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}