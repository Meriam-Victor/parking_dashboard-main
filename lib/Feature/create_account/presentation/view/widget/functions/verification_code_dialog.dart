import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/functions/all_set_dialog.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';

buildVerificationCodeDialog({required BuildContext context,}) {

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeData.s16,
          ),
        ),
        backgroundColor: ColorProviderData.whiteColor,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(
                SizeData.s35,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.kVerificationCode.tr(),
                    style: StylesProvider.textStyleBlue5ColorR18,
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  Text(
                    LocaleKeys.kWeHaveSentAVerificationCodeTo.tr(),
                    style: StylesProvider.textStyleGreyBlue1ColorR14,
                  ),
                  SizedBox(
                    height: SizeData.s32,
                  ),
                  OtpPinField(
                    maxLength: 4,
                    onSubmit: (String pin) {},
                    onChange: (String text) {  },
                    otpPinFieldStyle: OtpPinFieldStyle(
                      defaultFieldBorderColor: ColorProviderData.greyBlue2Color,
                      activeFieldBorderColor: ColorProviderData.blue1Color,
                      fieldBorderWidth: 1,
                      textStyle: StylesProvider.textStyleGreyBlue1ColorR16,
                    ),
                    otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          LocaleKeys.kDidNotReceiveTheCode.tr(),
                          style: StylesProvider.textStyleGreyBlue1ColorR14,
                        ),
                      ),
                      SizedBox(
                        width: SizeData.s4,
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Expanded(
                          child: Text(
                            LocaleKeys.kResendCode.tr(),
                            style: StylesProvider.textStyleBlue1ColorR14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeData.s32,
                  ),
                  MainButtonProviderCustom(
                    onTap: (){
                      buildAllSetDialog(context: context);
                    },
                    text: LocaleKeys.kVerify.tr(),
                  ),
                  SizedBox(
                    height: SizeData.s24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.kHavingTrouble.tr(),
                        style: StylesProvider.textStyleGreyBlue1ColorR14,
                      ),
                      SizedBox(
                        width: SizeData.s4,
                      ),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Expanded(
                          child: Text(
                            LocaleKeys.kContactSupport.tr(),
                            style: StylesProvider.textStyleBlue1ColorR14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -25.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius: SizeData.s20,
                  backgroundColor: ColorProviderData.whiteColor,
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
