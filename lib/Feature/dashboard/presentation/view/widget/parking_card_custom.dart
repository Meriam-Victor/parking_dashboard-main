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

class ParkingCardCustom extends StatelessWidget {

  String parkingName;
  String parkingCode;
  double price;
  String outdoor;
  String startDate;
  String endDate;
  bool? withShuttle;
  String carDetails;
  String plateNumber;
  String luggage;
  String passengers;


  ParkingCardCustom({
    super.key,
    required this.parkingName,
    required this.parkingCode,
    required this.price,
    required this.outdoor,
    this.withShuttle,
    required this.startDate,
    required this.endDate,
    required this.carDetails,
    required this.plateNumber,
    required this.luggage,
    required this.passengers,
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
          ClipRRect(
            borderRadius: BorderRadius.circular(
              SizeData.s12,
            ),
            child: Image.asset(
              AssetsProviderData.parking,
              width: double.infinity,
            ),
          ),
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
                  outdoor,
                  style: Styles.textStyleWhiteR12,
                ),
              ),
              SizedBox(
                width: SizeData.s4,
              ),
              if (withShuttle??false)
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
                    LocaleKeys.kWithShuttle.tr(),
                    style: Styles.textStylePurple4R12,
                  ),
                ),
            ],
          ),
          SizedBox(
            height: SizeData.s16,
          ),
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                color: ColorData.gray400Color,
                size: Unit(context).getWidthSize*0.05,
              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                LocaleKeys.kStartDate.tr(),
                style: Styles.textStyleGray400R12,
              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                startDate,
                style: Styles.textStyleGrayBlueM12,
              ),
            ],
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Row(
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
                LocaleKeys.kEndDate.tr(),
                style: Styles.textStyleGray400R12,
              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                startDate,
                style: Styles.textStyleGrayBlueM12,
              ),
            ],
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
          Row(
            children: [
              SvgPicture.asset(
                AssetsProviderData.carIcon,
                width: Unit(context).getWidthSize*0.05,

              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                LocaleKeys.kCarDetails.tr(),
                style: Styles.textStyleGray400R12,
              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                carDetails,
                style: Styles.textStyleGrayBlueM12,
              ),
            ],
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AssetsProviderData.plateNoIcon,
                width: Unit(context).getWidthSize*0.05,

              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                LocaleKeys.kPlateNo.tr(),
                style: Styles.textStyleGray400R12,
              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                plateNumber,
                style: Styles.textStyleGrayBlueM12,
              ),
            ],
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
          Row(
            children: [
              SvgPicture.asset(
                AssetsProviderData.luggageIcon,
                width: Unit(context).getWidthSize*0.05,

              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                LocaleKeys.kLuggage.tr(),
                style: Styles.textStyleGray400R12,
              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                luggage,
                style: Styles.textStyleGrayBlueM12,
              ),
            ],
          ),
          SizedBox(
            height: SizeData.s8,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AssetsProviderData.passengersIcon,
                width: Unit(context).getWidthSize*0.05,

              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                LocaleKeys.kPassengers.tr(),
                style: Styles.textStyleGray400R12,
              ),
              SizedBox(
                width: SizeData.s8,
              ),
              Text(
                passengers,
                style: Styles.textStyleGrayBlueM12,
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
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kViewDetails);
                  },
                  isProvider: true,
                  text: LocaleKeys.kViewDetails.tr(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}






