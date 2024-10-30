import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:parking_dashboard/Core/unit/font_weight_data.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';

class CustomProgressStep extends StatelessWidget {

  static const fontFamily='Inter';

  String title;
  String stepNumber;
  String stepState;

  CustomProgressStep({
    super.key,
    required this.title,
    required this.stepNumber,
    required this.stepState,
  });

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              stepState == 'Pending' ?
                AssetsProviderData.unactivatedStep :
              stepState == 'In progress' ?
                AssetsProviderData.activatedStep :
                AssetsProviderData.completedStep,
              width: Unit(context).getWidthSize*0.064,
            ),
            LinearPercentIndicator(
              width: Unit(context).getWidthSize*0.387,
              lineHeight: SizeData.s2,
              backgroundColor: ColorProviderData.greyBlue7Color,
              progressColor: stepState == 'Pending' ?
              ColorProviderData.blue2Color :
              stepState == 'In progress' ?
              ColorProviderData.blue2Color :
              ColorProviderData.green3Color,
              percent: stepState == 'Pending' ?
              0.0 :
              stepState == 'In progress' ?
              0.3 :
              1.0,
            ),
          ],
        ),
        SizedBox(
          height: SizeData.s4,
        ),
        Text(
          LocaleKeys.kStep.tr()+stepNumber,
          style: StylesProvider.textStyleGreyBlue1ColorR12,
        ),
        SizedBox(
          height: SizeData.s4,
        ),
        Text(
          title,
          style: StylesProvider.textStyleGreyBlue4ColorM16,
        ),
        SizedBox(
          height: SizeData.s8,
        ),
        Container(
          padding: EdgeInsets.all(
            SizeData.s10,
          ),
          width: Unit(context).getWidthSize*0.25,
          decoration: BoxDecoration(
            color: stepState == 'Pending' ?
            ColorProviderData.greyBlue7Color :
            stepState == 'In progress' ?
            ColorProviderData.blue3Color :
            ColorProviderData.green2Color,
            borderRadius: BorderRadius.circular(
              SizeData.s16,
            ),
          ),
          child: Center(
            child: Text(
              stepState == 'Pending' ?
              LocaleKeys.kPending.tr() :
              stepState == 'In progress' ?
              LocaleKeys.kInProgress.tr() :
              LocaleKeys.kConfirmed.tr(),
              style: TextStyle(
                color: stepState == 'Pending' ?
                ColorProviderData.greyBlue5Color :
                stepState == 'In progress' ?
                ColorProviderData.blue4Color :
                ColorProviderData.green1Color,
                fontWeight: FontWeightStylesProvider.regular,
                fontSize: 14,
                height: 0.0,
                fontFamily: fontFamily,
              ),
            ),
          ),
        ),
      ],
    );
  }
}






