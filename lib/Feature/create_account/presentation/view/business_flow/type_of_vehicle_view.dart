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
    AssetsData.realSedanIcon,
    AssetsData.realVanIcon,
    AssetsData.realCarWithTrailerIcon,
    AssetsData.realCampingCarIcon,
    AssetsData.realMotorcycleIcon,
    AssetsData.realBusIcon,
    AssetsData.realTruckIcon,
    AssetsData.realCarTrailerIcon,
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
                style: StylesProvider.textStyleGreyBlue1ColorM20,
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
                        color: ColorProviderData.greyBlue2Color,
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
                              style: StylesProvider.textStyleGreyBlue1ColorR14,
                            ),
                            const Spacer(),
                            Checkbox(
                              value: groupButtonCheckBoxList[index],
                              activeColor: ColorProviderData.blue1Color,
                              side: BorderSide(
                                width: SizeData.s1,
                                color: ColorProviderData.greyBlue9Color,
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
                                style: StylesProvider.textStyleGreyBlue1ColorR12,
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
                                          ColorProviderData.primary4Color :
                                          ColorProviderData.primary8Color,
                                          width: SizeData.s1,
                                        ),
                                        color: ColorProviderData.whiteColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            LocaleKeys.kHeight.tr(),
                                            style: groupButtonIsUnlimitedList[index] ?
                                            StylesProvider.textStylePrimary4ColorR10 :
                                            StylesProvider.textStylePrimaryColorR10,
                                          ),
                                          VerticalDivider(
                                            color: groupButtonIsUnlimitedList[index] ?
                                            ColorProviderData.primary4Color :
                                            ColorProviderData.primaryColor,
                                            thickness: 1,
                                            indent: 8,
                                            endIndent: 8,
                                          ),
                                         //convert into text field
                                          Text(
                                            '${groupButtonMaxHeightList[index].toStringAsFixed(2)} M',
                                            style: groupButtonIsUnlimitedList[index] ?
                                            StylesProvider.textStylePrimary4ColorR10 :
                                            StylesProvider.textStylePrimaryColorR10,
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
                                          ColorProviderData.primary4Color :
                                          ColorProviderData.primary8Color,
                                          width: SizeData.s1,
                                        ),
                                        color: groupButtonIsUnlimitedList[index] ?
                                        ColorProviderData.primary4Color :
                                        ColorProviderData.whiteColor,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.all_inclusive,
                                            color: groupButtonIsUnlimitedList[index] ?
                                            ColorProviderData.primaryColor :
                                            ColorProviderData.primary4Color,
                                            size: Unit(context).getWidthSize*0.043,
                                            //SizeData.s16,
                                          ),
                                          SizedBox(
                                              width: SizeData.s4,
                                          ),
                                          Text(
                                            LocaleKeys.kUnlimited.tr(),
                                            style: groupButtonIsUnlimitedList[index] ?
                                                StylesProvider.textStylePrimaryColorR10 :
                                                StylesProvider.textStylePrimary4ColorR10,
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
                    color: ColorProviderData.whiteColor,
                    colorFont: ColorProviderData.primary2Color,
                    borderColor: ColorProviderData.primary2Color,
                    borderWidth: 1.0,
                  ),
                  const Spacer(),
                  MainButtonProviderCustom(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kTermsAndConditionsView);
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
