import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/out_line_button_custom.dart';

class BookingCardCustom extends StatelessWidget {

  String parkingName;
  String parkingCode;
  double price;

  String confirmed;
  String outdoor;

  String shuttle;

  String startDate;
  String endDate;

  String clientName;
  String firstCarDetails;
  String secondCarDetails;

  String luggage;
  String passengers;

  String firstFlight;
  String secondFlight;

  BookingCardCustom({
    super.key,
    required this.parkingName,
    required this.parkingCode,
    required this.price,
    required this.confirmed,
    required this.outdoor,
    required this.shuttle,
    required this.startDate,
    required this.endDate,
    required this.clientName,
    required this.firstCarDetails,
    required this.secondCarDetails,
    required this.luggage,
    required this.passengers,
    required this.firstFlight,
    required this.secondFlight,
  });

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        SizeData.s16,
      ),
      margin: EdgeInsets.symmetric(
        vertical: SizeData.s4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeData.s12,
        ),
        border: Border.all(
          color: ColorData.gray100Color,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeData.s16,
          ),
          Row(
            children: [
              Text(
                parkingName,
                style: Styles.textStyleGray600M16,
              ),
              SizedBox(
                width: SizeData.s2,
              ),
              VerticalDivider(
                thickness: 1,
                color: ColorData.gray600Color,
              ),
              SizedBox(
                width: SizeData.s2,
              ),
              Text(
                parkingCode,
                style: Styles.textStyleGray600M16,
              ),
              const Spacer(),
              Text(
                '€$price',
                style: Styles.textStyleGray600M16,
              ),
            ],
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeData.s8,
                  vertical: SizeData.s4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    SizeData.s4,
                  ),
                  color: ColorData.purple4Color,
                ),
                child: Text(
                  confirmed,
                  style: Styles.textStyleWhiteR12,
                ),
              ),
              SizedBox(
                width: SizeData.s4,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeData.s8,
                  vertical: SizeData.s4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    SizeData.s4,
                  ),
                  color: ColorData.purple2Color,
                ),
                child: Text(
                  outdoor,
                  style: Styles.textStylePrimaryPR10,
                ),
              ),
              SizedBox(
                width: SizeData.s4,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeData.s8,
                  vertical: SizeData.s4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    SizeData.s4,
                  ),
                  color: ColorData.purple2Color,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AssetsProviderData.carPurple,
                      //width: Unit(context).getWidthSize*0.03,
                    ),
                    VerticalDivider(
                      thickness: 1,
                      color: ColorData.primaryP6Color,
                    ),
                    Text(
                      '2X',
                      style: Styles.textStylePrimaryPR10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: SizeData.s4,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeData.s8,
                  vertical: SizeData.s4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    SizeData.s4,
                  ),
                  color: ColorData.purple2Color,
                ),
                child: Text(
                  shuttle,
                  style: Styles.textStylePrimaryPR10,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeData.s16,
          ),
          rowData(
            context: context,
            icon: AssetsProviderData.calendar2Icon,
            title: LocaleKeys.kStartDate.tr(),
            textData: startDate,
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          rowData(
            context: context,
            icon: AssetsProviderData.calendar2Icon,
            title: LocaleKeys.kEndDate.tr(),
            textData: endDate,
          ),
          SizedBox(
            height: SizeData.s4,
          ),
          Divider(
            thickness: 1,
            color: ColorData.white3Color,
          ),
          SizedBox(
            height: SizeData.s4,
          ),
          rowData(
            context: context,
            icon: AssetsProviderData.documentTextIcon,
            title: LocaleKeys.kClientName.tr(),
            textData: clientName,
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          rowData(
            context: context,
            icon: AssetsProviderData.carIcon,
            title: LocaleKeys.kFirstCar.tr(),
            textData: firstCarDetails,
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          rowData(
            context: context,
            icon: AssetsProviderData.carIcon,
            title: LocaleKeys.kSecondCar.tr(),
            textData: secondCarDetails,
          ),
          SizedBox(
            height: SizeData.s4,
          ),
          Divider(
            thickness: 1,
            color: ColorData.white3Color,
          ),
          SizedBox(
            height: SizeData.s4,
          ),
          rowData(
            context: context,
            icon: AssetsProviderData.luggageIcon,
            title: LocaleKeys.kLuggage.tr(),
            textData: luggage,
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          rowData(
            context: context,
            icon: AssetsProviderData.passengersIcon,
            title: LocaleKeys.kPassengers.tr(),
            textData: passengers,
          ),
          SizedBox(
            height: SizeData.s16,
          ),
          Divider(
            thickness: 1,
            color: ColorData.white3Color,
          ),
          SizedBox(
            height: SizeData.s4,
          ),
          rowData(
            context: context,
            icon: AssetsProviderData.luggageIcon,
            title: LocaleKeys.kFirstFlight.tr(),
            textData: firstFlight,
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          rowData(
            context: context,
            icon: AssetsProviderData.passengersIcon,
            title: LocaleKeys.kSecondFlight.tr(),
            textData: secondFlight,
          ),
          SizedBox(
            height: SizeData.s16,
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
                  text: LocaleKeys.kViewDetails.tr(),
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_vert_outlined),
              ),
            ],
          ),
          SizedBox(
            height: SizeData.s16,
          ),
          Row(
            children: [
              Expanded(
                child: OutLineButtonCustom(
                  onTap: (){},
                  text: LocaleKeys.kReject.tr(),
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
                  text: LocaleKeys.kAccept.tr(),
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget rowData({
    required BuildContext context,
    required String icon,
    required String title,
    required String textData,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: Unit(context).getWidthSize*0.05,
        ),
        SizedBox(
          width: SizeData.s8,
        ),
        Text(
          title,
          style: Styles.textStyleGray400R12,
        ),
        SizedBox(
          width: SizeData.s8,
        ),
        Text(
          textData,
          style: Styles.textStyleGrayBlueM12,
        ),
      ],
    );
  }
}






