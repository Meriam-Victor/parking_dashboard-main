
import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';


class DropDownFieldProviderCustom extends StatelessWidget {
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;
  String? hintText;
  Object? value;
  String? Function(Object?)? validator;
  Widget ? prefix;
  Widget ? icon;
  DropDownFieldProviderCustom({super.key ,this.items, this.onChanged , this.value,this.hintText ,this.validator,this.prefix, this.icon});

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
      style: Styles.textStyleGray500R14,
      hint: Text(
        hintText??'',
        style: Styles.textStyleGrey300R14,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(SizeData.s10),
        prefix: prefix,
        labelStyle: Styles.textStyleGray500R14,
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
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorData.gray100Color,),
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
      borderRadius: BorderRadius.circular(8),
      dropdownColor: ColorData.whiteColor,
      value: value,
      onChanged: onChanged,
      items: items,
    );
  }
}
