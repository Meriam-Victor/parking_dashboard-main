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

class TypeOfPropertyView extends StatefulWidget {
  const TypeOfPropertyView({super.key});

  @override
  State<TypeOfPropertyView> createState() => _TypeOfPropertyView();
}

class _TypeOfPropertyView extends State<TypeOfPropertyView> {

  final List<String> propertyTypes = [
    "House",
    "Hotel",
    "Land",
    "Building",
    "Commercial Center",
  ];

  String? selectedPropertyType;

  bool showSecurityFeature = false;

  String selectedValue = 'yes';


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
                LocaleKeys.kTypeOfProperty.tr(),
                style: Styles.textStyleGreyBlue1ColorM20,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Column(
                children: propertyTypes.map((type) {
                  return Padding(
                    padding: EdgeInsets.all(
                      SizeData.s10,
                    ),
                    child: ListTile(
                      title: Text(type),
                      tileColor: selectedPropertyType == type ?
                      ColorData.blue3Color :
                      ColorData.whiteColor,
                      selectedTileColor: ColorData.blue3Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeData.s8,
                        ),
                        side: selectedPropertyType == type ?
                        BorderSide(
                          color: ColorData.blue7Color,
                          width: SizeData.s1,
                        ) :
                        BorderSide(
                          color: ColorData.greyBlue2Color,
                          width: SizeData.s1,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedPropertyType = type;
                          showSecurityFeature = type == "Land";
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: SizeData.s32,
              ),

              if (showSecurityFeature)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.kSecurityFeature.tr(),
                      style: Styles.textStyleGreyBlue1ColorM16,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    Text(
                      LocaleKeys.kDoesYourParkingHasEntryCodeAtTheFrontGate.tr(),
                      style: Styles.textStyleGreyBlue8ColorR14,
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedValue = 'yes';
                            });
                          },
                          child: Container(
                            width: Unit(context).getWidthSize*0.2,
                            decoration: BoxDecoration(
                              color: selectedValue == 'yes' ?
                              ColorData.secondary1Color :
                              ColorData.whiteColor,
                              border: Border.all(
                                color: selectedValue == 'yes' ?
                                ColorData.secondary2Color :
                                ColorData.greyBlue2Color,
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
                                    value: selectedValue == 'yes',
                                    activeColor: ColorData.secondary4Color,
                                    side: BorderSide(
                                      width: SizeData.s1,
                                      color: ColorData.greyBlue9Color,
                                    ),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedValue = 'yes';
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  LocaleKeys.kYes.tr(),
                                  style: selectedValue == 'yes' ?
                                  Styles.textStyleSecondary4ColorR14 :
                                  Styles.textStyleGreyBlue8ColorR14,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeData.s10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedValue = 'no';
                            });
                          },
                          child: Container(
                            width: Unit(context).getWidthSize*0.2,
                            decoration: BoxDecoration(
                              color: selectedValue == 'no' ?
                              ColorData.secondary1Color :
                              ColorData.whiteColor,
                              border: Border.all(
                                color: selectedValue == 'no' ?
                                ColorData.secondary2Color :
                                ColorData.greyBlue2Color,
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
                                    value: selectedValue == 'no',
                                    activeColor: ColorData.secondary4Color,
                                    side: BorderSide(
                                      width: SizeData.s1,
                                      color: ColorData.greyBlue9Color,
                                    ),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedValue = 'no';
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  LocaleKeys.kYes.tr(),
                                  style: selectedValue == 'no' ?
                                  Styles.textStyleSecondary4ColorR14 :
                                  Styles.textStyleGreyBlue8ColorR14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeData.s24,
                    ),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.kEnterCode.tr(),
                          style: Styles.textStyleGreyBlue1ColorR14,
                        ),
                        SizedBox(
                          width: SizeData.s8,
                        ),
                        SvgPicture.asset(
                          AssetsData.infoCircleBlue,
                          width: Unit(context).getWidthSize*0.053,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextCustom(
                      controller: TextEditingController(),
                      hintText: LocaleKeys.kTypeHere.tr(),
                    ),
                  ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
