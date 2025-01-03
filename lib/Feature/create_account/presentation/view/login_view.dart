import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/app_bar_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/input_text_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/side_bar_view.dart';

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
      drawer: buildSideBar(context: context),
      backgroundColor: ColorData.whiteColor,
      body: Column(
        children: [
          AppBarProviderCustom(
            title: LocaleKeys.kLogIn.tr(),
          ),
          Expanded(
            child: Container(
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
                    color: ColorData.grayShadow3Color,
                    spreadRadius: -2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                  BoxShadow(
                    color: ColorData.grayShadow4Color,
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
                      style: Styles.textStyleGray500SB24,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    Text(
                      LocaleKeys.kHereYouCanLogIntoYourDashboard.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s48,
                    ),
                    Text(
                      LocaleKeys.kEmail.tr(),
                      style: Styles.textStyleGray500R14,
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
                          style: Styles.textStyleBlue500R12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kPassword.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextCustom(
                      controller: TextEditingController(),
                      hintText: LocaleKeys.kTypeHere.tr(),
                      obscureText: true,
                      suffixIcon: Icons.visibility_off
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
                          style: Styles.textStyleGray600R12,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){},
                          child: Text(
                            LocaleKeys.kForgotPasswordQuestion.tr(),
                            style: Styles.textStyleBlue500R12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeData.s32,
                    ),
                    MainButtonCustom(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kAddParking);
                      },
                      isProvider: true,
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
                          style: Styles.textStyleGray500R14,
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
                            style: Styles.textStyleBlue500R14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
