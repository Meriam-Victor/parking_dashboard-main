import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/widget/provider_app/side_bar_view.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/functions/verification_code_dialog.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/input_text_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/app_bar_custom.dart';

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
      drawer: buildSideBar(context: context),
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
                      LocaleKeys.kCreateAccount.tr(),
                      style: Styles.textStyleGray500SB24,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy',
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s48,
                    ),
                    Text(
                      LocaleKeys.kName.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextProviderCustom(
                      controller: TextEditingController(),
                      hintText: LocaleKeys.kTypeHere.tr(),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kEmail.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextProviderCustom(
                      controller: TextEditingController(),
                      hintText: LocaleKeys.kTypeHere.tr(),
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
                    InputTextProviderCustom(
                      controller: TextEditingController(),
                      hintText: LocaleKeys.kTypeHere.tr(),
                      obscureText: true,
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(
                          SizeData.s12,
                        ),
                        child: SvgPicture.asset(
                          AssetsProviderData.eyeSlash,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kRepeatPassword.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextProviderCustom(
                      controller: TextEditingController(),
                      hintText: LocaleKeys.kTypeHere.tr(),
                      obscureText: true,
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(
                          SizeData.s12,
                        ),
                        child: SvgPicture.asset(
                          AssetsProviderData.eyeSlash,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeData.s32,
                    ),
                    MainButtonProviderCustom(
                      onTap: () {
                        buildVerificationCodeDialog(context: context);
                      },
                      text: LocaleKeys.kCreateAccount.tr(),
                    ),
                    SizedBox(
                      height: SizeData.s20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.kAlreadyHaveAnAccount.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          width: SizeData.s8,
                        ),
                        GestureDetector(
                          onTap: (){
                            GoRouter.of(context).push(AppRouter.kLogin);
                          },
                          child: Text(
                            LocaleKeys.kLogIn.tr(),
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
