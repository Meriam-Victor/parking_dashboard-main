import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/app_bar_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/side_bar_view.dart';
import 'package:parking_dashboard/Feature/calender/presentation/view/all_booking_calender_view.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _Calender();
}

class _Calender extends State<Calender> {

  DateTime today = DateTime.now();

  Set<DateTime> bookedDays = {
    DateTime(2024, 11, 2),
    DateTime(2024, 11, 6),
    DateTime(2024, 11, 18),
    DateTime(2024, 11, 22),
  };

  void _onDaySelected(DateTime day, DateTime focusedDay){
    if (bookedDays.any((d) => isSameDay(d, day))) {
      setState(() {
        today = day;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AllBookingCalenderView(date: day),
        ),
      );
    } else {
      setState(() {
        today = day;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildSideBar(context: context),
      backgroundColor: ColorData.whiteColor,
      body: Column(
        children: [
          AppBarProviderCustom(
            title: LocaleKeys.kLogIn.tr(),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(
                SizeData.s16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kCreateBooking);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(
                        SizeData.s16,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeData.s16,
                      ),
                      decoration: BoxDecoration(
                        color: ColorData.whiteColor,
                        borderRadius: BorderRadius.circular(
                          SizeData.s16,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ColorData.grayShadow3Color,
                            spreadRadius: -2,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                          BoxShadow(
                            color: ColorData.grayShadow4Color,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.kCreateBooking.tr(),
                            style: Styles.textStyleSecondary1R16,
                          ),
                          SizedBox(
                            width: SizeData.s8,
                          ),
                          SvgPicture.asset(
                            AssetsProviderData.calendarPink,
                          ),
                        ],
                      ),
                    ),
                  ),
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: today,
                    rowHeight: Unit(context).getHeightSize*0.15,
                    daysOfWeekHeight: Unit(context).getHeightSize*0.15,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: Styles.textStyleGray600R20,
                    ),
                    calendarStyle: CalendarStyle(
                      cellMargin: EdgeInsets.zero,
                      isTodayHighlighted: false,
                      selectedTextStyle: Styles.textStyleGrey500R18,
                      defaultTextStyle: Styles.textStyleGrey500R18,
                      weekendTextStyle: Styles.textStyleGrey500R18,
                      outsideTextStyle: Styles.textStyleGray200R18,
                      tableBorder: TableBorder(
                        horizontalInside: BorderSide(
                          width: 1,
                          color: ColorData.white3Color,
                        ),
                        verticalInside: BorderSide(
                          width: 1,
                          color: ColorData.white3Color,
                        ),
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: Styles.textStyleGrey500R18,
                      weekendStyle: Styles.textStyleGrey500R18,
                    ),
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    availableGestures: AvailableGestures.none,
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, date, _) {
                        bool isBooked = bookedDays.any((d) => isSameDay(d, date));
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Center(
                              child: Text(
                                '${date.day}',
                                style: Styles.textStyleGrey500R18,
                              ),
                            ),
                            if (isBooked)
                              Positioned(
                                bottom: 5,
                                child: Icon(
                                  Icons.circle,
                                  color: ColorData.danger5Color,
                                  size: SizeData.s8,
                                ),
                              ),
                          ],
                        );
                      },
                      selectedBuilder: (context, date, _) {
                        bool isBooked = bookedDays.any((d) => isSameDay(d, date));
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorData.purple3Color,
                                border: Border.all(
                                  width: 1,
                                  color: ColorData.secondary5Color,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${date.day}',
                                style: Styles.textStyleGrey500R18,
                              ),
                            ),
                            if (isBooked)
                              Positioned(
                                bottom: 5,
                                child: Icon(
                                  Icons.circle,
                                  color: ColorData.danger5Color,
                                  size: SizeData.s8,
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    onDaySelected: _onDaySelected,
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
