import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/add_parking_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/functions/all_set_final_dialog.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/input_text_custom.dart';

class TypeOfBookingView extends StatefulWidget {
  const TypeOfBookingView({super.key});

  @override
  State<TypeOfBookingView> createState() => _TypeOfBookingView();
}

class _TypeOfBookingView extends State<TypeOfBookingView> with SingleTickerProviderStateMixin{

  List<bool> groupButtonCheckBoxList = [
    false,
    false,
    false,
    false,
  ];

  List<String> groupButtonTitleList = [
    LocaleKeys.kHourly.tr(),
    LocaleKeys.kDaily.tr(),
    LocaleKeys.kWeekly.tr(),
    LocaleKeys.kMonthly.tr(),
  ];

  GroupButtonController checkController = GroupButtonController();

  int currentIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }


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
                step4State: LocaleKeys.kConfirmed.tr(),
                step5State: LocaleKeys.kInProgress.tr(),
              ),
              SizedBox(
                height: SizeData.s48,
              ),
              Text(
                LocaleKeys.kWhatTypeOfBookingDoYouAccept.tr(),
                style: Styles.textStyleGray500M20,
              ),
              SizedBox(
                height: SizeData.s10,
              ),
              Text(
                LocaleKeys.kYouCanSelectMoreThanOneOption.tr(),
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
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        groupButtonCheckBoxList[index] = true;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: Unit(context).getHeightSize*0.064,
                      padding: EdgeInsets.only(
                        top: SizeData.s16,
                        bottom: SizeData.s16,
                        left: SizeData.s16,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: SizeData.s4,
                      ),
                      decoration: BoxDecoration(
                        color: groupButtonCheckBoxList[index] ?
                        ColorData.blue2Color :
                        ColorData.whiteColor,
                        border: Border.all(
                          color: groupButtonCheckBoxList[index] ?
                          ColorData.blue9Color :
                          ColorData.white3Color,
                        ),
                        borderRadius: BorderRadius.circular(
                          SizeData.s8,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            groupButtonTitleList[index],
                            style: Styles.textStyleGray500R14,
                          ),
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
                    ),
                  );
                },
                onSelected: (_, index, selected) {
                },
                buttons: groupButtonTitleList,
              ),
              if (!TypeOfParkingFlow.isBusiness) ...[
                if (groupButtonCheckBoxList[0]) ...[
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Text(
                    LocaleKeys.kPricePerHour.tr(),
                    style: Styles.textStyleGray500R14,
                  ),
                  SizedBox(
                    height: SizeData.s8,
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
                ],
                if (groupButtonCheckBoxList[1]) ...[
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Text(
                    LocaleKeys.kPricePerDay.tr(),
                    style: Styles.textStyleGray500R14,
                  ),
                  SizedBox(
                    height: SizeData.s8,
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
                ],
                if (groupButtonCheckBoxList[2]) ...[
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Text(
                    LocaleKeys.kPricePerWeek.tr(),
                    style: Styles.textStyleGray500R14,
                  ),
                  SizedBox(
                    height: SizeData.s8,
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
                ],
                if (groupButtonCheckBoxList[3]) ...[
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Text(
                    LocaleKeys.kPricePerMonth.tr(),
                    style: Styles.textStyleGray500R14,
                  ),
                  SizedBox(
                    height: SizeData.s8,
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
                ],
              ],

              if (TypeOfParkingFlow.isBusiness && (groupButtonCheckBoxList[0] || groupButtonCheckBoxList[1] || groupButtonCheckBoxList[2] || groupButtonCheckBoxList[3] )) ...[
                Container(
                  padding: EdgeInsets.all(
                    SizeData.s16,
                  ),
                  decoration: BoxDecoration(
                    color: ColorData.whiteColor,
                    borderRadius: BorderRadius.circular(
                      SizeData.s16,
                    ),
                    border: Border.all(
                      color: ColorData.white3Color,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                          SizeData.s8,
                        ),
                        decoration: BoxDecoration(
                          color: ColorData.whiteColor,
                          borderRadius: BorderRadius.circular(
                              SizeData.s12,
                          ),
                          border: Border.all(
                            color: ColorData.white3Color,
                          ),
                        ),
                        child: Column(
                          children: [
                            TabBar(
                              controller: tabController,
                              onTap: (val){
                                setState(() {
                                  currentIndex = val;
                                });
                              },
                              isScrollable: true,
                              dividerColor: Colors.transparent,
                              indicatorColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              labelStyle: Styles.textStyleSecondary1R12,
                              unselectedLabelStyle: Styles.textStyleGray500R12,
                              tabs: [
                                Tab(
                                  child: Center(
                                    child: Text(
                                      LocaleKeys.kHourly.tr(),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Center(
                                    child: Text(
                                      LocaleKeys.kDaily.tr(),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Center(
                                    child: Text(
                                      LocaleKeys.kWeekly.tr(),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Center(
                                    child: Text(
                                      LocaleKeys.kMonthly.tr(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                SizeData.s8,
                              ),
                              decoration: BoxDecoration(
                                color: ColorData.purple1Color,
                                borderRadius: BorderRadius.circular(
                                  SizeData.s8,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {});
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AssetsProviderData.addSquareWhite,
                                    ),
                                    SizedBox(
                                      width: SizeData.s8,
                                    ),
                                    Text(
                                      currentIndex == 0 ?
                                      LocaleKeys.kAddMoreHours.tr() :
                                      currentIndex == 1 ?
                                      LocaleKeys.kAddMoreDays.tr() :
                                      currentIndex == 2 ?
                                      LocaleKeys.kAddMoreWeeks.tr() :
                                      LocaleKeys.kAddMoreMonths.tr(),
                                      style: Styles.textStyleWhiteR12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (currentIndex == 0) ...[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeData.s8,
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                SizeData.s8,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorData.purple3Color,
                                borderRadius: BorderRadius.circular(
                                  SizeData.s4,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.kPeriods.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Text(
                              LocaleKeys.kPriceForOneHour.tr(),
                              style: Styles.textStyleGrey300R14,
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kIndoor.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kOutdoor.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kParkingBoxes.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ] else if (currentIndex == 1) ...[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeData.s8,
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                SizeData.s8,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorData.purple3Color,
                                borderRadius: BorderRadius.circular(
                                  SizeData.s4,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.kPeriods.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Text(
                              LocaleKeys.kPriceForOneDay.tr(),
                              style: Styles.textStyleGrey300R14,
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kIndoor.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kOutdoor.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kParkingBoxes.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ] else if (currentIndex == 2) ...[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeData.s8,
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                SizeData.s8,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorData.purple3Color,
                                borderRadius: BorderRadius.circular(
                                  SizeData.s4,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.kPeriods.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Text(
                              LocaleKeys.kPriceForOneWeek.tr(),
                              style: Styles.textStyleGrey300R14,
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kIndoor.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kOutdoor.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kParkingBoxes.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ] else ...[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeData.s8,
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                SizeData.s8,
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorData.purple3Color,
                                borderRadius: BorderRadius.circular(
                                  SizeData.s4,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.kPeriods.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Text(
                              LocaleKeys.kPriceForOneMonth.tr(),
                              style: Styles.textStyleGrey300R14,
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kIndoor.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kOutdoor.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.kParkingBoxes.tr(),
                                  style: Styles.textStyleGray500R14,
                                ),
                                SizedBox(
                                  width: Unit(context).getWidthSize*0.4,
                                  child: InputTextProviderCustom(
                                    controller: TextEditingController(),
                                    hintText: '300',
                                    suffixIcon: Icon(
                                      Icons.euro_outlined,
                                      color: ColorData.gray300Color,
                                      size: SizeData.s16,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ],
                  ),
                ),
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
                    color: ColorData.whiteColor,
                    colorFont: ColorData.purple4Color,
                    borderColor: ColorData.purple4Color,
                    borderWidth: 1.0,
                  ),
                  const Spacer(),
                  MainButtonProviderCustom(
                    onTap: (){
                      buildAllSetFinalDialog(context: context);
                      //GoRouter.of(context).push(AppRouter.kTypeOfParkingView);
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
