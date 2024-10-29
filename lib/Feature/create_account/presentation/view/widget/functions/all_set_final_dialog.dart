import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/functions/congratulations_dialog.dart';

buildAllSetFinalDialog({required BuildContext context,}) {

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
                  Text(
                    LocaleKeys.kYouAreAllSet.tr(),
                    style: StylesProvider.textStyleBlue5ColorR18,
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Lottie.asset(
                    AssetsData.allSet,
                    width: Unit(context).getWidthSize*0.6,
                    height: Unit(context).getWidthSize*0.4,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Text(
                    LocaleKeys.kYourParkingDetailsHaveBeenSubmittedSuccessfully.tr(),
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
                      color: ColorProviderData.blue3Color,
                      borderRadius: BorderRadius.circular(
                        SizeData.s8,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AssetsData.infoCircleBlue,
                        ),
                        SizedBox(
                          width: SizeData.s8,
                        ),
                        Expanded(
                          child: Text(
                            LocaleKeys.kDonNotWorryYouCanStillAddMoreParkingSpacesInYourDashboard.tr(),
                            style: StylesProvider.textStyleBlue1ColorR12,
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
                          onTap: (){},
                          text: LocaleKeys.kAddNewParking.tr(),
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
                            buildCongratulationsDialog(context: context);
                          },
                          text: LocaleKeys.kExploreDashboard.tr(),
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