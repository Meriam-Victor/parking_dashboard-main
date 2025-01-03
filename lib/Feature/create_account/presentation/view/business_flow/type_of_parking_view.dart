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

class TypeOfParkingView extends StatefulWidget {
  const TypeOfParkingView({super.key});

  @override
  State<TypeOfParkingView> createState() => _TypeOfParkingView();
}

class _TypeOfParkingView extends State<TypeOfParkingView> {

  bool indoor = false;
  bool outdoor = false;
  bool parkingBox = false;

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
                LocaleKeys.kParkingTypeAccepted.tr(),
                style: Styles.textStyleGray500M20,
              ),
              SizedBox(
                height: SizeData.s10,
              ),
              Text(
                LocaleKeys.kYouCanStillEditTheseDataLater.tr(),
                style: Styles.textStyleGrey300R14,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          indoor = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: SizeData.s16,
                          bottom: SizeData.s16,
                          left: SizeData.s16,
                        ),
                        decoration: BoxDecoration(
                          color: indoor ?
                          ColorData.blue2Color :
                          ColorData.whiteColor,
                          border: Border.all(
                            color: indoor ?
                            ColorData.blue9Color :
                            ColorData.gray100Color,
                          ),
                          borderRadius: BorderRadius.circular(
                            SizeData.s8,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorData.grayShadow4Color,
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AssetsProviderData.indoorIcon,
                                  width: Unit(context).getWidthSize*0.0853,
                                ),
                                Text(
                                  LocaleKeys.kIndoor.tr(),
                                  style: Styles.textStyleGray500R16,
                                ),
                              ],
                            ),
                            Checkbox(
                              shape: const CircleBorder(),
                              value: indoor,
                              activeColor: ColorData.blue500Color,
                              side: BorderSide(
                                width: SizeData.s1,
                                color: ColorData.gray200Color,
                              ),
                              onChanged: (bool? value) {
                                setState(() {
                                  indoor = !indoor;
                                });
                              },
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
                          outdoor = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: SizeData.s16,
                          bottom: SizeData.s16,
                          left: SizeData.s16,
                        ),
                        decoration: BoxDecoration(
                          color: outdoor ?
                          ColorData.blue2Color :
                          ColorData.whiteColor,
                          border: Border.all(
                            color: outdoor ?
                            ColorData.blue9Color :
                            ColorData.gray100Color,
                          ),
                          borderRadius: BorderRadius.circular(
                            SizeData.s8,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorData.grayShadow4Color,
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AssetsProviderData.outdoorIcon,
                                  width: Unit(context).getWidthSize*0.0853,
                                ),
                                Text(
                                  LocaleKeys.kOutdoor.tr(),
                                  style: Styles.textStyleGray500R16,
                                ),
                              ],
                            ),
                            Checkbox(
                              shape: const CircleBorder(),
                              value: outdoor,
                              activeColor: ColorData.blue500Color,
                              side: BorderSide(
                                width: SizeData.s1,
                                color: ColorData.gray200Color,
                              ),
                              onChanged: (bool? value) {
                                setState(() {
                                  outdoor = !outdoor;
                                });
                              },
                            ),
                    
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    parkingBox = true;
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: SizeData.s16,
                    bottom: SizeData.s16,
                    left: SizeData.s16,
                  ),
                  decoration: BoxDecoration(
                    color: parkingBox ?
                    ColorData.blue2Color :
                    ColorData.whiteColor,
                    border: Border.all(
                      color: indoor ?
                      ColorData.blue9Color :
                      ColorData.gray100Color,
                    ),
                    borderRadius: BorderRadius.circular(
                      SizeData.s8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ColorData.grayShadow4Color,
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AssetsProviderData.parkingBoxIcon,
                            width: Unit(context).getWidthSize*0.0853,
                          ),
                          Text(
                            LocaleKeys.kParkingBoxes.tr(),
                            style: Styles.textStyleGray500R16,
                          ),
                        ],
                      ),
                      Checkbox(
                        shape: const CircleBorder(),
                        value: parkingBox,
                        activeColor: ColorData.blue500Color,
                        side: BorderSide(
                          width: SizeData.s1,
                          color: ColorData.gray200Color,
                        ),
                        onChanged: (bool? value) {
                          setState(() {
                            parkingBox = !parkingBox;
                          });
                        },
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Text(
                LocaleKeys.kTotalNumberOfSlot.tr(),
                style: Styles.textStyleGray500M14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
              ),
              SizedBox(
                height: SizeData.s16,
              ),
              Text(
                LocaleKeys.kIndoorParkingVehicleCapacity.tr(),
                style: Styles.textStyleGray500M14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
              ),
              SizedBox(
                height: SizeData.s16,
              ),
              Text(
                LocaleKeys.kOutdoorParkingVehicleCapacity.tr(),
                style: Styles.textStyleGray500M14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
              ),
              SizedBox(
                height: SizeData.s16,
              ),

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
                      GoRouter.of(context).push(AppRouter.kTypeOfVehicleView);
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
