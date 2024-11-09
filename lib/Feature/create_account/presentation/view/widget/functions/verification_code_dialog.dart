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
        backgroundColor: ColorData.whiteColor,
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
                    style: Styles.textStyleGray7005R18,
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  Text(
                    LocaleKeys.kWeHaveSentAVerificationCodeTo.tr(),
                    style: Styles.textStyleGray500R14,
                  ),
                  SizedBox(
                    height: SizeData.s32,
                  ),
                  OtpPinField(
                    maxLength: 4,
                    onSubmit: (String pin) {},
                    onChange: (String text) {  },
                    otpPinFieldStyle: OtpPinFieldStyle(
                      defaultFieldBorderColor: ColorData.gray100Color,
                      activeFieldBorderColor: ColorData.blue500Color,
                      fieldBorderWidth: 1,
                      textStyle: Styles.textStyleGray500R16,
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
                          style: Styles.textStyleGray500R14,
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
                            style: Styles.textStyleBlue500R14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeData.s32,
                  ),
                  MainButtonCustom(
                    onTap: (){
                      buildAllSetDialog(context: context);
                    },
                    isProvider: true,
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
                        style: Styles.textStyleGray500R14,
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
                            style: Styles.textStyleBlue500R14,
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
                  backgroundColor: ColorData.whiteColor,
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
