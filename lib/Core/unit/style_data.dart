import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/font_weight_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';

abstract class Styles {

  static const fontFamily='Inter';

  static Unit? unit;
  static init(BuildContext context) {
    unit = Unit(context);
  }

  static TextStyle textStyleWhiteR14 = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWhiteR12 = TextStyle(
    color: ColorData.whiteColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorSB24 = TextStyle(
    color: ColorData.greyBlue1Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(24),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorR14 = TextStyle(
    color: ColorData.greyBlue1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );
  
  static TextStyle textStyleBlue1ColorR12 = TextStyle(
    color: ColorData.blue1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue4ColorR12 = TextStyle(
    color: ColorData.greyBlue4Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue5ColorR18 = TextStyle(
    color: ColorData.greyBlue5Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(18),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorR16 = TextStyle(
    color: ColorData.greyBlue1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDanger1ColorR12 = TextStyle(
    color: ColorData.danger1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue10ColorR14 = TextStyle(
    color: ColorData.greyBlue10Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue11ColorR18 = TextStyle(
    color: ColorData.greyBlue11Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(18),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue4ColorR16 = TextStyle(
    color: ColorData.greyBlue4Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue4ColorM16 = TextStyle(
    color: ColorData.greyBlue4Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue1ColorR14 = TextStyle(
    color: ColorData.blue1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorR12 = TextStyle(
    color: ColorData.greyBlue1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue8ColorR12 = TextStyle(
    color: ColorData.greyBlue8Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue8ColorM16 = TextStyle(
    color: ColorData.greyBlue4Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleSecondary5ColorM16 = TextStyle(
    color: ColorData.secondary5Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue8ColorR16 = TextStyle(
    color: ColorData.greyBlue8Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDanger1ColorR16 = TextStyle(
    color: ColorData.danger1Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue5ColorM16 = TextStyle(
    color: ColorData.greyBlue5Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue5ColorR16 = TextStyle(
    color: ColorData.greyBlue5Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleSecondary4ColorR14 = TextStyle(
    color: ColorData.secondary4Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleSecondary4ColorM14 = TextStyle(
    color: ColorData.secondary4Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimaryColorR12 = TextStyle(
    color: ColorData.primaryColor,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimary2ColorR14 = TextStyle(
    color: ColorData.primary2Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );


  static TextStyle textStyleGreyBlue8ColorSB14 = TextStyle(
    color: ColorData.greyBlue4Color,
    fontWeight: FontWeightStyles.semiBold,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue8ColorR14 = TextStyle(
    color: ColorData.greyBlue4Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue10ColorR12 = TextStyle(
    color: ColorData.greyBlue10Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorM20 = TextStyle(
    color: ColorData.greyBlue1Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(20),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorM16 = TextStyle(
    color: ColorData.greyBlue1Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue1ColorM14 = TextStyle(
    color: ColorData.blue1Color,
    fontWeight: FontWeightStyles.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue2ColorR12 = TextStyle(
    color: ColorData.blue2Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue3ColorR14 = TextStyle(
    color: ColorData.greyBlue3Color,
    fontWeight: FontWeightStyles.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

}














