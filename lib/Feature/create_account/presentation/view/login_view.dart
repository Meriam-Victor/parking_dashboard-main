import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/appbar/custom_app_bar.dart';
import 'package:parking_dashboard/Core/widget/input_fields/custom_input_field.dart';
import 'package:parking_dashboard/Core/widget/buttons/main_custom_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool? isChecked = false;

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
                LocaleKeys.kLogInAsAPartner.tr(),
                style: Styles.textStyleGreyBlue1ColorSB24,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              Text(
                LocaleKeys.kHereYouCanLogIntoYourDashboard.tr(),
                style: Styles.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                height: SizeData.s48,
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
                height: SizeData.s8,
              ),
              GestureDetector(
                onTap: (){},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    LocaleKeys.kForgotEmailQuestion.tr(),
                    style: Styles.textStyleBlue1ColorR12,
                  ),
                ),
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
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        isChecked = newValue;
                      });
                    },
                  ),
                  Text(
                    LocaleKeys.kRememberMe.tr(),
                    style: Styles.textStyleBlue4ColorR12,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){},
                    child: Text(
                      LocaleKeys.kForgotPasswordQuestion.tr(),
                      style: Styles.textStyleBlue1ColorR12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              MainCustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kAddParking);
                },
                text: LocaleKeys.kLogIn.tr(),
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.kDoNotHaveAccount.tr(),
                    style: Styles.textStyleGreyBlue1ColorR14,
                  ),
                  SizedBox(
                    width: SizeData.s8,
                  ),
                  GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kCreateAccount);
                    },
                    child: Text(
                      LocaleKeys.kCreateAccount.tr(),
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
