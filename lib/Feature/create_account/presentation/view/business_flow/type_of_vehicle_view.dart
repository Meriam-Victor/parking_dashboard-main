import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';

class TypeOfVehicleView extends StatefulWidget {
  const TypeOfVehicleView({super.key});

  @override
  State<TypeOfVehicleView> createState() => _TypeOfVehicleView();
}

class _TypeOfVehicleView extends State<TypeOfVehicleView> {

  List<bool> groupButtonIsUnlimitedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<double> groupButtonMaxHeightList = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  List<bool> groupButtonCheckBoxList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> groupButtonImageList = [
    AssetsProviderData.realSedanIcon,
    AssetsProviderData.realVanIcon,
    AssetsProviderData.realCarWithTrailerIcon,
    AssetsProviderData.realCampingCarIcon,
    AssetsProviderData.realMotorcycleIcon,
    AssetsProviderData.realBusIcon,
    AssetsProviderData.realTruckIcon,
    AssetsProviderData.realCarTrailerIcon,
  ];

  List<String> groupButtonTitleList = [
    LocaleKeys.kMotorcycle.tr(),
    LocaleKeys.kSedan.tr(),
    LocaleKeys.kVan.tr(),
    LocaleKeys.kCarWithTrailer.tr(),
    LocaleKeys.kCampingCar.tr(),
    LocaleKeys.kBus.tr(),
    LocaleKeys.kTruck.tr(),
    LocaleKeys.kCarTrailer.tr(),
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
                step2State: LocaleKeys.kInProgress.tr(),
                step3State: LocaleKeys.kPending.tr(),
                step4State: LocaleKeys.kPending.tr(),
                step5State: LocaleKeys.kPending.tr(),
              ),

              SizedBox(
                height: SizeData.s48,
              ),
              Text(
                LocaleKeys.kAcceptedVehiclesType.tr(),
                style: Styles.textStyleGray500M20,
              ),
              SizedBox(
                height: SizeData.s10,
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
                    padding: EdgeInsets.symmetric(
                      vertical: SizeData.s8,
                      horizontal: SizeData.s16,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: SizeData.s4,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorData.gray100Color,
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
                            Image.asset(
                              groupButtonImageList[index],
                              width: Unit(context).getWidthSize*0.141,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: SizeData.s16,
                            ),
                            Text(
                              groupButtonTitleList[index],
                              style: Styles.textStyleGray500R14,
                            ),
                            const Spacer(),
                            Checkbox(
                              value: groupButtonCheckBoxList[index],
                              activeColor: ColorData.blue500Color,
                              side: BorderSide(
                                width: SizeData.s1,
                                color: ColorData.gray200Color,
                              ),
                              onChanged: (bool? value) {
                                setState(() {
                                  groupButtonCheckBoxList[index] = !groupButtonCheckBoxList[index];
                                });
                              },
                            ),
                          ],
                        ),
                        if(groupButtonCheckBoxList[index])
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.kMaxHeightLimit.tr(),
                                style: Styles.textStyleGray500R12,
                              ),
                              SizedBox(
                                height: SizeData.s8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        groupButtonIsUnlimitedList[index] = false;
                                      });
                                    },
                                    child: Container(
                                      width: Unit(context).getWidthSize*0.52,
                                      height: Unit(context).getHeightSize*0.049,
                                      padding: EdgeInsets.symmetric(
                                        vertical: SizeData.s4,
                                        horizontal: SizeData.s8,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          SizeData.s8,
                                        ),
                                        border: Border.all(
                                          color: groupButtonIsUnlimitedList[index] ?
                                          ColorData.purple2Color :
                                          ColorData.primaryP6Color,
                                          width: SizeData.s1,
                                        ),
                                        color: ColorData.whiteColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            LocaleKeys.kHeight.tr(),
                                            style: groupButtonIsUnlimitedList[index] ?
                                            Styles.textStylePurple2R10 :
                                            Styles.textStylePrimaryPR10,
                                          ),
                                          VerticalDivider(
                                            color: groupButtonIsUnlimitedList[index] ?
                                            ColorData.purple2Color :
                                            ColorData.primaryPColor,
                                            thickness: 1,
                                            indent: 8,
                                            endIndent: 8,
                                          ),
                                         //convert into text field
                                          Text(
                                            '${groupButtonMaxHeightList[index].toStringAsFixed(2)} M',
                                            style: groupButtonIsUnlimitedList[index] ?
                                            Styles.textStylePurple2R10 :
                                            Styles.textStylePrimaryPR10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        groupButtonIsUnlimitedList[index] = true;
                                      });
                                    },
                                    child: Container(
                                      width: Unit(context).getWidthSize*0.25,
                                      height: Unit(context).getHeightSize*0.049,
                                      padding: EdgeInsets.symmetric(
                                        vertical: SizeData.s4,
                                        horizontal: SizeData.s8,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          SizeData.s8,
                                        ),
                                        border: Border.all(
                                          color: groupButtonIsUnlimitedList[index] ?
                                          ColorData.purple2Color :
                                          ColorData.primaryP6Color,
                                          width: SizeData.s1,
                                        ),
                                        color: groupButtonIsUnlimitedList[index] ?
                                        ColorData.purple2Color :
                                        ColorData.whiteColor,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.all_inclusive,
                                            color: groupButtonIsUnlimitedList[index] ?
                                            ColorData.primaryPColor :
                                            ColorData.purple2Color,
                                            size: Unit(context).getWidthSize*0.043,
                                            //SizeData.s16,
                                          ),
                                          SizedBox(
                                              width: SizeData.s4,
                                          ),
                                          Text(
                                            LocaleKeys.kUnlimited.tr(),
                                            style: groupButtonIsUnlimitedList[index] ?
                                                Styles.textStylePrimaryPR10 :
                                                Styles.textStylePurple2R10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        SizedBox(
                          width: SizeData.s16,
                        ),
                      ],
                    ),
                  );
                },
                onSelected: (_, index, selected) {
                },
                buttons: groupButtonImageList,
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
                      GoRouter.of(context).push(AppProviderRouter.kTermsAndConditionsView);
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
