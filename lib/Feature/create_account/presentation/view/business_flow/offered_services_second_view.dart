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
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/add_parking_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/functions/skip_dialog.dart';

class OfferedServicesSecondView extends StatefulWidget {
  const OfferedServicesSecondView({super.key});

  @override
  State<OfferedServicesSecondView> createState() => _OfferedServicesSecondView();
}

class _OfferedServicesSecondView extends State<OfferedServicesSecondView> {

  List<String> groupButtonSelectedList = [
    'no',
    'no',
    'no',
    'no',
  ];

  List<String> groupButtonIconList = [
    AssetsProviderData.leaveKeys,
    AssetsProviderData.valet,
    AssetsProviderData.disabilities,
    AssetsProviderData.securityCamera,
  ];

  List<String> groupButtonTitleList = [
    LocaleKeys.kDoesYourParkingRequiresCustomerToLeaveCarKeys.tr(),
    LocaleKeys.kDoesYourParkingOfferValetServiceAtTheAirport.tr(),
    LocaleKeys.kIsYourParkingSpaceSuitableForPeopleWithDisabilities.tr(),
    LocaleKeys.kDoesYourParkingOfferSecurityCameraService.tr(),
  ];

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
                step2State: LocaleKeys.kConfirmed.tr(),
                step3State: LocaleKeys.kConfirmed.tr(),
                step4State: LocaleKeys.kInProgress.tr(),
                step5State: LocaleKeys.kPending.tr(),
              ),
              SizedBox(
                height: SizeData.s48,
              ),
              Text(
                LocaleKeys.kServicesYourParkingOffers.tr(),
                style: Styles.textStyleGray500M20,
              ),
              SizedBox(
                height: SizeData.s10,
              ),
              Text(
                LocaleKeys.kYouCanStillAddServicesLater.tr(),
                style: Styles.textStyleGrey300R14,
              ),
              SizedBox(
                height: SizeData.s32,
              ),

              GroupButton(
                controller: checkController,
                isRadio: false,
                enableDeselect: true,
                options: const GroupButtonOptions(
                  groupingType: GroupingType.column,
                ),
                buttonIndexedBuilder: (isSelected, index, context){
                  return Container(
                    padding: EdgeInsets.all(
                      SizeData.s16,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: SizeData.s4,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorData.purple3Color,
                      ),
                      borderRadius: BorderRadius.circular(
                        SizeData.s8,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              groupButtonIconList[index],
                              width: Unit(context).getWidthSize*0.085,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            Expanded(
                              child: Text(
                                groupButtonTitleList[index],
                                style: Styles.textStyleGray500R14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    groupButtonSelectedList[index] = 'yes';
                                  });
                                },
                                child: Container(
                                  height: Unit(context).getHeightSize*0.045,
                                  decoration: BoxDecoration(
                                    color: groupButtonSelectedList[index] == 'yes' ?
                                    ColorData.purple3Color :
                                    ColorData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonSelectedList[index] == 'yes' ?
                                      ColorData.secondaryColor :
                                      ColorData.gray100Color,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Transform.scale(
                                        scale: 1.2,
                                        child: Checkbox(
                                          shape: const CircleBorder(),
                                          value: groupButtonSelectedList[index] == 'yes',
                                          activeColor: ColorData.secondary1Color,
                                          side: BorderSide(
                                            width: SizeData.s1,
                                            color: ColorData.gray200Color,
                                          ),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              groupButtonSelectedList[index] = 'yes';
                                            });
                                          },
                                        ),
                                      ),
                                      Text(
                                        LocaleKeys.kYes.tr(),
                                        style: groupButtonSelectedList[index] == 'yes' ?
                                        Styles.textStyleSecondary1R14 :
                                        Styles.textStyleGray600R14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeData.s10,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    groupButtonSelectedList[index] = 'no';
                                  });
                                },
                                child: Container(
                                  height: Unit(context).getHeightSize*0.045,
                                  decoration: BoxDecoration(
                                    color: groupButtonSelectedList[index] == 'no' ?
                                    ColorData.purple3Color :
                                    ColorData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonSelectedList[index] == 'no' ?
                                      ColorData.secondaryColor :
                                      ColorData.gray100Color,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Transform.scale(
                                        scale: 1.2,
                                        child: Checkbox(
                                          shape: const CircleBorder(),
                                          value: groupButtonSelectedList[index] == 'no',
                                          activeColor: ColorData.secondary1Color,
                                          side: BorderSide(
                                            width: SizeData.s1,
                                            color: ColorData.gray200Color,
                                          ),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              groupButtonSelectedList[index] = 'no';
                                            });
                                          },
                                        ),
                                      ),
                                      Text(
                                        LocaleKeys.kNo.tr(),
                                        style: groupButtonSelectedList[index] == 'no' ?
                                        Styles.textStyleSecondary1R14 :
                                        Styles.textStyleGray600R14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                      ],
                    ),
                  );
                },
                onSelected: (_, index, selected) {
                },
                buttons: groupButtonTitleList,
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
                      GoRouter.of(context).push(AppProviderRouter.kTypeOfBookingView);
                    },
                    width: Unit(context).getWidthSize*0.48,
                    text: LocaleKeys.kNext.tr(),
                    arrowIcon: true,
                  ),
                ],
              ),
              if (!TypeOfParkingFlow.isBusiness) ...[
                SizedBox(
                  height: SizeData.s32,
                ),
                GestureDetector(
                  onTap: (){
                    buildSkipDialog(context: context);
                  },
                  child: Center(
                    child: Text(
                      LocaleKeys.kSkipThisStep.tr(),
                      style: Styles.textStyleBlue500M14,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
