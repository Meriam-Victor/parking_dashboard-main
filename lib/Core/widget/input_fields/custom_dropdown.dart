
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../unit/color_data.dart';
import '../../unit/size_data.dart';
import '../../unit/style_data.dart';


class DropDownFieldCustom extends StatelessWidget {
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;
  String? hintText;
  Object? value;
  String? Function(Object?)? validator;
  Widget ? prefix;
  Widget ? icon;
  DropDownFieldCustom({super.key ,this.items, this.onChanged , this.value,this.hintText ,this.validator,this.prefix, required this.icon});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      isDense: true,
      icon: icon,
      validator: validator??(value){
        if(value == null){
          return '';
        }
        return null;
      },
      style: Styles.textStyleGreyBlue1ColorR14,
      hint: Text(
        hintText??'',
        style: Styles.textStyleGreyBlue3ColorR14,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(SizeData.s10),
        // fillColor: value == null ? ColorData.whiteColor : ColorData.blue3Color,
        // filled: value != null,
        // // fillColor: ColorData.blue3Color,
        // // filled: true,
        prefix: prefix,
        labelStyle: Styles.textStyleGreyBlue1ColorR14,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorData.greyBlue2Color,
          ),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.greyBlue2Color,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.blue5Color,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.danger1Color,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.danger1Color,),
          borderRadius: BorderRadius.circular(SizeData.s8),
        ),

      ),
      borderRadius: BorderRadius.circular(8),
      dropdownColor: ColorData.whiteColor,
      value: value,
      onChanged: onChanged,
      items: items,
    );
  }
}
