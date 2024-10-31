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
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/day_working_hours.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/hours_for_special_date.dart';

class WorkingHoursView extends StatefulWidget {
  const WorkingHoursView({super.key});

  @override
  State<WorkingHoursView> createState() => _WorkingHoursView();
}

class _WorkingHoursView extends State<WorkingHoursView> {

  bool specialDate = false;


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
                LocaleKeys.kWorkingHours.tr(),
                style: Styles.textStyleGray500M20,
              ),
              SizedBox(
                height: SizeData.s10,
              ),
              Text(
                LocaleKeys.kThisSectionAllowsYouToManageYourParkingSchedule.tr(),
                style: Styles.textStyleGrey300R14,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              DayWorkingHours(day: LocaleKeys.kMonday.tr()),
              SizedBox(
                height: SizeData.s16,
              ),
              DayWorkingHours(day: LocaleKeys.kTuesday.tr()),
              SizedBox(
                height: SizeData.s16,
              ),
              DayWorkingHours(day: LocaleKeys.kWednesday.tr()),
              SizedBox(
                height: SizeData.s16,
              ),
              DayWorkingHours(day: LocaleKeys.kThursday.tr()),
              SizedBox(
                height: SizeData.s16,
              ),
              DayWorkingHours(day: LocaleKeys.kFriday.tr()),
              SizedBox(
                height: SizeData.s16,
              ),
              DayWorkingHours(day: LocaleKeys.kSaturday.tr()),
              SizedBox(
                height: SizeData.s16,
              ),
              DayWorkingHours(day: LocaleKeys.kSunday.tr()),
              SizedBox(
                height: SizeData.s16,
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  SizeData.s16,
                ),
                decoration: BoxDecoration(
                  color: ColorData.whiteColor,
                  border: Border.all(
                    color: ColorData.blue9Color,
                  ),
                  borderRadius: BorderRadius.circular(
                    SizeData.s8,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        SizeData.s8,
                      ),
                      decoration: BoxDecoration(
                        color: ColorData.blue2Color,
                        borderRadius: BorderRadius.circular(
                          SizeData.s8,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            specialDate = true;
                          });
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AssetsProviderData.addSquareIcon,
                            ),
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            Text(
                              LocaleKeys.kOpeningHoursForSpecialDates.tr(),
                              style: Styles.textStyleBlue500M14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (specialDate) ...[
                      SizedBox(
                        height: SizeData.s8,
                      ),
                      const HoursForSpecialDate(),
                    ],
                  ],
                ),
              ),



              SizedBox(
                height: SizeData.s32,
              ),
              Row(
                children: [
                  MainButtonProviderCustom(
                    onTap: (){},
                    width: Unit(context).getWidthSize*0.35,
                    text: LocaleKeys.kSaveForLater.tr(),
                    color: ColorData.whiteColor,
                    colorFont: ColorData.purple4Color,
                    borderColor: ColorData.purple4Color,
                    borderWidth: 1.0,
                  ),
                  const Spacer(),
                  MainButtonProviderCustom(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kTypeOfParkingView);
                    },
                    width: Unit(context).getWidthSize*0.48,
                    text: LocaleKeys.kNext.tr(),
                    arrowIcon: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
