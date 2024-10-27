import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';

class DayWorkingHours extends StatefulWidget {

  String day;



  DayWorkingHours({
    super.key,
    required this.day,
  });

  @override
  State<DayWorkingHours> createState() => _DayWorkingHours();
}

class _DayWorkingHours extends State<DayWorkingHours> {


  bool isSwitchEnabled = false;

  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool is24Hr = true;

  Future<void> selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          startTime = pickedTime;
          is24Hr = false;
        } else {
          endTime = pickedTime;
          is24Hr = false;

        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(
        SizeData.s12,
      ),
      width: Unit(context).getWidthSize*0.915,
      decoration: BoxDecoration(
        border: Border.all(
          width: SizeData.s1,
          color: ColorData.greyBlue7Color,
        ),
        borderRadius: BorderRadius.circular(
          SizeData.s8,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.day,
                style: Styles.textStyleGreyBlue1ColorR14,
              ),
              SizedBox(
                width: Unit(context).getWidthSize*0.1,
                height: Unit(context).getHeightSize*0.03,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: CupertinoSwitch(
                    value: isSwitchEnabled,
                    activeColor: ColorData.blue1Color,
                    onChanged: (value) {
                      setState(() {
                        isSwitchEnabled = value;
                        if (!value) {
                          startTime = null;
                          endTime = null;
                          is24Hr = false;
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeData.s10,
          ),
          if (isSwitchEnabled) ...[
            Row(
              children: [
                GestureDetector(
                  onTap: () => selectTime(context, true),
                  child: Container(
                    width: Unit(context).getWidthSize*0.4,
                    padding: EdgeInsets.all(
                      SizeData.s10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorData.greyBlue2Color
                      ),
                      borderRadius: BorderRadius.circular(
                          SizeData.s10,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AssetsData.clockIcon,
                        ),
                        SizedBox(
                          width: SizeData.s4,
                        ),
                        Text(
                          startTime != null
                              ? startTime!.format(context)
                              : 'Start Time',
                          style: Styles.textStyleGreyBlue1ColorR12,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => selectTime(context, false),
                  child: Container(
                    width: Unit(context).getWidthSize*0.4,
                    padding: EdgeInsets.all(
                      SizeData.s10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AssetsData.clockIcon,
                        ),
                        SizedBox(
                          width: SizeData.s4,
                        ),
                        Text(
                          endTime != null
                              ? endTime!.format(context)
                              : LocaleKeys.kEndDate.tr(),
                          style: Styles.textStyleGreyBlue1ColorR12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeData.s10,
            ),
            Text(
              LocaleKeys.kOr.tr(),
            ),
            SizedBox(
              height: SizeData.s10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  is24Hr = !is24Hr;
                  if (is24Hr) {
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
                  color: is24Hr ?
                  ColorData.secondary1Color :
                  ColorData.greyBlue7Color,
                  borderRadius: BorderRadius.circular(
                    SizeData.s10,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      is24Hr ?
                      AssetsData.clockIconPink :
                      AssetsData.clockIcon,
                    ),
                    SizedBox(
                      width: SizeData.s4,
                    ),
                    Text(
                      LocaleKeys.k24Hrs.tr(),
                      style: is24Hr ?
                      Styles.textStyleSecondary4ColorM14 :
                      Styles.textStyleGreyBlue8ColorR14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}






