import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/input_text_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';

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
                LocaleKeys.kNowLetUsGiveYourParkingTitle.tr(),
                style: Styles.textStyleGray500M20,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Text(
                LocaleKeys.kParkingTitle.tr(),
                style: Styles.textStyleGray500R14,
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
                style: Styles.textStyleGray500R14,
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
                style: Styles.textStyleGray500R14,
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
                  MainButtonCustom(
                    onTap: (){},
                    isProvider: true,
                    text: LocaleKeys.kCancel.tr(),
                    color: ColorData.primaryP2Color,
                    colorFont: ColorData.purple4Color,
                  ),
                  const Spacer(),
                  MainButtonCustom(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kTypeOfPropertyView);
                    },
                    isProvider: true,
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
