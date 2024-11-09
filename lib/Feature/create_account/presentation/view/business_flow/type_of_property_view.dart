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
import 'package:parking_dashboard/Core/widget/provider_app/buttons/out_line_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/input_text_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
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
                LocaleKeys.kTypeOfProperty.tr(),
                style: Styles.textStyleGray500M20,
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
                      ColorData.blue2Color :
                      ColorData.whiteColor,
                      selectedTileColor: ColorData.blue2Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeData.s8,
                        ),
                        side: selectedPropertyType == type ?
                        BorderSide(
                          color: ColorData.blue10Color,
                          width: SizeData.s1,
                        ) :
                        BorderSide(
                          color: ColorData.gray100Color,
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
                  style: Styles.textStyleGray500M16,
                ),
                SizedBox(
                  height: SizeData.s8,
                ),
                Text(
                  LocaleKeys.kDoesYourParkingHasEntryCodeAtTheFrontGate.tr(),
                  style: Styles.textStyleGray600R14,
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
                          ColorData.purple3Color :
                          ColorData.whiteColor,
                          border: Border.all(
                            color: selectedValue == 'yes' ?
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
                                value: selectedValue == 'yes',
                                activeColor: ColorData.secondary1Color,
                                side: BorderSide(
                                  width: SizeData.s1,
                                  color: ColorData.gray200Color,
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
                              Styles.textStyleSecondary1R14 :
                              Styles.textStyleGray600R14,
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
                          ColorData.purple3Color :
                          ColorData.whiteColor,
                          border: Border.all(
                            color: selectedValue == 'no' ?
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
                                value: selectedValue == 'no',
                                activeColor: ColorData.secondary1Color,
                                side: BorderSide(
                                  width: SizeData.s1,
                                  color: ColorData.gray200Color,
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
                              Styles.textStyleSecondary1R14 :
                              Styles.textStyleGray600R14,
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
                        style: Styles.textStyleGray500R14,
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
                  InputTextCustom(
                    controller: TextEditingController(),
                    hintText: LocaleKeys.kTypeHere.tr(),
                  ),
                ],
              ],
              if(showParkingComposition) ...[
                Text(
                  LocaleKeys.kYourParkingIsComposedOf.tr(),
                  style: Styles.textStyleGray500M16,
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
                          ColorData.blue2Color :
                          ColorData.whiteColor,
                          border: Border.all(
                            color: isSingleLevel ?
                            ColorData.blue9Color :
                            ColorData.gray100Color,
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
                              Styles.textStyleBlue7R12 :
                              Styles.textStyleGray400R12,
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
                          ColorData.blue2Color :
                          ColorData.whiteColor,
                          border: Border.all(
                            color: !isSingleLevel ?
                            ColorData.blue9Color :
                            ColorData.gray100Color,
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
                              Styles.textStyleBlue7R12 :
                              Styles.textStyleGray400R12,
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
                            style: Styles.textStyleGray500R14,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          InputTextCustom(
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
                              style: Styles.textStyleGray500R14,
                            ),
                            SizedBox(
                              height: SizeData.s8,
                            ),
                            InputTextCustom(
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
                          style: Styles.textStyleBlue500R14,
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
                  OutLineButtonCustom(
                    onTap: (){},
                    isProvider: true,
                    text: LocaleKeys.kSaveForLater.tr(),
                    color: ColorData.whiteColor,
                  ),
                  const Spacer(),
                  MainButtonCustom(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kWorkingHoursView);
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
