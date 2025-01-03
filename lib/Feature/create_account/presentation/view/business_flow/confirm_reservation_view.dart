import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/out_line_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/drop_down_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';

class ConfirmReservationView extends StatefulWidget {
  const ConfirmReservationView({super.key});

  @override
  State<ConfirmReservationView> createState() => _ConfirmReservationView();
}

class _ConfirmReservationView extends State<ConfirmReservationView> {

  List<String> groupButtonIconList = [
    AssetsProviderData.instant,
    AssetsProviderData.advanceBooking,
  ];

  List<String> groupButtonTitleList = [
    LocaleKeys.kInstantBooking.tr(),
    LocaleKeys.kAdvanceBooking.tr(),
  ];

  List<String> groupButtonTextList = [
    LocaleKeys.kWhenThisOptionIsActivatedCustomerRequestsAreAutomaticallyAccepted.tr(),
    LocaleKeys.kWhenThisOptionIsActivatedCustomerRequestsAwaitConfirmation.tr(),
  ];

  List<bool> groupButtonCheckList = [
    false,
    false,
  ];


  List<String> itemsList = [
    LocaleKeys.kTheSameDay.tr(),
    LocaleKeys.kAtLeastOneDayInAdvance.tr(),
    LocaleKeys.kAtLeastTwoDayInAdvance.tr(),
    LocaleKeys.kAtLeastThreeDayInAdvance.tr(),
    LocaleKeys.kAtLeastSevenDayInAdvance.tr(),
  ];

  String? deadline ;
  GroupButtonController checkController = GroupButtonController();

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
                step1State: LocaleKeys.kConfirmed.tr(),
                step2State: LocaleKeys.kInProgress.tr(),
                step3State: LocaleKeys.kPending.tr(),
                step4State: LocaleKeys.kPending.tr(),
                step5State: LocaleKeys.kPending.tr(),
              ),
              SizedBox(
                height: SizeData.s48,
              ),
              Text(
                LocaleKeys.kDecideHowYouWillConfirmReservations.tr(),
                style: Styles.textStyleGray500M20,
              ),
              SizedBox(
                height: SizeData.s32,
              ),

              GroupButton(
                controller: checkController,
                isRadio: true,
                enableDeselect: true,
                options: const GroupButtonOptions(
                  groupingType: GroupingType.column,
                ),
                buttonIndexedBuilder: (isSelected, index, context){
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                       groupButtonCheckList[index] = !groupButtonCheckList[index];
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(
                        SizeData.s16,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: SizeData.s4,
                      ),
                      decoration: BoxDecoration(
                        color: groupButtonCheckList[index] ?
                        ColorData.blue2Color :
                        ColorData.whiteColor,
                        border: Border.all(
                          color: groupButtonCheckList[index] ?
                          ColorData.blue9Color :
                          ColorData.gray100Color,
                        ),
                        borderRadius: BorderRadius.circular(
                          SizeData.s8,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  groupButtonTitleList[index],
                                  style: Styles.textStyleGray600M16,
                                ),
                                SizedBox(
                                  height: SizeData.s4,
                                ),
                                Text(
                                  groupButtonTextList[index],
                                  style: Styles.textStyleGray400R12,
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            groupButtonIconList[index],
                            width: Unit(context).getWidthSize*0.09,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onSelected: (_, index, selected) {
                },
                buttons: groupButtonIconList,
              ),

              if(groupButtonCheckList[0]) ...[
                SizedBox(
                  height: SizeData.s16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.kBookingDeadlineBeforeArrival.tr(),
                            style: Styles.textStyleGray600M16,
                          ),
                          SizedBox(
                            height: SizeData.s4,
                          ),
                          Text(
                            LocaleKeys.kHowLongBeforeArrivalDoYouNeedToReceiveATravelerReservation.tr(),
                            style: Styles.textStyleGray400R12,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      AssetsProviderData.deadline,
                      width: Unit(context).getWidthSize*0.15,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeData.s8,
                ),
                DropDownFiledCustom(
                  value: deadline,
                  isProvider: true,
                  hintText: LocaleKeys.kSelectHere.tr(),
                  items: itemsList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                      deadline = newValue.toString();
                  },
                ),
              ],
              SizedBox(
                height: SizeData.s32,
              ),
              Row(
                children: [
                  OutLineButtonCustom(
                    onTap: (){},
                    isProvider: true,
                    text: LocaleKeys.kSaveForLater.tr(),
                    color: ColorData.whiteColor,
                  ),
                  const Spacer(),
                  MainButtonCustom(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kAddingParkingPicturesView);
                    },
                    isProvider: true,
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
