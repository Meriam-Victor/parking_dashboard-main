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
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/drop_down_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/input_text_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/add_parking_view.dart';

class OfferedServicesFirstView extends StatefulWidget {
  const OfferedServicesFirstView({super.key});

  @override
  State<OfferedServicesFirstView> createState() => _OfferedServicesFirstView();
}

class _OfferedServicesFirstView extends State<OfferedServicesFirstView> {

  List<String> groupButtonSelectedList = [
    'no',
    'no',
    'no',
    'no',
    'no',
  ];

  List<String> groupButtonPaidList = [
    'free',
    'free',
    'free',
    'free',
    'free',
  ];

  List<String> groupButtonIconList = [
    AssetsProviderData.shuttleService,
    AssetsProviderData.carWash,
    AssetsProviderData.electricCharging,
    AssetsProviderData.vehicleCovers,
    AssetsProviderData.shuttleService,
  ];

  List<String> groupButtonTitleList = [
    LocaleKeys.kShuttleService.tr(),
    LocaleKeys.kCarWash.tr(),
    LocaleKeys.kElectricCarCharging.tr(),
    LocaleKeys.kVehicleCovers.tr(),
    LocaleKeys.kVehicleRevision.tr(),
  ];

  GroupButtonController checkController = GroupButtonController();

  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool is24Hr = true;

  Future<void> selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          startTime = pickedTime;
          is24Hr = false;
        } else {
          endTime = pickedTime;
          is24Hr = false;

        }
      });
    }
  }

  String? priceBasedOn ;

  List<String> itemsList = [
    LocaleKeys.kRoundTrip.tr(),
    LocaleKeys.kTransferOneWay.tr(),
    LocaleKeys.kPerPassenger.tr(),
  ];

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
                            Text(
                              groupButtonTitleList[index],
                              style: Styles.textStyleGray500R14,
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
                        if (groupButtonSelectedList[index] == 'yes') ...[
                          Divider(
                            thickness: 1.0,
                            color: ColorData.white3Color,
                          ),
                          if (groupButtonTitleList[index] == LocaleKeys.kShuttleService.tr()) ...[
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Text(
                              LocaleKeys.kShuttleDetails.tr(),
                              style: Styles.textStyleGray500M16,
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            Text(
                              LocaleKeys.kYouWillBeAbleToAddMoreDetailsAboutYourShuttleLater.tr(),
                              style: Styles.textStyleGray400R12,
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                          ],
                          Text(
                            LocaleKeys.kPricing.tr(),
                            style: Styles.textStyleGray500M16,
                          ),
                          SizedBox(
                            height: SizeData.s10,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    groupButtonPaidList[index] = 'free';
                                  });
                                },
                                child: Container(
                                  width: Unit(context).getWidthSize*0.27,
                                  height: Unit(context).getHeightSize*0.049,
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeData.s8,
                                    horizontal: SizeData.s16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: groupButtonPaidList[index] == 'free' ?
                                    ColorData.blue2Color :
                                    ColorData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonPaidList[index] == 'free' ?
                                      ColorData.blue9Color :
                                      ColorData.gray100Color,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      LocaleKeys.kForFree.tr(),
                                      style: groupButtonPaidList[index] == 'free' ?
                                      Styles.textStyleBlue7R12 :
                                      Styles.textStyleGray400R12,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeData.s4,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    groupButtonPaidList[index] = 'paid';
                                  });
                                },
                                child: Container(
                                  width: Unit(context).getWidthSize*0.27,
                                  height: Unit(context).getHeightSize*0.049,
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeData.s8,
                                    horizontal: SizeData.s16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: groupButtonPaidList[index] == 'paid' ?
                                    ColorData.blue2Color :
                                    ColorData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonPaidList[index] == 'paid' ?
                                      ColorData.blue9Color :
                                      ColorData.gray100Color,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      LocaleKeys.kPaid.tr(),
                                      style: groupButtonPaidList[index] == 'paid' ?
                                      Styles.textStyleBlue7R12 :
                                      Styles.textStyleGray400R12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (groupButtonPaidList[index] == 'paid') ...[
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            Text(
                              LocaleKeys.kSetPrice.tr(),
                              style: Styles.textStyleGray500R14,
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            InputTextProviderCustom(
                              controller: TextEditingController(),
                              hintText: LocaleKeys.kTypeHere.tr(),
                              suffixIcon: Icon(
                                Icons.euro_outlined,
                                color: ColorData.gray300Color,
                                size: SizeData.s16,
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            DropDownFieldProviderCustom(
                              value: priceBasedOn,
                              hintText: LocaleKeys.kSelectHere.tr(),
                              icon: SvgPicture.asset(
                                AssetsProviderData.arrowDown,
                              ),
                              items: itemsList.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                priceBasedOn = newValue.toString();
                              },
                            ),
                          ],
                          if (groupButtonTitleList[index] == LocaleKeys.kShuttleService.tr()) ...[
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Text(
                              LocaleKeys.kShuttleHours.tr(),
                              style: Styles.textStyleGray500M16,
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            GestureDetector(
                              onTap: () => selectTime(context, true),
                              child: Container(
                                padding: EdgeInsets.all(
                                  SizeData.s10,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorData.gray100Color
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    SizeData.s8,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsProviderData.clockIcon,
                                    ),
                                    SizedBox(
                                      width: SizeData.s4,
                                    ),
                                    Text(
                                      startTime != null
                                          ? startTime!.format(context)
                                          : LocaleKeys.kFromTime.tr(),
                                      style: Styles.textStyleGray500R12,
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      AssetsProviderData.arrowDown,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            GestureDetector(
                              onTap: () => selectTime(context, false),
                              child: Container(
                                //width: Unit(context).getWidthSize*0.4,
                                padding: EdgeInsets.all(
                                  SizeData.s10,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorData.gray100Color
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsProviderData.clockIcon,
                                    ),
                                    SizedBox(
                                      width: SizeData.s4,
                                    ),
                                    Text(
                                      endTime != null
                                          ? endTime!.format(context)
                                          : LocaleKeys.kToTime.tr(),
                                      style: Styles.textStyleGray500R12,
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      AssetsProviderData.arrowDown,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                LocaleKeys.kOr.tr(),
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  is24Hr = !is24Hr;
                                  if (is24Hr) {
                                    startTime = null;
                                    endTime = null;
                                  }
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height: Unit(context).getHeightSize*0.059,
                                padding: EdgeInsets.all(
                                  SizeData.s15,
                                ),
                                decoration: BoxDecoration(
                                  color: is24Hr ?
                                  ColorData.purple3Color :
                                  ColorData.white3Color,
                                  borderRadius: BorderRadius.circular(
                                    SizeData.s10,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      is24Hr ?
                                      AssetsProviderData.clockIconPink :
                                      AssetsProviderData.clockIcon,
                                    ),
                                    SizedBox(
                                      width: SizeData.s4,
                                    ),
                                    Text(
                                      LocaleKeys.k24Hrs.tr(),
                                      style: is24Hr ?
                                      Styles.textStyleSecondary1M14 :
                                      Styles.textStyleGray600R14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                          ],
                        ],

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
                      GoRouter.of(context).push(AppRouter.kOfferedServicesSecondView);
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
                    GoRouter.of(context).push(AppRouter.kOfferedServicesSecondView);
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
