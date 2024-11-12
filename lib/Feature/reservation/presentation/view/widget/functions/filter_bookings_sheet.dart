import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_button/group_button.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/drop_down_custom.dart';

import '../../../../../../Core/widget/provider_app/buttons/main_button_custom.dart';
import '../../../../../../Core/widget/provider_app/buttons/out_line_button_custom.dart';

class FilterBookingsSheet extends StatefulWidget {
  const FilterBookingsSheet({super.key});

  @override
  State<FilterBookingsSheet> createState() => _FilterBookingsSheetState();
}

class _FilterBookingsSheetState extends State<FilterBookingsSheet> {

  DateTimeRange? _selectedDateRange;

  void _showDateRangePicker() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDateRange: _selectedDateRange,
    );
    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat("dd MMM").format(date);
  }

  bool startDateAllSelected = true;
  bool startDateTodaySelected = false;
  bool startDateYesterdaySelected = false;
  bool startDateTomorrowSelected = false;

  bool endDateAllSelected = true;
  bool endDateTodaySelected = false;
  bool endDateYesterdaySelected = false;
  bool endDateTomorrowSelected = false;

  GroupButtonController statusCheckController = GroupButtonController();

  List<bool> statusCheckBoxList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> statusTextList = [
    LocaleKeys.kAll.tr(),
    LocaleKeys.kConfirmed.tr(),
    LocaleKeys.kUncompleted.tr(),
    LocaleKeys.kWaitingConf.tr(),
    LocaleKeys.kRequestCancelled.tr(),
    LocaleKeys.kCancelled.tr(),
    LocaleKeys.kRequestOfExtension.tr(),
  ];

  bool createdAtDateAllSelected = true;
  bool createdAtDateTodaySelected = false;
  bool createdAtDateYesterdaySelected = false;
  bool createdAtDatePast7DaysSelected = false;
  bool createdAtDateThisMonthSelected = false;
  bool createdAtDateThisYearSelected = false;

  GroupButtonController servicesCheckController = GroupButtonController();

  List<bool> servicesCheckBoxList = [
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> servicesTextList = [
    LocaleKeys.kAll.tr(),
    LocaleKeys.kShuttle.tr(),
    LocaleKeys.kSecurityCamera.tr(),
    LocaleKeys.kCarWash.tr(),
    LocaleKeys.kEV.tr(),
  ];

  GroupButtonController shuttleDriverCheckController = GroupButtonController();

  List<bool> shuttleDriverCheckBoxList = [
    false,
    false,
    false,
  ];

  List<String> shuttleDriverTextList = [
    LocaleKeys.kAll.tr(),
    LocaleKeys.kAssigned.tr(),
    LocaleKeys.kUnassigned.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(
        SizeData.s8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AssetsProviderData.readIcon,
                width: Unit(context).getWidthSize*0.07,
              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                LocaleKeys.kFilter.tr(),
                style: Styles.textStyleGrey600R16,
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: SizeData.s24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: ColorData.gray100Color,
          ),
          Text(
            LocaleKeys.kParkingName.tr(),
            style: Styles.textStyleGray500R16,
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          DropDownFiledCustom(
            hintText: LocaleKeys.kSelectHere.tr(),
            isProvider: true,
          ),
          SizedBox(
            height: SizeData.s16,
          ),
          Text(
            LocaleKeys.kStartDate.tr(),
            style: Styles.textStyleGray500R16,
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Wrap(
            spacing: SizeData.s8,
            runSpacing: SizeData.s8,
            children: [
              SizedBox(
                height: Unit(context).getHeightSize*0.058,
                child: GestureDetector(
                  onTap: _showDateRangePicker,
                  child: Container(
                    padding: EdgeInsets.all(
                      SizeData.s8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SizeData.s8,
                      ),
                      border: Border.all(
                        color: ColorData.gray100Color,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: ColorData.gray400Color,
                          size: Unit(context).getWidthSize*0.055,
                        ),
                        SizedBox(
                          width: SizeData.s8,
                        ),
                        Text(
                          _selectedDateRange != null
                              ? '${_formatDate(_selectedDateRange!.start)} - ${_formatDate(_selectedDateRange!.end)}'
                              : LocaleKeys.kSelectDate.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              dateButton(
                text: LocaleKeys.kAllDates.tr(),
                isSelected: startDateAllSelected,
                onTap: () {
                  setState(() {
                    startDateAllSelected = !startDateAllSelected;
                  });
                }
              ),
              dateButton(
                text: LocaleKeys.kToday.tr(),
                isSelected: startDateTodaySelected,
                onTap: () {
                  setState(() {
                    startDateTodaySelected = !startDateTodaySelected;
                  });
                }
              ),
              dateButton(
                  text: LocaleKeys.kYesterday.tr(),
                  isSelected: startDateYesterdaySelected,
                  onTap: () {
                    setState(() {
                      startDateYesterdaySelected = !startDateYesterdaySelected;
                    });
                  }
              ),
              dateButton(
                  text: LocaleKeys.kTomorrow.tr(),
                  isSelected: startDateTomorrowSelected,
                  onTap: () {
                    setState(() {
                      startDateTomorrowSelected = !startDateTomorrowSelected;
                    });
                  }
              ),
            ],
          ),
          SizedBox(
            height: SizeData.s16,
          ),
          Text(
            LocaleKeys.kEndDate.tr(),
            style: Styles.textStyleGray500R16,
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Wrap(
            spacing: SizeData.s8,
            runSpacing: SizeData.s8,
            children: [
              SizedBox(
                height: Unit(context).getHeightSize*0.058,
                child: GestureDetector(
                  onTap: _showDateRangePicker,
                  child: Container(
                    padding: EdgeInsets.all(
                      SizeData.s8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SizeData.s8,
                      ),
                      border: Border.all(
                        color: ColorData.gray100Color,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: ColorData.gray400Color,
                          size: Unit(context).getWidthSize*0.055,
                        ),
                        SizedBox(
                          width: SizeData.s8,
                        ),
                        Text(
                          _selectedDateRange != null
                              ? '${_formatDate(_selectedDateRange!.start)} - ${_formatDate(_selectedDateRange!.end)}'
                              : LocaleKeys.kSelectDate.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              dateButton(
                  text: LocaleKeys.kAllDates.tr(),
                  isSelected: endDateAllSelected,
                  onTap: () {
                    setState(() {
                      endDateAllSelected = !endDateAllSelected;
                    });
                  }
              ),
              dateButton(
                  text: LocaleKeys.kToday.tr(),
                  isSelected: endDateTodaySelected,
                  onTap: () {
                    setState(() {
                      endDateTodaySelected = !endDateTodaySelected;
                    });
                  }
              ),
              dateButton(
                  text: LocaleKeys.kYesterday.tr(),
                  isSelected: endDateYesterdaySelected,
                  onTap: () {
                    setState(() {
                      endDateYesterdaySelected = !endDateYesterdaySelected;
                    });
                  }
              ),
              dateButton(
                  text: LocaleKeys.kTomorrow.tr(),
                  isSelected: endDateTomorrowSelected,
                  onTap: () {
                    setState(() {
                      endDateTomorrowSelected = !endDateTomorrowSelected;
                    });
                  }
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: ColorData.gray100Color,
          ),
          Text(
            LocaleKeys.kStatus.tr(),
            style: Styles.textStyleGray500R16,
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          GroupButton(
            controller: statusCheckController,
            isRadio: false,
            enableDeselect: true,
            options: GroupButtonOptions(
              groupingType: GroupingType.column,
              runSpacing: SizeData.s4,
            ),
            buttonIndexedBuilder: (isSelected, index, context){
              return GestureDetector(
                onTap: () {
                  setState(() {
                    statusCheckBoxList[index] = true;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: statusCheckBoxList[index],
                      activeColor: ColorData.blue500Color,
                      side: BorderSide(
                        width: SizeData.s1,
                        color: ColorData.gray200Color,
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          statusCheckBoxList[index] = !statusCheckBoxList[index];
                        });
                      },
                    ),
                    SizedBox(
                      width: SizeData.s8,
                    ),
                    Text(
                      statusTextList[index],
                      style: Styles.textStyleGray500R14,
                    ),
                  ],
                ),
              );
            },
            onSelected: (_, index, selected) {
            },
            buttons: statusTextList,
          ),
          Divider(
            thickness: 1,
            color: ColorData.gray100Color,
          ),
          Text(
            LocaleKeys.kCreatedAt.tr(),
            style: Styles.textStyleGray500R16,
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Wrap(
            spacing: SizeData.s8,
            runSpacing: SizeData.s8,
            children: [
              createdAtButton(
                  text: LocaleKeys.kAllDates.tr(),
                  isSelected: createdAtDateAllSelected,
                  onTap: () {
                    setState(() {
                      createdAtDateAllSelected = !createdAtDateAllSelected;
                    });
                  }
              ),
              createdAtButton(
                  text: LocaleKeys.kToday.tr(),
                  isSelected: createdAtDateTodaySelected,
                  onTap: () {
                    setState(() {
                      createdAtDateTodaySelected = !createdAtDateTodaySelected;
                    });
                  }
              ),
              createdAtButton(
                  text: LocaleKeys.kYesterday.tr(),
                  isSelected: createdAtDateYesterdaySelected,
                  onTap: () {
                    setState(() {
                      createdAtDateYesterdaySelected = !createdAtDateYesterdaySelected;
                    });
                  }
              ),
              createdAtButton(
                  text: LocaleKeys.kPast7Days.tr(),
                  isSelected: createdAtDatePast7DaysSelected,
                  onTap: () {
                    setState(() {
                      createdAtDatePast7DaysSelected = !createdAtDatePast7DaysSelected;
                    });
                  }
              ),
              createdAtButton(
                  text: LocaleKeys.kThisMonth.tr(),
                  isSelected: createdAtDateThisMonthSelected,
                  onTap: () {
                    setState(() {
                      createdAtDateThisMonthSelected = !createdAtDateThisMonthSelected;
                    });
                  }
              ),
              createdAtButton(
                  text: LocaleKeys.kThisYear.tr(),
                  isSelected: createdAtDateThisYearSelected,
                  onTap: () {
                    setState(() {
                      createdAtDatePast7DaysSelected = !createdAtDatePast7DaysSelected;
                    });
                  }
              ),

            ],
          ),
          Divider(
            thickness: 1,
            color: ColorData.gray100Color,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.kServices.tr(),
                      style: Styles.textStyleGray500R16,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    GroupButton(
                      controller: servicesCheckController,
                      isRadio: false,
                      enableDeselect: true,
                      options: GroupButtonOptions(
                        groupingType: GroupingType.column,
                        runSpacing: SizeData.s4,
                      ),
                      buttonIndexedBuilder: (isSelected, index, context){
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              servicesCheckBoxList[index] = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: servicesCheckBoxList[index],
                                activeColor: ColorData.blue500Color,
                                side: BorderSide(
                                  width: SizeData.s1,
                                  color: ColorData.gray200Color,
                                ),
                                onChanged: (bool? value) {
                                  setState(() {
                                    servicesCheckBoxList[index] = !servicesCheckBoxList[index];
                                  });
                                },
                              ),
                              SizedBox(
                                width: SizeData.s8,
                              ),
                              Text(
                                servicesTextList[index],
                                style: Styles.textStyleGray500R14,
                              ),
                            ],
                          ),
                        );
                      },
                      onSelected: (_, index, selected) {
                      },
                      buttons: servicesTextList,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.kShuttleDriver.tr(),
                      style: Styles.textStyleGray500R16,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    GroupButton(
                      controller: shuttleDriverCheckController,
                      isRadio: false,
                      enableDeselect: true,
                      options: GroupButtonOptions(
                        groupingType: GroupingType.column,
                        runSpacing: SizeData.s4,
                      ),
                      buttonIndexedBuilder: (isSelected, index, context){
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              shuttleDriverCheckBoxList[index] = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: shuttleDriverCheckBoxList[index],
                                activeColor: ColorData.blue500Color,
                                side: BorderSide(
                                  width: SizeData.s1,
                                  color: ColorData.gray200Color,
                                ),
                                onChanged: (bool? value) {
                                  setState(() {
                                    shuttleDriverCheckBoxList[index] = !shuttleDriverCheckBoxList[index];
                                  });
                                },
                              ),
                              SizedBox(
                                width: SizeData.s8,
                              ),
                              Text(
                                shuttleDriverTextList[index],
                                style: Styles.textStyleGray500R14,
                              ),
                            ],
                          ),
                        );
                      },
                      onSelected: (_, index, selected) {
                      },
                      buttons: shuttleDriverTextList,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Row(
            children: [
              Expanded(
                child: OutLineButtonCustom(
                  onTap: (){},
                  text: LocaleKeys.kCancel.tr(),
                  color: ColorData.whiteColor,
                  isProvider: true,
                ),
              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Expanded(
                child: MainButtonCustom(
                  onTap: (){},
                  isProvider: true,
                  text: LocaleKeys.kApply.tr(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dateButton({
    required text,
    required bool isSelected,
    required VoidCallback onTap,
  }){

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          SizeData.s16,
        ),
        decoration: BoxDecoration(
          color: isSelected ?
          ColorData.blue2Color :
          ColorData.whiteColor,
          border: Border.all(
            color: isSelected ?
            ColorData.blue9Color :
            ColorData.gray100Color,
          ),
          borderRadius: BorderRadius.circular(
            SizeData.s8,
          ),
        ),
        child: Text(
          text,
          style: isSelected ?
          Styles.textStyleBlue7M12 :
          Styles.textStyleGray500R12,
        ),
      ),
    );
  }

  Widget createdAtButton({
    required text,
    required bool isSelected,
    required VoidCallback onTap,
  }){

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          right: SizeData.s16,
        ),
        decoration: BoxDecoration(
          color: ColorData.whiteColor,
          border: Border.all(
            color: isSelected ?
            ColorData.blue9Color :
            ColorData.gray100Color,
          ),
          borderRadius: BorderRadius.circular(
            SizeData.s24,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: isSelected,
              activeColor: ColorData.blue500Color,
              shape: const CircleBorder(),
              side: BorderSide(
                width: SizeData.s1,
                color: ColorData.gray200Color,
              ),
              onChanged: (bool? value) {
                onTap();
              },
            ),
            Text(
              text,
              style: Styles.textStyleGray500R12,
            ),
          ],
        ),
      ),
    );
  }

  }

