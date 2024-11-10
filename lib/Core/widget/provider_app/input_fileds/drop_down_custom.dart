import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';


class DropDownFiledCustom extends StatelessWidget {
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;
  String? hintText;
  Object? value;
  String? Function(Object?)? validator;
  Widget ? prefix;
  bool ? isProvider;
  DropDownFiledCustom({super.key ,this.items, this.onChanged , this.value,this.hintText ,this.validator,this.prefix,this.isProvider});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      isDense: true,
      validator: validator??(value){
        if(value == null){
          return '';
        }
      },
      hint: Text(hintText??'',style: Styles.textStyleGray300R14,),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(SizeData.s10),
        prefix: prefix,
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
          borderSide: BorderSide(color: (isProvider??false)?ColorData.blue9Color:ColorData.primaryColor,),
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
      dropdownColor: Colors.white,
      value: value,
      onChanged: onChanged,
      items: items,
    );
  }
}
