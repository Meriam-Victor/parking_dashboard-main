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
    AssetsData.shuttleService,
    AssetsData.carWash,
    AssetsData.electricCharging,
    AssetsData.vehicleCovers,
    AssetsData.shuttleService,
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
                style: StylesProvider.textStyleGreyBlue1ColorM20,
              ),
              SizedBox(
                height: SizeData.s10,
              ),
              Text(
                LocaleKeys.kYouCanStillAddServicesLater.tr(),
                style: StylesProvider.textStyleGreyBlue3ColorR14,
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
                        color: ColorProviderData.secondary1Color,
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
                              style: StylesProvider.textStyleGreyBlue1ColorR14,
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
                                    ColorProviderData.secondary1Color :
                                    ColorProviderData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonSelectedList[index] == 'yes' ?
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
                                          value: groupButtonSelectedList[index] == 'yes',
                                          activeColor: ColorProviderData.secondary4Color,
                                          side: BorderSide(
                                            width: SizeData.s1,
                                            color: ColorProviderData.greyBlue9Color,
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
                                        StylesProvider.textStylesProviderecondary4ColorR14 :
                                        StylesProvider.textStyleGreyBlue8ColorR14,
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
                                    ColorProviderData.secondary1Color :
                                    ColorProviderData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonSelectedList[index] == 'no' ?
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
                                          value: groupButtonSelectedList[index] == 'no',
                                          activeColor: ColorProviderData.secondary4Color,
                                          side: BorderSide(
                                            width: SizeData.s1,
                                            color: ColorProviderData.greyBlue9Color,
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
                                        StylesProvider.textStylesProviderecondary4ColorR14 :
                                        StylesProvider.textStyleGreyBlue8ColorR14,
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
                            color: ColorProviderData.greyBlue7Color,
                          ),
                          if (groupButtonTitleList[index] == LocaleKeys.kShuttleService.tr()) ...[
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Text(
                              LocaleKeys.kShuttleDetails.tr(),
                              style: StylesProvider.textStyleGreyBlue1ColorM16,
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            Text(
                              LocaleKeys.kYouWillBeAbleToAddMoreDetailsAboutYourShuttleLater.tr(),
                              style: StylesProvider.textStyleGreyBlue8ColorR12,
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                          ],
                          Text(
                            LocaleKeys.kPricing.tr(),
                            style: StylesProvider.textStyleGreyBlue1ColorM16,
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
                                    ColorProviderData.blue3Color :
                                    ColorProviderData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonPaidList[index] == 'free' ?
                                      ColorProviderData.blue5Color :
                                      ColorProviderData.greyBlue2Color,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      LocaleKeys.kForFree.tr(),
                                      style: groupButtonPaidList[index] == 'free' ?
                                      StylesProvider.textStyleBlue2ColorR12 :
                                      StylesProvider.textStyleGreyBlue8ColorR12,
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
                                    ColorProviderData.blue3Color :
                                    ColorProviderData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonPaidList[index] == 'paid' ?
                                      ColorProviderData.blue5Color :
                                      ColorProviderData.greyBlue2Color,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      LocaleKeys.kPaid.tr(),
                                      style: groupButtonPaidList[index] == 'paid' ?
                                      StylesProvider.textStyleBlue2ColorR12 :
                                      StylesProvider.textStyleGreyBlue8ColorR12,
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
                              style: StylesProvider.textStyleGreyBlue1ColorR14,
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            InputTextProviderCustom(
                              controller: TextEditingController(),
                              hintText: LocaleKeys.kTypeHere.tr(),
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            DropDownFieldProviderCustom(
                              value: priceBasedOn,
                              hintText: LocaleKeys.kSelectHere.tr(),
                              icon: SvgPicture.asset(
                                AssetsData.arrowDown,
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
                              style: StylesProvider.textStyleGreyBlue1ColorM16,
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
                                      color: ColorProviderData.greyBlue2Color
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    SizeData.s8,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsData.clockIcon,
                                    ),
                                    SizedBox(
                                      width: SizeData.s4,
                                    ),
                                    Text(
                                      startTime != null
                                          ? startTime!.format(context)
                                          : LocaleKeys.kFromTime.tr(),
                                      style: StylesProvider.textStyleGreyBlue1ColorR12,
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      AssetsData.arrowDown,
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
                                      color: ColorProviderData.greyBlue2Color
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsData.clockIcon,
                                    ),
                                    SizedBox(
                                      width: SizeData.s4,
                                    ),
                                    Text(
                                      endTime != null
                                          ? endTime!.format(context)
                                          : LocaleKeys.kToTime.tr(),
                                      style: StylesProvider.textStyleGreyBlue1ColorR12,
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(
                                      AssetsData.arrowDown,
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
                                  ColorProviderData.secondary1Color :
                                  ColorProviderData.greyBlue7Color,
                                  borderRadius: BorderRadius.circular(
                                    SizeData.s10,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      is24Hr ?
                                      AssetsData.clockIconPink :
                                      AssetsData.clockIcon,
                                    ),
                                    SizedBox(
                                      width: SizeData.s4,
                                    ),
                                    Text(
                                      LocaleKeys.k24Hrs.tr(),
                                      style: is24Hr ?
                                      StylesProvider.textStylesProviderecondary4ColorM14 :
                                      StylesProvider.textStyleGreyBlue8ColorR14,
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
                    color: ColorProviderData.whiteColor,
                    colorFont: ColorProviderData.primary2Color,
                    borderColor: ColorProviderData.primary2Color,
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
                      style: StylesProvider.textStyleBlue1ColorM14,
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
