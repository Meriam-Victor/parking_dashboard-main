import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/input_text_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/app_bar_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/side_bar_view.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/drop_down_custom.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/functions/other_parking_prices_dialog.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/other_parking_prices_card_custom.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/parking_card_custom.dart';

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
                                child: DropDownFieldProviderCustom(
                                  hintText: LocaleKeys.kSelectHere.tr(),
                                  icon: SvgPicture.asset(
                                    AssetsProviderData.arrowDown,
                                  ),
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
                        InputTextProviderCustom(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
