import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:parking_dashboard/Core/unit/font_weight_data.dart';

class ProgressStepComponent extends StatelessWidget {

   static const fontFamily='Inter';

  Widget stepIcon;
  Color? progressColor = ColorData.blue2Color;
  double percent;
  String stepNumber;
  String title;
  String stateName;
  Color? stateNameColor = ColorData.blue4Color;
  Color? stateBackgroundColor = ColorData.blue3Color;


  ProgressStepComponent({
    super.key,
    required this.stepIcon,
    this.progressColor,
    required this.percent,
    required this.stepNumber,
    required this.title,
    required this.stateName,
    this.stateNameColor,
    this.stateBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            stepIcon,
            LinearPercentIndicator(
              width: Unit(context).getWidthSize*0.387,
              lineHeight: SizeData.s2,
              backgroundColor: ColorData.greyBlue7Color,
              progressColor: progressColor,
              percent: percent,
            ),
          ],
        ),
        SizedBox(
          height: SizeData.s4,
        ),
        Text(
          LocaleKeys.kStep.tr()+stepNumber,
          style: Styles.textStyleGreyBlue1ColorR12,
        ),
        SizedBox(
          height: SizeData.s4,
        ),
        Text(
          title,
          style: Styles.textStyleGreyBlue4ColorM16,
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
            color: stateBackgroundColor,
            borderRadius: BorderRadius.circular(
              SizeData.s16,
            ),
          ),
          child: Center(
            child: Text(
              stateName,
              style: TextStyle(
                color: stateNameColor,
                fontWeight: FontWeightStyles.regular,
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






