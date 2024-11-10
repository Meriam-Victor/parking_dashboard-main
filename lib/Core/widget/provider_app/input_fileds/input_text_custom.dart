
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';


class InputTextCustom extends StatelessWidget {
  bool? obscureText;
  final TextEditingController controller;
  final String hintText;
  TextInputType? textInputType;
  String? Function(String?)? validator;
  IconData? suffixIcon;
  Function()? onPressSuffixIcon;
  void Function()? onEditingComplete;
  FocusNode? focusNode;
  int ? minLines;
  Color ? color;
  Widget ? prefix;
  bool ? enabled;
  List<TextInputFormatter>? inputFormatters;
  void Function(String)? onChanged;

  InputTextCustom({super.key,this.obscureText, required this.controller, required this.hintText , this.textInputType,this.validator,
    this.color, this.suffixIcon, this.minLines, this.prefix, this.enabled,this.onChanged,this.inputFormatters,
    this.onPressSuffixIcon, this.onEditingComplete, this.focusNode,});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      obscureText: obscureText??false,
      keyboardType: textInputType??TextInputType.text,
      maxLines: minLines??1,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.textStyleGray300R14,
        errorStyle: const TextStyle(
          overflow: TextOverflow.visible,
        ),

        suffixIcon: suffixIcon!=null ?
        IconButton(
            onPressed: onPressSuffixIcon,
            icon: Icon(suffixIcon,color: ColorData.gray300Color,)) : null,
        filled: true,
        fillColor: color??ColorData.whiteColor,
        prefixIcon: prefix,
        enabled: enabled??true,
        contentPadding: EdgeInsets.all(SizeData.s10),
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
          borderSide: BorderSide(color: ColorData.gray100Color,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.gray100Color,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.dangerColor,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.gray100Color,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
      ),
      validator: validator??(value) {
        if (value!.isEmpty) {
          return 'LocaleKeys.kPleaseFillThisField.tr()';
        }
        return null;
      },
    );
  }
}
