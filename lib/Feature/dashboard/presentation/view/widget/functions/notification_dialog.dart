import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/functions/all_set_dialog.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';

import '../../../../../../Core/unit/assets_data.dart';
import '../../../../../../Core/widget/provider_app/input_fields/input_text_custom.dart';
import '../notification_card_custom.dart';
import '../other_parking_prices_card_custom.dart';

buildNotificationDialog({required BuildContext context,}) {

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
                        LocaleKeys.kNotifications.tr(),
                        style: Styles.textStyleGray600R16,
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
                                AssetsProviderData.readIcon,
                              ),
                              SizedBox(
                                width: SizeData.s8,
                              ),
                              Text(
                                LocaleKeys.kRead.tr(),
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
                  NotificationCardCustom(
                    notification: 'Important Reminder: there are new reservations in “parking Name” that need to be confirmed',
                    time: '24min ago',
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  NotificationCardCustom(
                    notification: 'Important Reminder: there are new reservations in “parking Name” that need to be confirmed',
                    time: '24min ago',
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  NotificationCardCustom(
                    notification: 'Important Reminder: there are new reservations in “parking Name” that need to be confirmed',
                    time: '24min ago',
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  NotificationCardCustom(
                    notification: 'Important Reminder: there are new reservations in “parking Name” that need to be confirmed',
                    time: '24min ago',
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
