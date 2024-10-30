import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

buildSkipDialog({required BuildContext context,}) {

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeData.s16,
          ),
        ),
        backgroundColor: ColorProviderData.whiteColor,
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
                  Lottie.asset(
                    AssetsProviderData.info,
                    width: Unit(context).getWidthSize*0.6,
                    height: Unit(context).getWidthSize*0.4,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Text(
                    LocaleKeys.kSkippingThisStepMeansYourParkingWillNotOfferAnyOfTheseServices.tr(),
                    style: StylesProvider.textStyleGreyBlue1ColorR16,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeData.s24,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      SizeData.s8,
                    ),
                    decoration: BoxDecoration(
                      color: ColorProviderData.yellow1Color,
                      borderRadius: BorderRadius.circular(
                        SizeData.s8,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AssetsProviderData.infoCircle,
                        ),
                        SizedBox(
                          width: SizeData.s8,
                        ),
                        Expanded(
                          child: Text(
                            LocaleKeys.kDoNotWorryYouCanStillManageServicesAtYourParkingLater.tr(),
                            style: StylesProvider.textStyleYellow2ColorR12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MainButtonProviderCustom(
                          onTap: (){
                            GoRouter.of(context).push(AppProviderRouter.kOfferedServicesSecondView);
                          },
                          text: LocaleKeys.kGoBack.tr(),
                          color: ColorProviderData.primary3Color,
                          colorFont: ColorProviderData.primary2Color,
                        ),
                      ),
                      SizedBox(
                        width: SizeData.s8,
                      ),
                      Expanded(
                        child: MainButtonProviderCustom(
                          onTap: (){
                            Navigator.of(context).pop();
                            GoRouter.of(context).push(AppProviderRouter.kTypeOfBookingView);
                          },
                          text: LocaleKeys.kSkipAnyway.tr(),
                        ),
                      ),
                    ],
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
                  backgroundColor: ColorProviderData.whiteColor,
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