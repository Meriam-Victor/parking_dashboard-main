import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Feature/calender/presentation/view/widget/booking_card_custom.dart';

class AllBookingView extends StatefulWidget {
  final DateTime date;

  const AllBookingView({super.key, required this.date});

  @override
  State<AllBookingView> createState() => _AllBookingView();
}

class _AllBookingView extends State<AllBookingView> {

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMMM dd, yyyy').format(widget.date);

    return Scaffold(
      backgroundColor: ColorData.whiteColor,
      appBar: AppBar(
        title: Text(
          formattedDate,
          style: Styles.textStyleGray700R16,
        ),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(
            SizeData.s16,
          ),
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
    );
  }
}
