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
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/functions/side_bar_view.dart';

import '../../../../Core/widget/provider_app/input_fields/drop_down_custom.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {

  List<String> allParkingList = [
    LocaleKeys.kAllParking.tr(),
  ];

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
            child: Container(
              width: Unit(context).getWidthSize*0.96,
              height: Unit(context).getHeightSize*0.831,
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
              child: SingleChildScrollView(
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
                    Row(
                      children: [
                        Expanded(
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



                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
