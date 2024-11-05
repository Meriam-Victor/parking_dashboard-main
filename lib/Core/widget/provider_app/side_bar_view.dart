import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/functions/notification_dialog.dart';

buildSideBar({required BuildContext context,}) {

  return Drawer(
    backgroundColor: ColorData.whiteColor,
    child: ListView(
      padding: EdgeInsets.all(
        SizeData.s16,
      ),
      children: [
        DrawerHeader(
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  //personal view
                  GoRouter.of(context).push(AppRouter.kPersonalDetailsView);
                },
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: const AssetImage(
                    AssetsProviderData.personalCard,
                  ),
                  backgroundColor: ColorData.gray300Color,
                ),
              ),
              SizedBox(
                width: SizeData.s16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome,',
                      style: Styles.textStyleGray500R12,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    Text(
                      'User Name',
                      style: Styles.textStyleGray700M16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: SvgPicture.asset(
            AssetsProviderData.dashboardIcon,
          ),
          title: Text(
            LocaleKeys.kDashboard.tr(),
            style: Styles.textStyleGray500R16,
          ),
          onTap: () {
            GoRouter.of(context).push(AppRouter.kDashboard);
          },
        ),
        ListTile(
          leading: SvgPicture.asset(
            AssetsProviderData.listingIcon,
          ),
          title: Text(
            LocaleKeys.kListing.tr(),
            style: Styles.textStyleGray500R16,
          ),
          onTap: () {
            //notification
            buildNotificationDialog(context: context);
          },
        ),
        ListTile(
          leading: SvgPicture.asset(
            AssetsProviderData.calendarTickIcon,
          ),
          title: Text(
            LocaleKeys.kBookings.tr(),
            style: Styles.textStyleGray500R16,
          ),
          onTap: () {

          },
        ),
        ListTile(
          leading: SvgPicture.asset(
            AssetsProviderData.calendarIcon,
          ),
          title: Text(
            LocaleKeys.kPlanning.tr(),
            style: Styles.textStyleGray500R16,
          ),
          onTap: () {},
        ),
        ExpansionTile(
          leading: SvgPicture.asset(
            AssetsProviderData.carIcon,
          ),
          title: Text(
            LocaleKeys.kShuttle.tr(),
            style: Styles.textStyleGray500R16,
          ),
          children: [
            ListTile(
              title: const Text('Shuttle Option 1'),
              onTap: () {

              },
            ),
            ListTile(
              title: const Text('Shuttle Option 2'),
              onTap: () {
              },
            ),
          ],
        ),

        ListTile(
          leading: SvgPicture.asset(
            AssetsProviderData.reviewsIcon,
          ),
          title: Text(
            LocaleKeys.kReviews.tr(),
            style: Styles.textStyleGray500R16,
          ),
          onTap: () {},
        ),





        ListTile(
          leading: SvgPicture.asset(
            AssetsProviderData.messagesIcon,
          ),
          title: Row(
            children: [
              Text(
                LocaleKeys.kMessages.tr(),
                style: Styles.textStyleGray500R16,
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(
                  SizeData.s10,
                ),
                decoration: BoxDecoration(
                  color: ColorData.purple3Color,
                  borderRadius: BorderRadius.circular(
                    SizeData.s16,
                  ),
                ),
                child: Text(
                  '22',
                  style: Styles.textStyleSecondary1R12,
                ),
              ),
            ],
          ),
          onTap: () {},
        ),
        Divider(
          thickness: SizeData.s02,
        ),
        SizedBox(
          height: SizeData.s40,
        ),
        ListTile(
          leading: SvgPicture.asset(
            AssetsProviderData.helpCenterIcon,
          ),
          title: Text(
            LocaleKeys.kHelpCentre.tr(),
            style: Styles.textStyleGray500R16,
          ),
          onTap: () {},
        ),

        ListTile(
          leading: SvgPicture.asset(
            AssetsProviderData.logoutIcon,
          ),
          title: Text(
            LocaleKeys.kLogOut.tr(),
            style: Styles.textStyleDangerR16,
          ),
          onTap: () {},
        ),
      ],
    ),
  );

}