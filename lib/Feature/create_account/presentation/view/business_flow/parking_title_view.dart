import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/input_text_custom.dart';

class ParkingTitleView extends StatefulWidget {
  const ParkingTitleView({super.key});

  @override
  State<ParkingTitleView> createState() => _ParkingTitleView();
}

class _ParkingTitleView extends State<ParkingTitleView> {

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
                LocaleKeys.kNowLetUsGiveYourParkingTitle.tr(),
                style: StylesProvider.textStyleGreyBlue1ColorM20,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Text(
                LocaleKeys.kParkingTitle.tr(),
                style: StylesProvider.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextProviderCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
              ),
              SizedBox(
                height: SizeData.s20,
              ),
              Text(
                LocaleKeys.kDescription.tr(),
                style: StylesProvider.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextProviderCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
                minLines: 6,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Text(
                LocaleKeys.kAddress.tr(),
                style: StylesProvider.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextProviderCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
              ),
              SizedBox(
                height: SizeData.s48,
              ),
              Row(
                children: [
                  MainButtonProviderCustom(
                    onTap: (){},
                    width: Unit(context).getWidthSize*0.3,
                    text: LocaleKeys.kCancel.tr(),
                    color: ColorProviderData.primary3Color,
                    colorFont: ColorProviderData.primary2Color,
                  ),
                  const Spacer(),
                  MainButtonProviderCustom(
                    onTap: (){
                      GoRouter.of(context).push(AppProviderRouter.kTypeOfPropertyView);
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
