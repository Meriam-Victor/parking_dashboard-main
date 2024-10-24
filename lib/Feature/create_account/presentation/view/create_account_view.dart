import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/widget/appbar/custom_app_bar.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/functions/verification_code_dialog.dart';
import 'package:parking_dashboard/Core/widget/buttons/main_custom_button.dart';
import 'package:parking_dashboard/Core/widget/input_fields/custom_input_field.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.whiteColor,
      appBar: CustomAppBar(
        title: LocaleKeys.kLogIn.tr(),
      ),
      body: Container(
        width: Unit(context).getWidthSize*0.96,
        height: Unit(context).getHeightSize*0.831,
        padding: EdgeInsets.symmetric(
          horizontal: SizeData.s16,
          vertical: SizeData.s48,
        ),
        margin: EdgeInsets.all(
          SizeData.s16,
        ),
        decoration: BoxDecoration(
          color: ColorData.whiteColor,
          borderRadius: BorderRadius.circular(
            SizeData.s16,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorData.shadow1Color,
              spreadRadius: -2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: ColorData.shadow2Color,
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.kCreateAccount.tr(),
                style: Styles.textStyleGreyBlue1ColorSB24,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy',
                style: Styles.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                height: SizeData.s48,
              ),
              Text(
                LocaleKeys.kName.tr(),
                style: Styles.textStyleGreyBlue1ColorR14,
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
                LocaleKeys.kEmail.tr(),
                style: Styles.textStyleGreyBlue1ColorR14,
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
                LocaleKeys.kPassword.tr(),
                style: Styles.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(
                    SizeData.s12,
                  ),
                  child: SvgPicture.asset(
                    AssetsData.eyeSlash,
                  ),
                ),
              ),
              SizedBox(
                height: SizeData.s16,
              ),
              Text(
                LocaleKeys.kRepeatPassword.tr(),
                style: Styles.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              InputTextCustom(
                controller: TextEditingController(),
                hintText: LocaleKeys.kTypeHere.tr(),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(
                    SizeData.s12,
                  ),
                  child: SvgPicture.asset(
                    AssetsData.eyeSlash,
                  ),
                ),
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              MainCustomButton(
                onTap: () {
                  buildVerificationCodeDialog(context: context);
                },
                text: LocaleKeys.kCreateAccount.tr(),
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.kAlreadyHaveAnAccount.tr(),
                    style: Styles.textStyleGreyBlue1ColorR14,
                  ),
                  SizedBox(
                    width: SizeData.s8,
                  ),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Text(
                      LocaleKeys.kLogIn.tr(),
                      style: Styles.textStyleBlue1ColorR14,
                    ),
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
