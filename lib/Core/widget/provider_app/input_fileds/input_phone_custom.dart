
import 'dart:core';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';

class InputPhoneCustom extends StatelessWidget {
  final TextEditingController controller;
  String ? labelText;
  FocusNode? focusNode;
  Function(String)? onSubmitted;
  void Function(Country)? onCountryChanged;
  void Function(PhoneNumber)? onChanged;
  String ? initialCountryCode;
  bool ? enabled;
  InputPhoneCustom({Key? key, required this.controller,this.focusNode,this.labelText,this.onSubmitted ,this.onCountryChanged ,this.onChanged,this.initialCountryCode,this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      focusNode: focusNode,
      textInputAction:TextInputAction.next,
      initialCountryCode: initialCountryCode??'FR',
      disableLengthCheck: true,
      onSubmitted: onSubmitted,
      keyboardType: TextInputType.phone,
      controller: controller,
      textAlign: TextAlign.start,
 style: const TextStyle(
          color: Color(0XFF090A0A),
          fontWeight: FontWeight.w400,
          fontSize: 16
      ),

      onCountryChanged: onCountryChanged,
      enabled: enabled??true,
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: Styles.textStyleGray300R14,
        filled: true,
        fillColor: ColorData.whiteColor,
        contentPadding: EdgeInsets.all(SizeData.s15),

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorData.gray100Color,
          ),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.gray100Color,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeData.s8),
          borderSide: BorderSide(color: ColorData.gray100Color,),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.primaryColor,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.dangerColor,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.dangerColor,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
      ),
      onChanged: onChanged,
      validator: (val){
        if(val!.toString().isEmpty){
          return LocaleKeys.kPleaseFillThisField.tr();
        }
      },

    );
  }
}
