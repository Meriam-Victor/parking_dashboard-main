import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';

class TypeOfParkingFlow {
  static bool isBusiness = false;
}

class AddParking extends StatefulWidget {
     const AddParking({super.key});

  @override
   State<AddParking> createState() => _AddParking();
}

class _AddParking extends State<AddParking> {

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
          SizeData.s24,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressSteps(
                step1State: LocaleKeys.kInProgress.tr(),
                step2State: LocaleKeys.kPending.tr(),
                step3State: LocaleKeys.kPending.tr(),
                step4State: LocaleKeys.kPending.tr(),
                step5State: LocaleKeys.kPending.tr(),
              ),

              SizedBox(
                height: SizeData.s48,
              ),

              Text(
                LocaleKeys.kAreYouUsingParticularOrBusinessAccount.tr(),
                style: Styles.textStyleGray500M20,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              SizedBox(
                width: Unit(context).getWidthSize*0.915,
                child: OutlinedButton(
                  onPressed: () {
                    TypeOfParkingFlow.isBusiness = false;
                    GoRouter.of(context).push(AppProviderRouter.kParkingTitleView);
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeData.s12,
                        ),
                      ),
                    ),
                    side: WidgetStateProperty.resolveWith<BorderSide>((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return BorderSide(
                          color: ColorData.blue9Color,
                          width: SizeData.s1,
                        );
                      }
                      return BorderSide(
                        color: ColorData.white3Color,
                        width: SizeData.s1,
                      );
                    }),
                    overlayColor: WidgetStateProperty.all(ColorData.blue2Color),
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return ColorData.blue2Color;
                      }
                      return Colors.transparent;
                    }),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeData.s8,
                      vertical: SizeData.s20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.kParticular.tr(),
                          style: Styles.textStyleGray600M16,
                        ),
                        SizedBox(
                          height: SizeData.s10,
                        ),
                        Text(
                          LocaleKeys.kIdealForIndividualParkingSpaceOwners.tr(),
                          style: Styles.textStyleGray600R14,
                        ),
                        SizedBox(
                          height: SizeData.s24,
                        ),
                        SvgPicture.asset(
                          AssetsProviderData.userIcon,
                          width: Unit(context).getWidthSize*0.128,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              SizedBox(
                width: Unit(context).getWidthSize*0.915,
                child: OutlinedButton(
                  onPressed: () {
                    TypeOfParkingFlow.isBusiness = true;
                    GoRouter.of(context).push(AppProviderRouter.kParkingTitleView);
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeData.s12,
                        ),
                      ),
                    ),
                    side: WidgetStateProperty.resolveWith<BorderSide>((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return BorderSide(
                          color: ColorData.blue9Color,
                          width: SizeData.s1,
                        );
                      }
                      return BorderSide(
                        color: ColorData.white3Color,
                        width: SizeData.s1,
                      );
                    }),
                    overlayColor: WidgetStateProperty.all(ColorData.blue2Color),
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return ColorData.blue2Color;
                      }
                      return Colors.transparent;
                    }),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeData.s8,
                      vertical: SizeData.s20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.kBusinessCompany.tr(),
                          style: Styles.textStyleGray600M16,
                        ),
                        SizedBox(
                          height: SizeData.s10,
                        ),
                        Text(
                          LocaleKeys.kDesignedForBusinessesWithMultipleParkingLocations.tr(),
                          style: Styles.textStyleGray600R14,
                        ),
                        SizedBox(
                          height: SizeData.s24,
                        ),
                        SvgPicture.asset(
                          AssetsProviderData.buildings2,
                          width: Unit(context).getWidthSize*0.128,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
