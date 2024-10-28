import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:parking_dashboard/Core/unit/font_weight_data.dart';

import 'custom_progress_step.dart';

class ProgressSteps extends StatelessWidget {

   static const fontFamily='Inter';

  String step1State;
  String step2State;
  String step3State;
  String step4State;
  String step5State;


   ProgressSteps({
    super.key,
    required this.step1State,
    required this.step2State,
    required this.step3State,
    required this.step4State,
    required this.step5State,
  });

  @override
  Widget build(BuildContext context) {
    context.locale;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomProgressStep(
            title: LocaleKeys.kParkingDetails.tr(),
            stepNumber: '1',
            stepState: step1State,
          ),
          SizedBox(
            width: SizeData.s24,
          ),
          CustomProgressStep(
            title: LocaleKeys.kConfiguration.tr(),
            stepNumber: '2',
            stepState: step2State,
          ),
          SizedBox(
            width: SizeData.s24,
          ),
          CustomProgressStep(
            title: LocaleKeys.kPictures.tr(),
            stepNumber: '3',
            stepState: step3State,
          ),
          SizedBox(
            width: SizeData.s24,
          ),
          CustomProgressStep(
            title: LocaleKeys.kServices.tr(),
            stepNumber: '4',
            stepState: step4State,
          ),
          SizedBox(
            width: SizeData.s24,
          ),
          CustomProgressStep(
            title: LocaleKeys.kPricePlan.tr(),
            stepNumber: '5',
            stepState: step5State,
          ),
        ],
      ),
    );
  }
}






