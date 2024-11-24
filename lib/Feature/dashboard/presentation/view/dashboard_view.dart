import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/app_bar_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/side_bar_view.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/functions/other_parking_prices_dialog.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/other_parking_prices_card_custom.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/parking_card_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/drop_down_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/input_text_custom.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {

  TextEditingController searchController = TextEditingController();

  List<String> allParkingList = [
    LocaleKeys.kAllParking.tr(),
  ];

  DateTimeRange? _selectedDate1Range;
  DateTimeRange? _selectedDate2Range;

  DateTime? _selectedFromDate;
  DateTime? _selectedToDate;

  void _showDate1RangePicker() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDateRange: _selectedDate1Range,
    );
    if (picked != null && picked != _selectedDate1Range) {
      setState(() {
        _selectedDate1Range = picked;
      });
    }
  }

  void _showDate2RangePicker() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDateRange: _selectedDate2Range,
    );
    if (picked != null && picked != _selectedDate2Range) {
      setState(() {
        _selectedDate2Range = picked;
      });
    }
  }

  void _showFromDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: _selectedFromDate,
    );
    if (picked != null && picked != _selectedFromDate) {
      setState(() {
        _selectedFromDate = picked;
      });
    }
  }

  void _showToDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: _selectedToDate,
    );
    if (picked != null && picked != _selectedToDate) {
      setState(() {
        _selectedToDate = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat("dd MMM").format(date);
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            Text(
                              LocaleKeys.kUpcomingBookings.tr(),
                              style: Styles.textStyleGray3M16,
                            ),
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                SizeData.s8,
                              ),
                              decoration: BoxDecoration(
                                color: ColorData.purple3Color,
                                borderRadius: BorderRadius.circular(
                                  SizeData.s12,
                                ),
                              ),
                              child: Text(
                                '5 News',
                                style: Styles.textStyleSecondary1R12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        SizedBox(
                          height: kToolbarHeight,
                          child: Row(
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
                                  onTap: _showDate1RangePicker,
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
                                          _selectedDate1Range != null
                                              ? '${_formatDate(_selectedDate1Range!.start)} - ${_formatDate(_selectedDate1Range!.end)}'
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
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                        ...List.generate(
                            2,
                            (index){
                              return ParkingCardCustom(
                                parkingName: 'Parking Name',
                                parkingCode: 'TX37403',
                                price: 24.0,
                                outdoor: 'Outdoor',
                                startDate: '7/30/2024 9:30 AM',
                                endDate: '7/30/2024 9:30 AM',
                                carDetails: 'Sedan ,BMW - 3 Series ',
                                plateNumber: 'ABC-1234',
                                luggage: '3 Bags',
                                passengers: '2 Adults',
                                withShuttle: true,
                              );
                            }
                        ),

                        SizedBox(
                          height: SizeData.s16,
                        ),
                        GestureDetector(
                          onTap: (){
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                LocaleKeys.kSeeMore.tr(),
                                style: Styles.textStyleSecondary1M14,
                              ),
                              SizedBox(
                                width: SizeData.s4,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ColorData.secondary1Color,
                              ),
                            ],
                          ),
                        ),
            
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      SizeData.s16,
                    ),
                    margin: EdgeInsets.all(
                      SizeData.s16,
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
                            Text(
                              LocaleKeys.kOtherParkingPrices.tr(),
                              style: Styles.textStyleGray3M16,
                            ),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: SizeData.s8,
                                horizontal: SizeData.s16
                              ),
                              decoration: BoxDecoration(
                                color: ColorData.purple4Color,
                                borderRadius: BorderRadius.circular(
                                  SizeData.s8,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '5 k.m',
                                    style: Styles.textStyleWhiteR14,
                                  ),
                                  VerticalDivider(
                                    thickness: 1.0,
                                    color: ColorData.whiteColor,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: ColorData.whiteColor,
                                  ),
            
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        InputTextCustom(
                          controller: searchController,
                          hintText: LocaleKeys.kSearchParkingName.tr(),
                          prefix: Padding(
                            padding: EdgeInsets.all(
                              SizeData.s12,
                            ),
                            child: SvgPicture.asset(
                              AssetsProviderData.searchIcon,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        ...List.generate(
                            2, (index){
                          return OtherParkingPricesCardCustom(
                            parkingName: 'Parking Name',
                            location: '62 Uruwat Al-Rijal Street, After Lafa Grilled Food',
                            price: '€2,0000',
                            parkingRating: 3.0,
                            );
                          }
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                        GestureDetector(
                          onTap: (){
                            buildOtherParkingPricesDialog(context: context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                LocaleKeys.kSeeMore.tr(),
                                style: Styles.textStyleSecondary1M14,
                              ),
                              SizedBox(
                                width: SizeData.s4,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ColorData.secondary1Color,
                              ),
                            ],
                          ),
                        ),
            
                      ],
                    ),
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
                      color: ColorData.primaryP7Color,
                      borderRadius: BorderRadius.circular(
                        SizeData.s16,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: kToolbarHeight,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: DropDownFiledCustom(
                                  color: ColorData.primaryP7Color,
                                  hintText: LocaleKeys.kSelectHere.tr(),
                                  hintTextStyle: Styles.textStyleWhiteR14,
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
                                  onTap: _showDate2RangePicker,
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      SizeData.s8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorData.primaryP7Color,
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
                                          color: ColorData.whiteColor,
                                          size: Unit(context).getWidthSize*0.055,
                                        ),
                                        SizedBox(
                                          width: SizeData.s8,
                                        ),
                                        Text(
                                          _selectedDate2Range != null
                                              ? '${_formatDate(_selectedDate2Range!.start)} - ${_formatDate(_selectedDate2Range!.end)}'
                                              : LocaleKeys.kSelectDate.tr(),
                                          style: Styles.textStyleWhiteR14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: squareCard(
                                context: context,
                                icon: AssetsProviderData.parkingAvailable,
                                textData: LocaleKeys.kAvailableParkingSpot.tr(),
                                number: 12500,
                                percentage: '+ 36 %'
                              ),
                            ),
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            Expanded(
                              child: squareCard(
                                  context: context,
                                  icon: AssetsProviderData.numberOfBookings,
                                  textData: LocaleKeys.kNumberOfBookings.tr(),
                                  number: 12500,
                                  percentage: '+ 36 %'
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
                              child: squareCard(
                                  context: context,
                                  icon: AssetsProviderData.cancelBooking,
                                  textData: LocaleKeys.kCancelBooking.tr(),
                                  number: 12500,
                                  percentage: '+ 36 %'
                              ),
                            ),
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            Expanded(
                              child: squareCard(
                                  context: context,
                                  icon: AssetsProviderData.numberOfCars,
                                  textData: LocaleKeys.kNumberOfCars.tr(),
                                  number: 12500,
                                  percentage: '+ 36 %'
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
                              child: squareCard(
                                  context: context,
                                  icon: AssetsProviderData.totalIncomes,
                                  textData: LocaleKeys.kTotalIncomes.tr(),
                                  number: 12500,
                                  percentage: '+ 36 %'
                              ),
                            ),
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            Expanded(
                              child: squareCard(
                                  context: context,
                                  icon: AssetsProviderData.netIncome,
                                  textData: LocaleKeys.kNetIncome.tr(),
                                  number: 12500,
                                  percentage: '+ 36 %'
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
                              child: squareCard(
                                  context: context,
                                  icon: AssetsProviderData.numberOfTransfers,
                                  textData: LocaleKeys.kNumberOfTransfers.tr(),
                                  number: 12500,
                                  percentage: '+ 36 %'
                              ),
                            ),
                            SizedBox(
                              width: SizeData.s8,
                            ),
                            Expanded(
                              child: squareCard(
                                  context: context,
                                  icon: AssetsProviderData.fees,
                                  textData: LocaleKeys.kFees.tr(),
                                  number: 12500,
                                  percentage: '+ 36 %'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      SizeData.s16,
                    ),
                    margin: EdgeInsets.all(
                      SizeData.s16,
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
                        Text(
                          LocaleKeys.kCompareProfit.tr(),
                          style: Styles.textStyleGray3M16,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        SizedBox(
                          height: kToolbarHeight,
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: _showFromDatePicker,
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
                                          _selectedFromDate != null
                                              ? _formatDate(_selectedFromDate!)
                                              : LocaleKeys.kFrom.tr(),
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
                                  onTap: _showToDatePicker,
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
                                          _selectedToDate != null
                                              ? _formatDate(_selectedToDate!)
                                              : LocaleKeys.kTo.tr(),
                                          style: Styles.textStyleGray500R14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                        Row(
                          children: [
                            Text(
                              'This year',
                              style: Styles.textStyleGray400R12,
                            ),
                            Expanded(
                              child: LinearPercentIndicator(
                                lineHeight: SizeData.s8,
                                backgroundColor: ColorData.white3Color,
                                progressColor: ColorData.green4Color,
                                percent: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Row(
                          children: [
                            Text(
                              '2023',
                              style: Styles.textStyleGray400R12,
                            ),
                            Expanded(
                              child: LinearPercentIndicator(
                                lineHeight: SizeData.s8,
                                backgroundColor: ColorData.white3Color,
                                progressColor: ColorData.blue500Color,
                                percent: 0.8,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Row(
                          children: [
                            Text(
                              '2022',
                              style: Styles.textStyleGray400R12,
                            ),
                            Expanded(
                              child: LinearPercentIndicator(
                                lineHeight: SizeData.s8,
                                backgroundColor: ColorData.white3Color,
                                progressColor: ColorData.yellow5Color,
                                percent: 0.7,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Row(
                          children: [
                            Text(
                              '2021',
                              style: Styles.textStyleGray400R12,
                            ),
                            Expanded(
                              child: LinearPercentIndicator(
                                lineHeight: SizeData.s8,
                                backgroundColor: ColorData.white3Color,
                                progressColor: ColorData.yellow6Color,
                                percent: 0.6,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                            SizeData.s16
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: SizeData.s8,
                                backgroundColor: ColorData.green4Color,
                              ),
                              SizedBox(
                                width: SizeData.s12,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '5.987,34',
                                    style: Styles.textStyleGray700SB18,
                                  ),
                                  SizedBox(
                                    height: SizeData.s4,
                                  ),
                                  Text(
                                    'This year',
                                    style: Styles.textStyleGray400R12,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              CircleAvatar(
                                radius: SizeData.s8,
                                backgroundColor: ColorData.blue500Color,
                              ),
                              SizedBox(
                                width: SizeData.s12,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '5.987,34',
                                    style: Styles.textStyleGray700SB18,
                                  ),
                                  SizedBox(
                                    height: SizeData.s4,
                                  ),
                                  Text(
                                    '2023',
                                    style: Styles.textStyleGray400R12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              SizeData.s16
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: SizeData.s8,
                                backgroundColor: ColorData.yellow5Color,
                              ),
                              SizedBox(
                                width: SizeData.s12,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '5.987,34',
                                    style: Styles.textStyleGray700SB18,
                                  ),
                                  SizedBox(
                                    height: SizeData.s4,
                                  ),
                                  Text(
                                    '2022',
                                    style: Styles.textStyleGray400R12,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              CircleAvatar(
                                radius: SizeData.s8,
                                backgroundColor: ColorData.yellow6Color,
                              ),
                              SizedBox(
                                width: SizeData.s12,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '5.987,34',
                                    style: Styles.textStyleGray700SB18,
                                  ),
                                  SizedBox(
                                    height: SizeData.s4,
                                  ),
                                  Text(
                                    '2021',
                                    style: Styles.textStyleGray400R12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        rowComponent(
                          context: context,
                          textData: LocaleKeys.kNumberOfShuttles.tr(),
                          number: '5.987,34',
                          percentage: '+1.51% this year',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        rowComponent(
                          context: context,
                          textData: LocaleKeys.kIncomes.tr(),
                          number: '5.987,34',
                          percentage: '+1.51% this year',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        rowComponent(
                          context: context,
                          textData: LocaleKeys.kFees.tr(),
                          number: '5.987,34',
                          percentage: '+1.51% this year',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        rowComponent(
                          context: context,
                          textData: LocaleKeys.kNumberOfBookings.tr(),
                          number: '5.987,34',
                          percentage: '+1.51% this year',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        rowComponent(
                          context: context,
                          textData: LocaleKeys.kTotalReservation.tr(),
                          number: '5.987,34',
                          percentage: '+1.51% this year',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        rowComponent(
                          context: context,
                          textData: LocaleKeys.kCancelBooking.tr(),
                          number: '5.987,34',
                          percentage: '+1.51% this year',
                        ),
                        SizedBox(
                          height: SizeData.s8,
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
  Widget squareCard({
    required BuildContext context,
    required String icon,
    required textData,
    required int number,
    required String percentage,
  }) {
    return Container(
      padding: EdgeInsets.all(
        SizeData.s8,
      ),
      decoration: BoxDecoration(
        color: ColorData.whiteColor,
        borderRadius: BorderRadius.circular(
          SizeData.s16,
        ),
      ),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(
                SizeData.s8,
              ),
              decoration: BoxDecoration(
                color: ColorData.purple3Color,
                borderRadius: BorderRadius.circular(
                  SizeData.s8,
                ),
              ),
              width: Unit(context).getWidthSize*0.1,
              child: SvgPicture.asset(
                icon,
              ),
            ),
            SizedBox(
              height: SizeData.s8,
            ),
            Text(
              textData,
              style: Styles.textStyleGray400R12,
            ),
            SizedBox(
              height: SizeData.s8,
            ),
            Row(
              children: [
                Text(
                  '$number',
                  style: Styles.textStyleGray3SB16,
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
          ],
        ),
      ),
    );
  }


  Widget rowComponent({
    required BuildContext context,
    required textData,
    required String number,
    required String percentage,
  }) {
    return Container(
      padding: EdgeInsets.all(
        SizeData.s16,
      ),
      decoration: BoxDecoration(
        color: ColorData.whiteColor,
        borderRadius: BorderRadius.circular(
          SizeData.s12,
        ),
        border: Border.all(
          color: ColorData.gray100Color,
        ),
      ),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textData,
              style: Styles.textStyleGray400R12,
            ),
            SizedBox(
              height: SizeData.s8,
            ),
            Row(
              children: [
                Text(
                  number,
                  style: Styles.textStyleGray700SB18,
                ),
                const Spacer(),
                Text(
                  percentage,
                  style: Styles.textStyleGray400R12,
                ),
                SizedBox(
                  width: SizeData.s4,
                ),
                percentage == '- 00 %' ?
                Icon(
                  Icons.arrow_outward,
                  size: Unit(context).getWidthSize*0.04,
                  color: ColorData.danger3Color,
                ):
                Icon(
                  Icons.arrow_outward,
                  size: Unit(context).getWidthSize*0.04,
                  color: ColorData.greenColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
