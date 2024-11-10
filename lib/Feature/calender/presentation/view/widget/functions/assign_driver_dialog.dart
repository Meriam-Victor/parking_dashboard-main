import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/input_text_custom.dart';

buildAssignDriversDialog({
  required BuildContext context,
  required String title,
  required firstTransferDateController,
  required firstTransferTimeController,
  required secondTransferDateController,
  required secondTransferTimeController,
}) {

  FocusNode transferDateNode = FocusNode();
  FocusNode transferTimeNode = FocusNode();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeData.s16,
          ),
        ),
        backgroundColor: ColorData.whiteColor,
        child: Padding(
          padding: EdgeInsets.all(
            SizeData.s16,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    LocaleKeys.kAssignDriver.tr(),
                    style: Styles.textStyleGray600R16,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: Unit(context).getWidthSize*0.07,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeData.s8,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(
                          SizeData.s16,
                        ),
                        decoration: BoxDecoration(
                          color: ColorData.whiteColor,
                          borderRadius: BorderRadius.circular(
                            SizeData.s8,
                          ),
                          border: Border.all(
                            color: ColorData.white3Color,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: Styles.textStyleGray500R16,
                            ),
                            SizedBox(
                              height: SizeData.s16,
                            ),
                            Text(
                              LocaleKeys.kDate.tr(),
                              style: Styles.textStyleGray500R14,
                            ),
                            SizedBox(
                              height: SizeData.s4,
                            ),
                            InputTextCustom(
                              controller: title == LocaleKeys.kFirstTransfer.tr() ?
                              firstTransferDateController :
                              secondTransferDateController,
                              focusNode: transferDateNode,
                              onEditingComplete: ()=>FocusScope.of(context).requestFocus(transferTimeNode),
                              hintText: LocaleKeys.kTypeHere.tr(),
                              prefix: Padding(
                                padding: EdgeInsets.all(
                                  SizeData.s12,
                                ),
                                child: SvgPicture.asset(
                                  AssetsProviderData.calendar2Icon,
                                  width: Unit(context).getWidthSize*0.06,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s8,
                            ),
                            Text(
                              LocaleKeys.kTime.tr(),
                              style: Styles.textStyleGray500R14,
                            ),
                            SizedBox(
                              height: SizeData.s4,
                            ),
                            InputTextCustom(
                              controller: title == LocaleKeys.kFirstTransfer.tr() ?
                              firstTransferTimeController :
                              secondTransferTimeController,
                              focusNode: transferTimeNode,
                              onEditingComplete: ()=>FocusScope.of(context).requestFocus(),
                              hintText: LocaleKeys.kTypeHere.tr(),
                              prefix: Padding(
                                padding: EdgeInsets.all(
                                  SizeData.s12,
                                ),
                                child: SvgPicture.asset(
                                  AssetsProviderData.clockIcon,
                                  width: Unit(context).getWidthSize*0.06,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s8,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeData.s16,
                      ),
                      Text(
                        LocaleKeys.kSelectDriver.tr(),
                        style: Styles.textStyleGray600R16,
                      ),
                      SizedBox(
                        height: SizeData.s8,
                      ),
                      //tabbar
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(
                          SizeData.s16,
                        ),
                        decoration: BoxDecoration(
                          color: ColorData.whiteColor,
                          borderRadius: BorderRadius.circular(
                            SizeData.s8,
                          ),
                          border: Border.all(
                            color: ColorData.white3Color,
                          ),
                        ),
                        child: Column(
                          children: [
                            ...List.generate(
                              5,
                                (index){
                                return Column(
                                    children: [
                                      tabBarComponent(
                                        context: context,
                                        image: SvgPicture.asset(
                                          AssetsProviderData.userIcon,
                                          fit: BoxFit.fill,
                                        ),
                                        name: 'Company Name',
                                        phone: '+33 659556556',
                                    ),
                                    SizedBox(
                                      height: SizeData.s8,
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: ColorData.white3Color,
                                    ),
                                  ],
                                );
                              }
                            ),
                          ],
                        ),
                      ),

                      if(title == LocaleKeys.kFirstTransfer.tr()) ...[
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        MainButtonCustom(
                          onTap: (){
                            buildAssignDriversDialog(
                              context: context,
                              title: LocaleKeys.kSecondTransfer.tr(),
                              firstTransferDateController: firstTransferDateController,
                              firstTransferTimeController: firstTransferTimeController,
                              secondTransferDateController: secondTransferDateController,
                              secondTransferTimeController: secondTransferTimeController,
                            );
                          },
                          text: LocaleKeys.kSecondTransfer.tr(),
                          isProvider: true,
                          arrowIcon: true,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        MainButtonCustom(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          text: LocaleKeys.kCancel.tr(),
                          isProvider: true,
                          color: ColorData.primaryP2Color,
                          colorFont: ColorData.purple4Color,
                        ),
                      ],
                      if(title == LocaleKeys.kSecondTransfer.tr()) ...[
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        MainButtonCustom(
                          onTap: (){

                          },
                          text: LocaleKeys.kSave.tr(),
                          isProvider: true,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        MainButtonCustom(
                          onTap: (){
                            buildAssignDriversDialog(
                              context: context,
                              title: LocaleKeys.kFirstTransfer.tr(),
                              firstTransferDateController: firstTransferDateController,
                              firstTransferTimeController: firstTransferTimeController,
                              secondTransferDateController: secondTransferDateController,
                              secondTransferTimeController: secondTransferTimeController,
                            );
                          },
                          text: LocaleKeys.kGoBack.tr(),
                          isProvider: true,
                          color: ColorData.primaryP2Color,
                          colorFont: ColorData.purple4Color,
                        ),
                      ],
                      SizedBox(
                        height: SizeData.s16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget tabBarComponent({
  required BuildContext context,
  required Widget image,
  required String name,
  required phone,
}) {

  return GestureDetector(
    onTap: (){
    },
    child: Row(
      children: [
        CircleAvatar(
          radius: Unit(context).getWidthSize*0.05,
          child: image,
        ),
        SizedBox(
          width: SizeData.s8,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Styles.textStyleGray600R14,
              ),
              SizedBox(
                height: SizeData.s4,
              ),
              Text(
                phone,
                style: Styles.textStyleGrayR12,
              ),
            ],
          ),
        ),
        //const Spacer(),
        //adding driver button
        SizedBox(
          width: SizeData.s8,
        ),
      ],
    ),
  );
}