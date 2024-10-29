import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/font_weight_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';

abstract class StylesProvider {

  static const fontFamily='Inter';

  static Unit? unit;
  static init(BuildContext context) {
    unit = Unit(context);
  }

  static TextStyle textStyleWhiteR14 = TextStyle(
    color: ColorProviderData.whiteColor,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleWhiteR12 = TextStyle(
    color: ColorProviderData.whiteColor,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorSB24 = TextStyle(
    color: ColorProviderData.greyBlue1Color,
    fontWeight: FontWeightStylesProvider.semiBold,
    fontSize: unit!.fontSize(24),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorR14 = TextStyle(
    color: ColorProviderData.greyBlue1Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorM14 = TextStyle(
    color: ColorProviderData.greyBlue1Color,
    fontWeight: FontWeightStylesProvider.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );
  
  static TextStyle textStyleBlue1ColorR12 = TextStyle(
    color: ColorProviderData.blue1Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue4ColorR12 = TextStyle(
    color: ColorProviderData.greyBlue4Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue5ColorR18 = TextStyle(
    color: ColorProviderData.greyBlue5Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(18),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorR16 = TextStyle(
    color: ColorProviderData.greyBlue1Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDanger1ColorR12 = TextStyle(
    color: ColorProviderData.danger1Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue10ColorR14 = TextStyle(
    color: ColorProviderData.greyBlue10Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue11ColorR18 = TextStyle(
    color: ColorProviderData.greyBlue11Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(18),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue4ColorR16 = TextStyle(
    color: ColorProviderData.greyBlue4Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue4ColorM16 = TextStyle(
    color: ColorProviderData.greyBlue4Color,
    fontWeight: FontWeightStylesProvider.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue1ColorR14 = TextStyle(
    color: ColorProviderData.blue1Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorR12 = TextStyle(
    color: ColorProviderData.greyBlue1Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue8ColorR12 = TextStyle(
    color: ColorProviderData.greyBlue8Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue8ColorM16 = TextStyle(
    color: ColorProviderData.greyBlue4Color,
    fontWeight: FontWeightStylesProvider.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylesProviderecondary5ColorM16 = TextStyle(
    color: ColorProviderData.secondary5Color,
    fontWeight: FontWeightStylesProvider.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue8ColorR16 = TextStyle(
    color: ColorProviderData.greyBlue8Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleDanger1ColorR16 = TextStyle(
    color: ColorProviderData.danger1Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue5ColorM16 = TextStyle(
    color: ColorProviderData.greyBlue5Color,
    fontWeight: FontWeightStylesProvider.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue5ColorR16 = TextStyle(
    color: ColorProviderData.greyBlue5Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylesProviderecondary4ColorR14 = TextStyle(
    color: ColorProviderData.secondary4Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylesProviderecondary4ColorM14 = TextStyle(
    color: ColorProviderData.secondary4Color,
    fontWeight: FontWeightStylesProvider.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimaryColorR12 = TextStyle(
    color: ColorProviderData.primaryColor,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimary2ColorR14 = TextStyle(
    color: ColorProviderData.primary2Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );


  static TextStyle textStyleGreyBlue8ColorSB14 = TextStyle(
    color: ColorProviderData.greyBlue4Color,
    fontWeight: FontWeightStylesProvider.semiBold,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue8ColorR14 = TextStyle(
    color: ColorProviderData.greyBlue4Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue4ColorM14 = TextStyle(
    color: ColorProviderData.greyBlue4Color,
    fontWeight: FontWeightStylesProvider.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue10ColorR12 = TextStyle(
    color: ColorProviderData.greyBlue10Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorM20 = TextStyle(
    color: ColorProviderData.greyBlue1Color,
    fontWeight: FontWeightStylesProvider.medium,
    fontSize: unit!.fontSize(20),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue1ColorM16 = TextStyle(
    color: ColorProviderData.greyBlue1Color,
    fontWeight: FontWeightStylesProvider.medium,
    fontSize: unit!.fontSize(16),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue1ColorM14 = TextStyle(
    color: ColorProviderData.blue1Color,
    fontWeight: FontWeightStylesProvider.medium,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleBlue2ColorR12 = TextStyle(
    color: ColorProviderData.blue2Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleGreyBlue3ColorR14 = TextStyle(
    color: ColorProviderData.greyBlue3Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(14),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimaryColorR10 = TextStyle(
    color: ColorProviderData.primaryColor,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(10),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStylePrimary4ColorR10 = TextStyle(
    color: ColorProviderData.primary4Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(10),
    height: 0.0,
    fontFamily: fontFamily,
  );

  static TextStyle textStyleYellow2ColorR12 = TextStyle(
    color: ColorProviderData.yellow2Color,
    fontWeight: FontWeightStylesProvider.regular,
    fontSize: unit!.fontSize(12),
    height: 0.0,
    fontFamily: fontFamily,
  );
}














