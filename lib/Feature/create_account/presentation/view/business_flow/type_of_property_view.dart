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
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/input_text_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/add_parking_view.dart';

class TypeOfPropertyView extends StatefulWidget {
  const TypeOfPropertyView({super.key});

  @override
  State<TypeOfPropertyView> createState() => _TypeOfPropertyView();
}

class _TypeOfPropertyView extends State<TypeOfPropertyView> {

  final List<String> propertyTypes = [
    TypeOfParkingFlow.isBusiness ? LocaleKeys.kHouse.tr() : LocaleKeys.kCourtyard.tr(),
    TypeOfParkingFlow.isBusiness ?  LocaleKeys.kHotel.tr() : LocaleKeys.kPrivateRoad.tr(),
    LocaleKeys.kLand.tr(),
    TypeOfParkingFlow.isBusiness ? LocaleKeys.kBuilding.tr(): LocaleKeys.kPlaceOfParking.tr(),
    TypeOfParkingFlow.isBusiness ? LocaleKeys.kCommercialCenter.tr() : LocaleKeys.kGarage.tr(),
  ];

  String? selectedPropertyType;
  String selectedValue = 'yes';
  bool isSingleLevel = true;

  bool showSecurityFeature = false;
  bool showParkingComposition = false;


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
                LocaleKeys.kTypeOfProperty.tr(),
                style: StylesProvider.textStyleGreyBlue1ColorM20,
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
                      ColorProviderData.blue3Color :
                      ColorProviderData.whiteColor,
                      selectedTileColor: ColorProviderData.blue3Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeData.s8,
                        ),
                        side: selectedPropertyType == type ?
                        BorderSide(
                          color: ColorProviderData.blue7Color,
                          width: SizeData.s1,
                        ) :
                        BorderSide(
                          color: ColorProviderData.greyBlue2Color,
                          width: SizeData.s1,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedPropertyType = type;
                          showSecurityFeature = type == "Land";
                          showParkingComposition = type == "Building";
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: SizeData.s32,
              ),

              if (showSecurityFeature) ...[
                Text(
                  LocaleKeys.kSecurityFeature.tr(),
                  style: StylesProvider.textStyleGreyBlue1ColorM16,
                ),
                SizedBox(
                  height: SizeData.s8,
                ),
                Text(
                  LocaleKeys.kDoesYourParkingHasEntryCodeAtTheFrontGate.tr(),
                  style: StylesProvider.textStyleGreyBlue8ColorR14,
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
                        width: Unit(context).getWidthSize*0.22,
                        decoration: BoxDecoration(
                          color: selectedValue == 'yes' ?
                          ColorProviderData.secondary1Color :
                          ColorProviderData.whiteColor,
                          border: Border.all(
                            color: selectedValue == 'yes' ?
                            ColorProviderData.secondary2Color :
                            ColorProviderData.greyBlue2Color,
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
                                activeColor: ColorProviderData.secondary4Color,
                                side: BorderSide(
                                  width: SizeData.s1,
                                  color: ColorProviderData.greyBlue9Color,
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
                              StylesProvider.textStylesProviderecondary4ColorR14 :
                              StylesProvider.textStyleGreyBlue8ColorR14,
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
                        width: Unit(context).getWidthSize*0.22,
                        decoration: BoxDecoration(
                          color: selectedValue == 'no' ?
                          ColorProviderData.secondary1Color :
                          ColorProviderData.whiteColor,
                          border: Border.all(
                            color: selectedValue == 'no' ?
                            ColorProviderData.secondary2Color :
                            ColorProviderData.greyBlue2Color,
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
                                activeColor: ColorProviderData.secondary4Color,
                                side: BorderSide(
                                  width: SizeData.s1,
                                  color: ColorProviderData.greyBlue9Color,
                                ),
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedValue = 'no';
                                  });
                                },
                              ),
                            ),
                            Text(
                              LocaleKeys.kNo.tr(),
                              style: selectedValue == 'no' ?
                              StylesProvider.textStylesProviderecondary4ColorR14 :
                              StylesProvider.textStyleGreyBlue8ColorR14,
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
                if(selectedValue == 'yes') ...[
                  Row(
                    children: [
                      Text(
                        LocaleKeys.kEnterCode.tr(),
                        style: StylesProvider.textStyleGreyBlue1ColorR14,
                      ),
                      SizedBox(
                        width: SizeData.s8,
                      ),
                      SvgPicture.asset(
                        AssetsProviderData.infoCircleBlue,
                        width: Unit(context).getWidthSize*0.053,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  InputTextProviderCustom(
                    controller: TextEditingController(),
                    hintText: LocaleKeys.kTypeHere.tr(),
                  ),
                ],
              ],
              if(showParkingComposition) ...[
                Text(
                  LocaleKeys.kYourParkingIsComposedOf.tr(),
                  style: StylesProvider.textStyleGreyBlue1ColorM16,
                ),
                SizedBox(
                  height: SizeData.s8,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSingleLevel = true;
                        });
                      },
                      child: Container(
                        width: Unit(context).getWidthSize*0.427,
                        decoration: BoxDecoration(
                          color: isSingleLevel ?
                          ColorProviderData.blue3Color :
                          ColorProviderData.whiteColor,
                          border: Border.all(
                            color: isSingleLevel ?
                            ColorProviderData.blue5Color :
                            ColorProviderData.greyBlue2Color,
                          ),
                          borderRadius: BorderRadius.circular(
                            SizeData.s8,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            SizeData.s10,
                          ),
                          child: Center(
                            child: Text(
                              LocaleKeys.kSingleLevelGarage.tr(),
                              style: isSingleLevel ?
                              StylesProvider.textStyleBlue2ColorR12 :
                              StylesProvider.textStyleGreyBlue8ColorR12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSingleLevel = false;
                        });
                      },
                      child: Container(
                        width: Unit(context).getWidthSize*0.427,
                        decoration: BoxDecoration(
                          color: !isSingleLevel ?
                          ColorProviderData.blue3Color :
                          ColorProviderData.whiteColor,
                          border: Border.all(
                            color: !isSingleLevel ?
                            ColorProviderData.blue5Color :
                            ColorProviderData.greyBlue2Color,
                          ),
                          borderRadius: BorderRadius.circular(
                            SizeData.s8,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            SizeData.s10,
                          ),
                          child: Center(
                            child: Text(
                              LocaleKeys.kMultiLevelGarage.tr(),
                              style: !isSingleLevel ?
                              StylesProvider.textStyleBlue2ColorR12 :
                              StylesProvider.textStyleGreyBlue8ColorR12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeData.s16,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Unit(context).getWidthSize*0.427,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.kFloorNumber.tr(),
                            style: StylesProvider.textStyleGreyBlue1ColorR14,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          InputTextProviderCustom(
                            controller: TextEditingController(),
                            hintText: LocaleKeys.kPlusOne.tr(),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    if(!isSingleLevel)
                      SizedBox(
                        width: Unit(context).getWidthSize*0.427,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.kFloorNumber.tr(),
                              style: StylesProvider.textStyleGreyBlue1ColorR14,
                            ),
                            SizedBox(
                              height: SizeData.s8,
                            ),
                            InputTextProviderCustom(
                              controller: TextEditingController(),
                              hintText: LocaleKeys.kPlusTwo.tr(),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: SizeData.s16,
                ),
                if(!isSingleLevel)
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AssetsProviderData.addSquareIcon,
                          width: Unit(context).getWidthSize*0.064,
                        ),
                        SizedBox(
                          width: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kAddMoreFloor.tr(),
                          style: StylesProvider.textStyleBlue1ColorR14,
                        ),
                      ],
                    ),
                  )
              ],

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
                      GoRouter.of(context).push(AppProviderRouter.kWorkingHoursView);
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
