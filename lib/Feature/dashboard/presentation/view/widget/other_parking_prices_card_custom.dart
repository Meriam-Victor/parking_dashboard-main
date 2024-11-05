import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/font_weight_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class OtherParkingPricesCardCustom extends StatelessWidget {

  String parkingName;
  String location;
  String price;
  double parkingRating;

  OtherParkingPricesCardCustom({
    super.key,
    required this.parkingName,
    required this.location,
    required this.price,
    required this.parkingRating,
  });

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Column(
      children: [
        SizedBox(
          height: SizeData.s8,
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                SizeData.s12,
              ),
              child: Image.asset(
                AssetsProviderData.parking2,
              ),
            ),
            SizedBox(
              width: SizeData.s8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parkingName,
                    style: Styles.textStyleGrey600SB14,
                  ),
                  SizedBox(
                    height: SizeData.s4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AssetsProviderData.locationIcon,
                      ),
                      SizedBox(
                        width: SizeData.s4,
                      ),
                      Expanded(
                        child: Text(
                          location,
                          style: Styles.textStyleGray400R12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeData.s4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        RatingBar.builder(
                          initialRating: parkingRating,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: Unit(context).getWidthSize*0.05,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: ColorData.yellow3Color,
                          ),
                          unratedColor: ColorData.gray100Color,
                          onRatingUpdate: (double value) {  },
                      ),
                      Text(
                        price,
                        style: Styles.textStyleGray600SB16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: SizeData.s8,
        ),
        Divider(
          thickness: 1,
          color: ColorData.white3Color,
          indent: 1,
          endIndent: 1,
        ),
        SizedBox(
          height: SizeData.s8,
        ),
      ],
    );
  }
}






