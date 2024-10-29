import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/widget/buttons/main_custom_button.dart';
import 'package:parking_dashboard/Core/widget/input_fields/custom_input_field.dart';

import 'package:parking_dashboard/Core/widget/input_fields/custom_dropdown.dart';
import '../widget/custom_progress_step.dart';

class OfferedServicesView extends StatefulWidget {
  const OfferedServicesView({super.key});

  @override
  State<OfferedServicesView> createState() => _OfferedServicesView();
}

class _OfferedServicesView extends State<OfferedServicesView> {

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
                style: Styles.textStyleGreyBlue1ColorM20,
              ),
              SizedBox(
                height: SizeData.s10,
              ),
              Text(
                LocaleKeys.kYouCanStillAddServicesLater.tr(),
                style: Styles.textStyleGreyBlue3ColorR14,
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
                        color: ColorData.secondary1Color,
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
                              style: Styles.textStyleGreyBlue1ColorR14,
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
                                  height: Unit(context).getHeightSize*0.049,
                                  decoration: BoxDecoration(
                                    color: groupButtonSelectedList[index] == 'yes' ?
                                    ColorData.secondary1Color :
                                    ColorData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonSelectedList[index] == 'yes' ?
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
                                          value: groupButtonSelectedList[index] == 'yes',
                                          activeColor: ColorData.secondary4Color,
                                          side: BorderSide(
                                            width: SizeData.s1,
                                            color: ColorData.greyBlue9Color,
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
                                        Styles.textStyleSecondary4ColorR14 :
                                        Styles.textStyleGreyBlue8ColorR14,
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
                                  height: Unit(context).getHeightSize*0.049,
                                  decoration: BoxDecoration(
                                    color: groupButtonSelectedList[index] == 'no' ?
                                    ColorData.secondary1Color :
                                    ColorData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonSelectedList[index] == 'no' ?
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
                                          value: groupButtonSelectedList[index] == 'no',
                                          activeColor: ColorData.secondary4Color,
                                          side: BorderSide(
                                            width: SizeData.s1,
                                            color: ColorData.greyBlue9Color,
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
                                        Styles.textStyleSecondary4ColorR14 :
                                        Styles.textStyleGreyBlue8ColorR14,
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
                            color: ColorData.greyBlue7Color,
                          ),
                          if (groupButtonTitleList[index] == LocaleKeys.kShuttleService.tr()) ...[
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Text(
                              LocaleKeys.kShuttleDetails.tr(),
                              style: Styles.textStyleGreyBlue1ColorM16,
                            ),
                            SizedBox(
                              height: SizeData.s10,
                            ),
                            Text(
                              LocaleKeys.kYouWillBeAbleToAddMoreDetailsAboutYourShuttleLater.tr(),
                              style: Styles.textStyleGreyBlue8ColorR12,
                            ),
                            SizedBox(
                              height: SizeData.s32,
                            ),
                          ],
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
                                    horizontal: SizeData.s8,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    vertical: SizeData.s4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: groupButtonPaidList[index] == 'free' ?
                                    ColorData.blue3Color :
                                    ColorData.whiteColor,
                                    border: Border.all(
                                      color: groupButtonPaidList[index] == 'free' ?
                                      ColorData.blue5Color :
                                      ColorData.greyBlue2Color,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                    ),
                                  ),
                                  child: Text(
                                    LocaleKeys.kForFree.tr(),
                                    style: groupButtonPaidList[index] == 'free' ?
                                    Styles.textStyleBlue2ColorR12 :
                                    Styles.textStyleGreyBlue8ColorR12,
                                  ),


                                ),
                              ),
                            ],
                          ),
                        ]



                        // if(groupButtonCheckBoxList[index])
                        //   Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         LocaleKeys.kMaxHeightLimit.tr(),
                        //         style: Styles.textStyleGreyBlue1ColorR12,
                        //       ),
                        //       SizedBox(
                        //         height: SizeData.s8,
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 groupButtonIsUnlimitedList[index] = false;
                        //               });
                        //             },
                        //             child: Container(
                        //               width: Unit(context).getWidthSize*0.52,
                        //               height: Unit(context).getHeightSize*0.049,
                        //               padding: EdgeInsets.symmetric(
                        //                 vertical: SizeData.s4,
                        //                 horizontal: SizeData.s8,
                        //               ),
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(
                        //                   SizeData.s8,
                        //                 ),
                        //                 border: Border.all(
                        //                   color: groupButtonIsUnlimitedList[index] ?
                        //                   ColorData.primary4Color :
                        //                   ColorData.primary8Color,
                        //                   width: SizeData.s1,
                        //                 ),
                        //                 color: ColorData.whiteColor,
                        //               ),
                        //               child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     LocaleKeys.kHeight.tr(),
                        //                     style: groupButtonIsUnlimitedList[index] ?
                        //                     Styles.textStylePrimary4ColorR10 :
                        //                     Styles.textStylePrimaryColorR10,
                        //                   ),
                        //                   VerticalDivider(
                        //                     color: groupButtonIsUnlimitedList[index] ?
                        //                     ColorData.primary4Color :
                        //                     ColorData.primaryColor,
                        //                     thickness: 1,
                        //                     indent: 8,
                        //                     endIndent: 8,
                        //                   ),
                        //                   //convert into text field
                        //                   Text(
                        //                     '${groupButtonMaxHeightList[index].toStringAsFixed(2)} M',
                        //                     style: groupButtonIsUnlimitedList[index] ?
                        //                     Styles.textStylePrimary4ColorR10 :
                        //                     Styles.textStylePrimaryColorR10,
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //           GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 groupButtonIsUnlimitedList[index] = true;
                        //               });
                        //             },
                        //             child: Container(
                        //               width: Unit(context).getWidthSize*0.25,
                        //               height: Unit(context).getHeightSize*0.049,
                        //               padding: EdgeInsets.symmetric(
                        //                 vertical: SizeData.s4,
                        //                 horizontal: SizeData.s8,
                        //               ),
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(
                        //                   SizeData.s8,
                        //                 ),
                        //                 border: Border.all(
                        //                   color: groupButtonIsUnlimitedList[index] ?
                        //                   ColorData.primary4Color :
                        //                   ColorData.primary8Color,
                        //                   width: SizeData.s1,
                        //                 ),
                        //                 color: groupButtonIsUnlimitedList[index] ?
                        //                 ColorData.primary4Color :
                        //                 ColorData.whiteColor,
                        //               ),
                        //               child: Row(
                        //                 children: [
                        //                   Icon(
                        //                     Icons.all_inclusive,
                        //                     color: groupButtonIsUnlimitedList[index] ?
                        //                     ColorData.primaryColor :
                        //                     ColorData.primary4Color,
                        //                     size: Unit(context).getWidthSize*0.043,
                        //                     //SizeData.s16,
                        //                   ),
                        //                   SizedBox(
                        //                     width: SizeData.s4,
                        //                   ),
                        //                   Text(
                        //                     LocaleKeys.kUnlimited.tr(),
                        //                     style: groupButtonIsUnlimitedList[index] ?
                        //                     Styles.textStylePrimaryColorR10 :
                        //                     Styles.textStylePrimary4ColorR10,
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //
                        //     ],
                        //   ),
                        // SizedBox(
                        //   width: SizeData.s16,
                        // ),
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
