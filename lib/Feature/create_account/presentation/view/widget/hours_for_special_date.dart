import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/translations/utils/en.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';

class HoursForSpecialDate extends StatefulWidget {
  const HoursForSpecialDate({super.key});


  @override
  State<HoursForSpecialDate> createState() => _HoursForSpecialDate();
}

class _HoursForSpecialDate extends State<HoursForSpecialDate> {

  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool isClosed = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != startTime) {
      setState(() {
        startTime = picked;
        isClosed = false;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != endTime) {
      setState(() {
        endTime = picked;
        isClosed = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(
        SizeData.s8,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: SizeData.s1,
          color: ColorProviderData.greyBlue2Color,
        ),
        borderRadius: BorderRadius.circular(
          SizeData.s8,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LocaleKeys.kDate.tr(),
              style: StylesProvider.textStyleGreyBlue1ColorR14,
            ),
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          GestureDetector(
            onTap: () => _selectDate(context,),
            child: Container(
              height: Unit(context).getHeightSize*0.059,
              width: double.infinity,
              padding: EdgeInsets.all(
                SizeData.s10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    color: ColorProviderData.greyBlue2Color
                ),
                borderRadius: BorderRadius.circular(
                  SizeData.s10,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsData.calendar2Blue,
                  ),
                  SizedBox(
                    width: SizeData.s8,
                  ),
                  Text(
                    selectedDate != null
                        ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                        : LocaleKeys.kSelectDate.tr(),
                    style: StylesProvider.textStyleBlue1ColorR14,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AssetsData.arrowDown,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LocaleKeys.kStartTime.tr(),
              style: StylesProvider.textStyleGreyBlue1ColorR14,
            ),
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          GestureDetector(
            onTap: () => _selectStartTime(context,),
            child: Container(
              height: Unit(context).getHeightSize*0.059,
              width: double.infinity,
              padding: EdgeInsets.all(
                SizeData.s10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    color: ColorProviderData.greyBlue2Color
                ),
                borderRadius: BorderRadius.circular(
                  SizeData.s10,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    width: Unit(context).getWidthSize*0.053,
                    startTime != null?
                    AssetsData.clockBlue:
                    AssetsData.clockIcon,
                  ),
                  SizedBox(
                    width: SizeData.s8,
                  ),
                  Text(
                    startTime != null
                        ? startTime!.format(context)
                        : LocaleKeys.kSelectHere.tr(),
                    style: startTime != null?
                        StylesProvider.textStyleBlue1ColorR14 :
                        StylesProvider.textStyleGreyBlue1ColorR14,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AssetsData.arrowDown,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LocaleKeys.kEndTime.tr(),
              style: StylesProvider.textStyleGreyBlue1ColorR14,
            ),
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          GestureDetector(
            onTap: () => _selectEndTime(context,),
            child: Container(
              height: Unit(context).getHeightSize*0.059,
              width: double.infinity,
              padding: EdgeInsets.all(
                SizeData.s10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    color: ColorProviderData.greyBlue2Color
                ),
                borderRadius: BorderRadius.circular(
                  SizeData.s10,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    width: Unit(context).getWidthSize*0.053,
                    endTime != null?
                    AssetsData.clockBlue:
                    AssetsData.clockIcon
                  ),
                  SizedBox(
                    width: SizeData.s8,
                  ),
                  Text(
                    endTime != null
                        ? endTime!.format(context)
                        : LocaleKeys.kSelectHere.tr(),
                    style: endTime != null?
                    StylesProvider.textStyleBlue1ColorR14 :
                    StylesProvider.textStyleGreyBlue1ColorR14,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    AssetsData.arrowDown,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Text(
            LocaleKeys.kOr.tr(),
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isClosed = !isClosed;
                if (isClosed) {
                  startTime = null;
                  endTime = null;
                }
              });
            },
            child: Container(
              width: double.infinity,
              height: Unit(context).getHeightSize*0.059,
              padding: EdgeInsets.all(
                SizeData.s15,
              ),
              decoration: BoxDecoration(
                color:
                isClosed ?
                ColorProviderData.secondary1Color :
                ColorProviderData.greyBlue7Color,
                borderRadius: BorderRadius.circular(
                  SizeData.s10,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    isClosed ?
                    AssetsData.clockIconPink :
                    AssetsData.clockIcon,
                  ),
                  SizedBox(
                    width: SizeData.s4,
                  ),
                  Text(
                    LocaleKeys.kOffClosed.tr(),
                    style: isClosed ?
                    StylesProvider.textStylesProviderecondary4ColorM14 :
                    StylesProvider.textStyleGreyBlue8ColorR14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






