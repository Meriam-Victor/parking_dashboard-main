import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Feature/calender/presentation/view/widget/booking_card_custom.dart';
import 'package:parking_dashboard/Feature/reservation/presentation/view/widget/functions/filter_bookings_sheet.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/widget/provider_app/app_bar_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/drop_down_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/side_bar_view.dart';

class AllBookingReservationView extends StatefulWidget {

  const AllBookingReservationView({super.key,});

  @override
  State<AllBookingReservationView> createState() => _AllBookingReservationView();
}

class _AllBookingReservationView extends State<AllBookingReservationView> with SingleTickerProviderStateMixin {

  List<String> allParkingList = [
    LocaleKeys.kAllParking.tr(),
  ];

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

  int currentIndex = 0;
  late TabController tabController;


  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  bool isConfirmed = false;
  bool isUncompleted = false;
  bool isWaitingConfirmation = false;
  bool isCancelled = false;
  bool isRequestOfExtension = false;

  _buildFilterBookingsSheet(){
    showModalBottomSheet(
      backgroundColor: ColorData.whiteColor,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeData.s16),
            topRight: Radius.circular(SizeData.s16),
          )
      ),
      builder: (context) => const FilterBookingsSheet());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: buildSideBar(context: context),
      backgroundColor: ColorData.whiteColor,
      body: Column(
        children: [
          AppBarProviderCustom(
            title: LocaleKeys.kAllBookings.tr(),
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
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Container(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: DropDownFiledCustom(
                                hintText: LocaleKeys.kSelectHere.tr(),
                                isProvider: true,
                                items: allParkingList.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                },
                              ),
                            ),
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            Expanded(
                              flex: 3,
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
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                        rowData(
                          context: context,
                          icon: AssetsProviderData.calendarTickIcon,
                          state: 'Confirmed',
                          number: '0',
                          percentage: '- 00 %',
                          isClicked: isConfirmed,
                          onTap: (){
                            setState(() {
                              isConfirmed = !isConfirmed;
                            });
                          },
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        rowData(
                          context: context,
                          icon: AssetsProviderData.calendarTickIcon,
                          state: 'Uncompleted',
                          number: '12500',
                          percentage: '+ 36 %',
                          isClicked: isUncompleted,
                          onTap: (){
                            setState(() {
                              isUncompleted = !isUncompleted;
                            });
                          },
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        rowData(
                          context: context,
                          icon: AssetsProviderData.timerPause,
                          state: 'Waiting Confirmation',
                          number: '12500',
                          percentage: '+ 36 %',
                          isClicked: isWaitingConfirmation,
                          onTap: (){
                            setState(() {
                              isWaitingConfirmation = !isWaitingConfirmation;
                            });
                          },
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        rowData(
                          context: context,
                          icon: AssetsProviderData.calendarTickIcon,
                          state: 'Cancelled',
                          number: '12500',
                          percentage: '+ 36 %',
                          isClicked: isCancelled,
                          onTap: (){
                            setState(() {
                              isCancelled = !isCancelled;
                            });
                          },
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        rowData(
                          context: context,
                          icon: AssetsProviderData.calendarTickIcon,
                          state: 'Request of Extension',
                          number: '12500',
                          percentage: '+ 36 %',
                          isClicked: isRequestOfExtension,
                          onTap: (){
                            setState(() {
                              isRequestOfExtension = !isRequestOfExtension;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      SizeData.s16,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeData.s16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SizeData.s8,
                      ),
                      border: Border.all(
                        color: ColorData.gray100Color,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              LocaleKeys.kAllBookings.tr(),
                              style: Styles.textStyleGray500M18,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeData.s8,
                                    horizontal: SizeData.s16
                                ),
                                decoration: BoxDecoration(
                                    color: ColorData.whiteColor,
                                    borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                    ),
                                    border: Border.all(
                                      color: ColorData.gray100Color,
                                    )
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsProviderData.searchIcon,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeData.s8,
                                    horizontal: SizeData.s16
                                ),
                                decoration: BoxDecoration(
                                    color: ColorData.whiteColor,
                                    borderRadius: BorderRadius.circular(
                                      SizeData.s8,
                                    ),
                                    border: Border.all(
                                      color: ColorData.gray100Color,
                                    )
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AssetsProviderData.printGrayIcon,
                                    ),
                                    SizedBox(
                                      width: SizeData.s8,
                                    ),
                                    Text(
                                      LocaleKeys.kPrint.tr(),
                                      style: Styles.textStyleGray600R12,
                                    ),
                                  ],
                                ),
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
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  _buildFilterBookingsSheet();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: SizeData.s8,
                                      horizontal: SizeData.s16
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorData.whiteColor,
                                      borderRadius: BorderRadius.circular(
                                        SizeData.s8,
                                      ),
                                      border: Border.all(
                                        color: ColorData.gray100Color,
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AssetsProviderData.readIcon,
                                      ),
                                      SizedBox(
                                        width: SizeData.s8,
                                      ),
                                      Text(
                                        LocaleKeys.kFilter.tr(),
                                        style: Styles.textStyleGray600R12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Container(
                          height: Unit(context).getHeightSize*0.06,
                          decoration: BoxDecoration(
                            color: ColorData.white6Color,
                            borderRadius: BorderRadius.circular(
                              SizeData.s12,
                            ),
                          ),
                          child: TabBar(
                            controller: tabController,
                            onTap: (val){
                              setState(() {
                                currentIndex = val;
                              });
                            },
                            padding: EdgeInsets.all(
                              SizeData.s8,
                            ),
                            indicator: BoxDecoration(
                              color: ColorData.purple1Color,
                              borderRadius: BorderRadius.circular(
                                SizeData.s8,
                              ),
                            ),
                            dividerColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelStyle: Styles.textStyleWhiteR12,
                            unselectedLabelStyle: Styles.textStyleGray400R12,
                            tabs: [
                              Tab(
                                child: Center(
                                  child: Text(
                                    LocaleKeys.kCheckOutToday.tr(),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Center(
                                  child: Text(
                                    LocaleKeys.kCheckInToday.tr(),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Center(
                                  child: Text(
                                    LocaleKeys.kCreatedToday.tr(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ...List.generate(
                            2,
                                (index){
                              return BookingCardCustom(
                                parkingName: 'Parking Name',
                                parkingCode: 'TX37403',
                                price: 24.0,
                                confirmed: 'confirmed',
                                outdoor: 'Outdoor',
                                shuttle: 'shuttle',
                                startDate: '7/30/2024 9:30 AM',
                                endDate: '7/30/2024 9:30 AM',
                                clientName: 'Mohamed',
                                firstCarDetails: 'Sedan ,BMW',
                                secondCarDetails: 'Sedan ,BMW',
                                luggage: '3 Bags',
                                passengers: '2 Adults',
                                firstFlight: 'sv390',
                                secondFlight: 'sv390',
                              );
                            }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget rowData({
    required BuildContext context,
    required String icon,
    required String state,
    required String number,
    required String percentage,
    required bool isClicked,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          SizeData.s8,
        ),
        decoration: BoxDecoration(
          color: isClicked ?
          ColorData.purple3Color :
          ColorData.whiteColor,
          borderRadius: BorderRadius.circular(
            SizeData.s8,
          ),
          border: Border.all(
            color: isClicked ?
            ColorData.secondary5Color :
            ColorData.gray100Color,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(
                SizeData.s8,
              ),
              decoration: BoxDecoration(
                color: isClicked ?
                ColorData.secondary4Color.withOpacity(0.6) :
                ColorData.white3Color.withOpacity(0.6),
                borderRadius: BorderRadius.circular(
                  SizeData.s8,
                ),
              ),
              child: SvgPicture.asset(
                icon,
              ),
            ),
            SizedBox(
              width: SizeData.s16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state,
                  style: Styles.textStyleGray600R12,
                ),
                SizedBox(
                  height: SizeData.s8,
                ),
                Text(
                  number,
                  style: Styles.textStyleGrey600M14,
                ),
              ],
            ),
            const Spacer(),
            Text(
              percentage,
              style: percentage == '- 00 %' ?
              Styles.textStyleDanger3R14:
              Styles.textStyleGreenR14,
            ),
            SizedBox(
              width: SizeData.s4,
            ),
            percentage == '- 00 %' ?
            Icon(
              Icons.arrow_downward,
              size: Unit(context).getWidthSize*0.04,
              color: ColorData.danger3Color,
            ):
            Icon(
              Icons.arrow_upward,
              size: Unit(context).getWidthSize*0.04,
              color: ColorData.greenColor,
            ),
          ],
        ),
      ),
    );
  }

}






