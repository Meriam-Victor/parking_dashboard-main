import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/day_working_hours.dart';

import '../widget/hours_for_special_date.dart';

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
                LocaleKeys.kWorkingHours.tr(),
                style: Styles.textStyleGreyBlue1ColorM20,
              ),
              SizedBox(
                height: SizeData.s10,
              ),
              Text(
                LocaleKeys.kThisSectionAllowsYouToManageYourParkingSchedule.tr(),
                style: Styles.textStyleGreyBlue3ColorR14,
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
                    color: ColorData.blue5Color,
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
                        color: ColorData.blue3Color,
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
                              AssetsData.addSquareIcon,
                            ),
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            Text(
                              LocaleKeys.kOpeningHoursForSpecialDates.tr(),
                              style: Styles.textStyleBlue1ColorM14,
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
                  MainCustomButton(
                    onTap: (){},
                    width: Unit(context).getWidthSize*0.35,
                    text: LocaleKeys.kSaveForLater.tr(),
                    color: ColorData.whiteColor,
                    colorFont: ColorData.primary2Color,
                    borderColor: ColorData.primary2Color,
                    borderWidth: 1.0,
                  ),
                  const Spacer(),
                  MainCustomButton(
                    onTap: (){
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
