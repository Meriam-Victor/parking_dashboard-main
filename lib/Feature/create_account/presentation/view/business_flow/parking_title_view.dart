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
import 'package:parking_dashboard/Core/widget/buttons/main_custom_button.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_step_component.dart';
import 'package:parking_dashboard/Core/widget/input_fields/custom_input_field.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';

class ParkingTitleView extends StatefulWidget {
  const ParkingTitleView({super.key});

  @override
  State<ParkingTitleView> createState() => _ParkingTitleView();
}

class _ParkingTitleView extends State<ParkingTitleView> {

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
                LocaleKeys.kNowLetUsGiveYourParkingTitle.tr(),
                style: Styles.textStyleGreyBlue1ColorM20,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Text(
                LocaleKeys.kParkingTitle.tr(),
                style: Styles.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
              ),
              SizedBox(
                height: SizeData.s20,
              ),
              Text(
                LocaleKeys.kDescription.tr(),
                style: Styles.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
                minLines: 6,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Text(
                LocaleKeys.kAddress.tr(),
                style: Styles.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
              ),
              SizedBox(
                height: SizeData.s48,
              ),
              Row(
                children: [
                  MainCustomButton(
                    onTap: (){},
                    width: Unit(context).getWidthSize*0.3,
                    text: LocaleKeys.kCancel.tr(),
                    color: ColorData.primary3Color,
                    colorFont: ColorData.primary2Color,
                  ),
                  const Spacer(),
                  MainCustomButton(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kTypeOfPropertyView);
                    },
                    width: Unit(context).getWidthSize*0.55,
                    text: LocaleKeys.kNext.tr(),
                    arrowIcon: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
