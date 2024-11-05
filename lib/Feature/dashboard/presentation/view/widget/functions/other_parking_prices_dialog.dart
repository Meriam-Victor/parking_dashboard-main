import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/input_text_custom.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/other_parking_prices_card_custom.dart';

buildOtherParkingPricesDialog({required BuildContext context,}) {

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeData.s16,
          ),
        ),
        backgroundColor: ColorData.whiteColor,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(
                SizeData.s16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    controller: TextEditingController(),
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
                      6, (index){
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
                ],
              ),
            ),
            Positioned(
              bottom: -25.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius: SizeData.s20,
                  backgroundColor: ColorData.whiteColor,
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
