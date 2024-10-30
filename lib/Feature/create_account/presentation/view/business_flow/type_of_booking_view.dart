import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/functions/all_set_final_dialog.dart';

class TypeOfBookingView extends StatefulWidget {
  const TypeOfBookingView({super.key});

  @override
  State<TypeOfBookingView> createState() => _TypeOfBookingView();
}

class _TypeOfBookingView extends State<TypeOfBookingView> {

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
                step4State: LocaleKeys.kConfirmed.tr(),
                step5State: LocaleKeys.kInProgress.tr(),
              ),
              SizedBox(
                height: SizeData.s48,
              ),
              Text(
                LocaleKeys.kWhatTypeOfBookingDoYouAccept.tr(),
                style: StylesProvider.textStyleGreyBlue1ColorM20,
              ),
              SizedBox(
                height: SizeData.s10,
              ),
              Text(
                LocaleKeys.kYouCanSelectMoreThanOneOption.tr(),
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
                        ColorProviderData.blue3Color :
                        ColorProviderData.whiteColor,
                        border: Border.all(
                          color: groupButtonCheckBoxList[index] ?
                          ColorProviderData.blue5Color :
                          ColorProviderData.greyBlue2Color,
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
                            style: StylesProvider.textStyleGreyBlue1ColorR14,
                          ),
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
                      buildAllSetFinalDialog(context: context);
                      //GoRouter.of(context).push(AppProviderRouter.kTypeOfParkingView);
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
