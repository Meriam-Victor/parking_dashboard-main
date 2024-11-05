
import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/font_weight_data.dart';

abstract class Styles {

  static const fontFamily='Inter';

  static Unit? unit;
  static init(BuildContext context) {
    unit = Unit(context);
  }

  static TextStyle textStyle14 = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.medium,
    fontSize: 14,
    height: 0.0,
    fontFamily: fontFamily,
  );


  static TextStyle textStyleDangerR12 = TextStyle(
    color: ColorData.dangerColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600R12 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600R14 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600B20 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.bold,
    fontSize: unit!.fontSize(20),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray300R14 = TextStyle(
    color: ColorData.gray300Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700M12 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700M14 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray400M12 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray400R14 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray400B16 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.bold,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray3M14 = TextStyle(
    color: ColorData.gray3Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlack3R12 = TextStyle(
    color: ColorData.black3Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlack3SB16 = TextStyle(
    color: ColorData.black3Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrayM12 = TextStyle(
    color: ColorData.grayColor,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrayR14 = TextStyle(
    color: ColorData.grayColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray4M14 = TextStyle(
    color: ColorData.gray4Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray1R12 = TextStyle(
    color: ColorData.gray1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray500R16 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlueR12 = TextStyle(
    color: ColorData.blueColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlueR16 = TextStyle(
    color: ColorData.blueColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray4SB18 = TextStyle(
    color: ColorData.gray7Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(18),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray5M12 = TextStyle(
    color: ColorData.gray5Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyle500R14 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: 14,
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDangerR14 = TextStyle(
    color: ColorData.dangerColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWhiteR12 = TextStyle(
    color: ColorData.white50Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDangerR10 = TextStyle(
    color: ColorData.dangerColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(8),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWhiteM12 = TextStyle(
    color: ColorData.white2Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue400R12 = TextStyle(
    color: ColorData.blue3Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWhiteR14 = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue400M14 = TextStyle(
    color: ColorData.blue3Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue400R14 = TextStyle(
    color: ColorData.blue3Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue5M14 = TextStyle(
    color: ColorData.blue5Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600M12 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600SB14 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600SB16 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600R16 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray300M12 = TextStyle(
    color: ColorData.gray300Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray9M12 = TextStyle(
    color: ColorData.gray9Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePurple500M12 = TextStyle(
    color: ColorData.purpleColor,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700R12 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700R14 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrayR12 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrayM16 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray400M16 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray3R12 = TextStyle(
    color: ColorData.gray3Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlack3SB12 = TextStyle(
    color: ColorData.black3Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlack3M14 = TextStyle(
    color: ColorData.black3Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray3SB14 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray3SB12 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray3SB16 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray3M16 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray300R10 = TextStyle(
    color: ColorData.gray300Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(10),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray7M12 = TextStyle(
    color: ColorData.gray7Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray7M14 = TextStyle(
    color: ColorData.gray7Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray4R14 = TextStyle(
    color: ColorData.gray4Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray800R14 = TextStyle(
    color: ColorData.gray800Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray800R12 = TextStyle(
    color: ColorData.gray800Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray800M12 = TextStyle(
    color: ColorData.gray800Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );


  static TextStyle textStyleGray500R14 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleSecondary500R16 = TextStyle(
    color: ColorData.secondary500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700R16 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrayBlueM12 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray500R12 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrayBlueR11 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(11),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrayBlueR10 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(10),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreenR11 = TextStyle(
    color: ColorData.greenColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(11),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDangerR11 = TextStyle(
    color: ColorData.danger2Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(11),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimaryR14 = TextStyle(
    color: ColorData.primary50Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimaryR12 = TextStyle(
    color: ColorData.primary50Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimaryR11 = TextStyle(
    color: ColorData.primary50Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(11),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue500R12 = TextStyle(
    color: ColorData.blue500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue500R14 = TextStyle(
    color: ColorData.blue500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700B32 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.bold,
    fontSize: unit!.fontSize(32),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue700B32 = TextStyle(
    color: ColorData.blue4Color,
    fontWeight: FontWeightStyles.bold,
    fontSize: unit!.fontSize(32),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreenR10 = TextStyle(
    color: ColorData.green1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(10),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDanger3R10 = TextStyle(
    color: ColorData.danger3Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(10),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDanger3R14 = TextStyle(
    color: ColorData.danger3Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue4R10 = TextStyle(
    color: ColorData.blue4Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(10),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePurple2R10 = TextStyle(
    color: ColorData.purple2Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(10),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePurple1R12 = TextStyle(
    color: ColorData.purple1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimary700R12 = TextStyle(
    color: ColorData.primary700Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimary1R14 = TextStyle(
    color: ColorData.primaryColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleYellowSB16 = TextStyle(
    color: ColorData.yellow2Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray200M18 = TextStyle(
    color: ColorData.gray200Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(18),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray200R12 = TextStyle(
    color: ColorData.gray200Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDangerR16 = TextStyle(
    color: ColorData.dangerColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue500M14 = TextStyle(
    color: ColorData.blue500Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue7R12 = TextStyle(
    color: ColorData.blue7Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleSecondary2M16 = TextStyle(
    color: ColorData.secondary2Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleSecondary1M14 = TextStyle(
    color: ColorData.secondary1Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimaryPR12 = TextStyle(
    color: ColorData.primaryPColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimaryP2R14 = TextStyle(
    color: ColorData.primaryP2Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimaryPR10 = TextStyle(
    color: ColorData.primaryPColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(10),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePurple4R12 = TextStyle(
    color: ColorData.purple4Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );


  static TextStyle textStyleGrey300R14 = TextStyle(
    color: ColorData.gray300Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray300R12 = TextStyle(
    color: ColorData.gray300Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray500SB24 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(24),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrey500R14 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray500M14 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrey500R16 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray500M20 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(20),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray500M16 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrey500R12 = TextStyle(
    color: ColorData.gray500Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrey600SB14 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrey600M14 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrey600R16 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray600M16 = TextStyle(
    color: ColorData.gray600Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray700M16 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray7005R18 = TextStyle(
    color: ColorData.gray700Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(18),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGray400R12 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrey400R16 = TextStyle(
    color: ColorData.gray400Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGrey4R18 = TextStyle(
    color: ColorData.gray4Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(18),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleSecondary1R12 = TextStyle(
    color: ColorData.secondary1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleSecondary1R14 = TextStyle(
    color: ColorData.secondary1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleYellow3R12 = TextStyle(
    color: ColorData.yellow3Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );
}














