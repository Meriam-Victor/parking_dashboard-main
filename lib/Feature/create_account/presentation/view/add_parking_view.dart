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
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_step_component.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';

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
          style: Styles.textStyleGreyBlue5ColorR16,
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProgressStepComponent(
                      stepIcon: SvgPicture.asset(
                        AssetsData.activatedStep,
                        width: Unit(context).getWidthSize*0.064,
                      ),
                      progressColor: ColorData.blue2Color,
                      percent: 0.3,
                      stepNumber: '1',
                      title: LocaleKeys.kParkingDetails.tr(),
                      stateName: LocaleKeys.kInProgress.tr(),
                      stateNameColor: ColorData.blue4Color,
                      stateBackgroundColor: ColorData.blue3Color,
                    ),
                    SizedBox(
                      width: SizeData.s24,
                    ),
                    ProgressStepComponent(
                      stepIcon: SvgPicture.asset(
                        AssetsData.unactivatedStep,
                        width: Unit(context).getWidthSize*0.064,
                      ),
                      progressColor: ColorData.blue2Color,
                      percent: 0.0,
                      stepNumber: '2',
                      title: LocaleKeys.kConfiguration.tr(),
                      stateName: LocaleKeys.kPending.tr(),
                      stateNameColor: ColorData.greyBlue5Color,
                      stateBackgroundColor: ColorData.greyBlue7Color,
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: SizeData.s48,
              ),

              Text(
                LocaleKeys.kAreYouUsingParticularOrBusinessAccount.tr(),
                style: Styles.textStyleGreyBlue1ColorM20,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              SizedBox(
                width: Unit(context).getWidthSize*0.915,
                child: OutlinedButton(
                  onPressed: () {  },
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
                          color: ColorData.blue5Color,
                          width: SizeData.s1,
                        );
                      }
                      return BorderSide(
                        color: ColorData.greyBlue7Color,
                        width: SizeData.s1,
                      );
                    }),
                    overlayColor: WidgetStateProperty.all(ColorData.blue3Color),
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return ColorData.blue3Color;
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
                          style: Styles.textStyleGreyBlue8ColorM16,
                        ),
                        SizedBox(
                          height: SizeData.s10,
                        ),
                        Text(
                          LocaleKeys.kIdealForIndividualParkingSpaceOwners.tr(),
                          style: Styles.textStyleGreyBlue8ColorR14,
                        ),
                        SizedBox(
                          height: SizeData.s24,
                        ),
                        SvgPicture.asset(
                          AssetsData.userIcon,
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
                    GoRouter.of(context).push(AppRouter.kParkingTitleView);
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
                          color: ColorData.blue5Color,
                          width: SizeData.s1,
                        );
                      }
                      return BorderSide(
                        color: ColorData.greyBlue7Color,
                        width: SizeData.s1,
                      );
                    }),
                    overlayColor: WidgetStateProperty.all(ColorData.blue3Color),
                    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return ColorData.blue3Color;
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
                          style: Styles.textStyleGreyBlue8ColorM16,
                        ),
                        SizedBox(
                          height: SizeData.s10,
                        ),
                        Text(
                          LocaleKeys.kDesignedForBusinessesWithMultipleParkingLocations.tr(),
                          style: Styles.textStyleGreyBlue8ColorR14,
                        ),
                        SizedBox(
                          height: SizeData.s24,
                        ),
                        SvgPicture.asset(
                          AssetsData.buildings2,
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
