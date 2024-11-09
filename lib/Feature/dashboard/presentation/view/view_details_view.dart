import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/out_line_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/app_bar_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/side_bar_view.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/functions/other_parking_prices_dialog.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/other_parking_prices_card_custom.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/parking_card_custom.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/view_details_text_field_custom.dart';

class ViewDetails extends StatefulWidget {
  const ViewDetails({super.key});

  @override
  State<ViewDetails> createState() => _ViewDetails();
}

class _ViewDetails extends State<ViewDetails> with SingleTickerProviderStateMixin{

  int currentIndex = 0;
  late TabController tabController;

  bool ticketGenerated = false;
  bool invoiceGenerated = false;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.kCustomerDetails.tr(),
                              style: Styles.textStyleGray500R16,
                            ),
                            Icon(
                              Icons.minimize_outlined,
                              color: ColorData.gray300Color,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorData.gray100Color,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kName.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.personalCard,
                          data: 'Mariam Kamel',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kEmail.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.smsIcon,
                          data: 'MariamKamel@mail.com',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kPhone.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.callIcon,
                          data: '+33 659556556',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kCarType.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.carIcon,
                          data: 'Sedan',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kCarBrand.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.carIcon,
                          data: 'BMW',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        SizedBox(
                          width: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kPlateNo.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.plateNoIcon,
                          data: 'ABC-1234',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.kBookingDetails.tr(),
                              style: Styles.textStyleGray500R16,
                            ),
                            Icon(
                              Icons.minimize_outlined,
                              color: ColorData.gray300Color,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorData.gray100Color,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kStartDateTime.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.calendar2Icon,
                          data: '8-13-2024',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.clockIcon,
                          data: '16:00 PM',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kEndDateTime.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.calendar2Icon,
                          data: '8-13-2024',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.clockIcon,
                          data: '16:00 PM',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kParkingType.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.building,
                          data: 'Outdoor',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kStatus.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.category,
                          data: 'confirmed',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.kPassengersAndLuggage.tr(),
                              style: Styles.textStyleGray500R16,
                            ),
                            Icon(
                              Icons.minimize_outlined,
                              color: ColorData.gray300Color,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorData.gray100Color,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Container(
                          height: Unit(context).getHeightSize*0.05,
                          decoration: BoxDecoration(
                            color: ColorData.white6Color,
                            borderRadius: BorderRadius.circular(
                                SizeData.s16
                            ),
                          ),
                          child: TabBar(
                            controller: tabController,
                            onTap: (val){
                              setState(() {
                                currentIndex = val;
                              });
                            },
                            indicator: BoxDecoration(
                              color: ColorData.purple4Color,
                              borderRadius: BorderRadius.circular(
                                SizeData.s8,
                              ),
                            ),
                            padding: EdgeInsets.all(
                              SizeData.s8,
                            ),
                            dividerColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelStyle: Styles.textStyleWhiteR12,
                            unselectedLabelStyle: Styles.textStyleGray400R12,
                            tabs: [
                              Tab(
                                child: Center(
                                  child: Text(
                                    LocaleKeys.kPassengers.tr(),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Center(
                                  child: Text(
                                    LocaleKeys.kLuggage.tr(),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Center(
                                  child: Text(
                                    LocaleKeys.kExtraData.tr(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if(currentIndex == 0) ...[
                          SizedBox(
                            height: SizeData.s16,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.adult,
                            title: LocaleKeys.kAdults.tr(),
                            textData: LocaleKeys.kAge13OrAbove.tr(),
                            number: 3,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorData.white3Color,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.children,
                            title: LocaleKeys.kChildren.tr(),
                            textData: LocaleKeys.kAge2To12.tr(),
                            number: 2,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorData.white3Color,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.infants,
                            title: LocaleKeys.kInfants.tr(),
                            textData: LocaleKeys.kUnder2.tr(),
                            number: 1,
                          ),
                        ],
                        if(currentIndex == 1) ...[
                          SizedBox(
                            height: SizeData.s16,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.bigBag,
                            title: LocaleKeys.kBig.tr(),
                            number: 3,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorData.white3Color,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.mediumBag,
                            title: LocaleKeys.kMedium.tr(),
                            number: 2,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorData.white3Color,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.smallBag,
                            title: LocaleKeys.kSmall.tr(),
                            number: 1,
                          ),
                        ],
                        if(currentIndex == 2) ...[
                          SizedBox(
                            height: SizeData.s16,
                          ),
                          Text(
                            LocaleKeys.kSpecialLuggage.tr(),
                            style: Styles.textStyleGray500R14,
                          ),
                          SizedBox(
                            height: SizeData.s16,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.surfboard,
                            title: LocaleKeys.kSurfboard.tr(),
                            number: 3,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorData.white3Color,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.skiboard,
                            title: LocaleKeys.kSkiBoard.tr(),
                            number: 2,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorData.white3Color,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.golf,
                            title: LocaleKeys.kGolf.tr(),
                            number: 1,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorData.white3Color,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.bicycle,
                            title: LocaleKeys.kBicycle.tr(),
                            number: 1,
                          ),
                          SizedBox(
                            height: SizeData.s16,
                          ),
                          Text(
                            LocaleKeys.kPets.tr(),
                            style: Styles.textStyleGray500R14,
                          ),
                          SizedBox(
                            height: SizeData.s16,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.cat,
                            title: LocaleKeys.kCats.tr(),
                            number: 3,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorData.white3Color,
                          ),
                          SizedBox(
                            height: SizeData.s8,
                          ),
                          tabBarComponent(
                            context: context,
                            icon: AssetsProviderData.dog,
                            title: LocaleKeys.kDogs.tr(),
                            number: 2,
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.kShuttleDetails.tr(),
                              style: Styles.textStyleGray500R16,
                            ),
                            Icon(
                              Icons.minimize_outlined,
                              color: ColorData.gray300Color,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorData.gray100Color,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                            SizeData.s16,
                          ),
                          decoration: BoxDecoration(
                            color: ColorData.whiteColor,
                            borderRadius: BorderRadius.circular(
                              SizeData.s8,
                            ),
                            border: Border.all(
                              color: ColorData.gray100Color,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.kFirstTransfer.tr(),
                                style: Styles.textStyleGray500R16,
                              ),
                              SizedBox(
                                height: SizeData.s16,
                              ),
                              Text(
                                LocaleKeys.kDate.tr(),
                                style: Styles.textStyleGray500R14,
                              ),
                              SizedBox(
                                height: SizeData.s4,
                              ),
                              ViewDetailsTextFieldCustom(
                                icon: AssetsProviderData.calendar2Icon,
                                data: '8-13-2024',
                              ),
                              SizedBox(
                                height: SizeData.s8,
                              ),
                              Text(
                                LocaleKeys.kTime.tr(),
                                style: Styles.textStyleGray500R14,
                              ),
                              SizedBox(
                                height: SizeData.s4,
                              ),
                              ViewDetailsTextFieldCustom(
                                icon: AssetsProviderData.clockIcon,
                                data: '16:00 PM',
                              ),
                              SizedBox(
                                height: SizeData.s8,
                              ),
                              Text(
                                LocaleKeys.kDriverName.tr(),
                                style: Styles.textStyleGray500R14,
                              ),
                              SizedBox(
                                height: SizeData.s4,
                              ),
                              ViewDetailsTextFieldCustom(
                                icon: AssetsProviderData.personalCard,
                                data: 'Adam Jhon (Internal)',
                              ),
                              SizedBox(
                                height: SizeData.s8,
                              ),
                              SizedBox(
                                width: SizeData.s8,
                              ),
                              Text(
                                LocaleKeys.kPhone.tr(),
                                style: Styles.textStyleGray500R14,
                              ),
                              SizedBox(
                                height: SizeData.s4,
                              ),
                              ViewDetailsTextFieldCustom(
                                icon: AssetsProviderData.callIcon,
                                data: '+33 659556556',
                              ),
                              SizedBox(
                                height: SizeData.s8,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                            SizeData.s16,
                          ),
                          decoration: BoxDecoration(
                            color: ColorData.whiteColor,
                            borderRadius: BorderRadius.circular(
                              SizeData.s8,
                            ),
                            border: Border.all(
                              color: ColorData.gray100Color,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.kSecondTransfer.tr(),
                                style: Styles.textStyleGray500R16,
                              ),
                              SizedBox(
                                height: SizeData.s16,
                              ),
                              Text(
                                LocaleKeys.kDate.tr(),
                                style: Styles.textStyleGray500R14,
                              ),
                              SizedBox(
                                height: SizeData.s4,
                              ),
                              ViewDetailsTextFieldCustom(
                                icon: AssetsProviderData.calendar2Icon,
                                data: '8-13-2024',
                              ),
                              SizedBox(
                                height: SizeData.s8,
                              ),
                              Text(
                                LocaleKeys.kTime.tr(),
                                style: Styles.textStyleGray500R14,
                              ),
                              SizedBox(
                                height: SizeData.s4,
                              ),
                              ViewDetailsTextFieldCustom(
                                icon: AssetsProviderData.clockIcon,
                                data: '16:00 PM',
                              ),
                              SizedBox(
                                height: SizeData.s8,
                              ),
                              Text(
                                LocaleKeys.kDriverName.tr(),
                                style: Styles.textStyleGray500R14,
                              ),
                              SizedBox(
                                height: SizeData.s4,
                              ),
                              ViewDetailsTextFieldCustom(
                                icon: AssetsProviderData.personalCard,
                                data: 'Adam Jhon (Internal)',
                              ),
                              SizedBox(
                                height: SizeData.s8,
                              ),
                              SizedBox(
                                width: SizeData.s8,
                              ),
                              Text(
                                LocaleKeys.kPhone.tr(),
                                style: Styles.textStyleGray500R14,
                              ),
                              SizedBox(
                                height: SizeData.s4,
                              ),
                              ViewDetailsTextFieldCustom(
                                icon: AssetsProviderData.callIcon,
                                data: '+33 659556556',
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
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.kPaymentDetails.tr(),
                              style: Styles.textStyleGray500R16,
                            ),
                            Icon(
                              Icons.minimize_outlined,
                              color: ColorData.gray300Color,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorData.gray100Color,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kPaymentWay.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.money,
                          data: 'Cash',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kPrice.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.money2,
                          data: '26.20',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kPaid.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.money,
                          data: 'Paid',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kPromoCode.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.discount,
                          data: '------',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.kDocumentation.tr(),
                              style: Styles.textStyleGray500R16,
                            ),
                            Icon(
                              Icons.minimize_outlined,
                              color: ColorData.gray300Color,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorData.gray100Color,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        ticketGenerated ?
                        Container(
                          padding: EdgeInsets.all(
                            SizeData.s16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              SizeData.s8,
                            ),
                            border: Border.all(
                              color: ColorData.gray100Color,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AssetsProviderData.documentTextIcon,
                                    width: Unit(context).getWidthSize*0.055,
                                  ),
                                  SizedBox(
                                    width: SizeData.s8,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Doc_1.PDF',
                                        style: Styles.textStyleGray700R12,
                                      ),
                                      Text(
                                        "200 KB",
                                        style: Styles.textStyleGray300R10,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          LocaleKeys.kClickToView.tr(),
                                          style: Styles.textStyleGray3SB12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: SizeData.s8,
                                  ),
                                  Expanded(
                                    child: OutLineButtonCustom(
                                      onTap: (){},
                                      text: LocaleKeys.kDownload.tr(),
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
                                      text: LocaleKeys.kSendToClient.tr(),
                                      prefix: AssetsProviderData.send,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ):
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                            SizeData.s16,
                          ),
                          decoration: BoxDecoration(
                            color: ColorData.whiteColor,
                            borderRadius: BorderRadius.circular(
                              SizeData.s8,
                            ),
                            border: Border.all(
                              color: ColorData.gray100Color,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.kTicket.tr(),
                                      style: Styles.textStyleGray500M14,
                                    ),
                                    SizedBox(
                                      height: SizeData.s4,
                                    ),
                                    Text(
                                      LocaleKeys.kHereYouCanGenerateYourTicket.tr(),
                                      style: Styles.textStyleGray400R12,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: SizeData.s16,
                              ),
                              Expanded(
                                child: MainButtonCustom(
                                  onTap: (){
                                    setState(() {
                                      ticketGenerated = true;
                                    });
                                  },
                                  isProvider: true,
                                  text: LocaleKeys.kGenerate.tr(),
                                  prefix: AssetsProviderData.addIcon,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        invoiceGenerated ?
                        Container(
                          padding: EdgeInsets.all(
                            SizeData.s16,
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
                            children: [
                              SvgPicture.asset(
                                AssetsProviderData.documentTextIcon,
                                width: Unit(context).getWidthSize*0.055,
                              ),
                              SizedBox(
                                width: SizeData.s8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Doc_1.PDF',
                                    style: Styles.textStyleGray700R12,
                                  ),
                                  Text(
                                    "200 KB",
                                    style: Styles.textStyleGray300R10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      LocaleKeys.kClickToView.tr(),
                                      style: Styles.textStyleGray3SB12,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: SizeData.s8,
                              ),
                              Expanded(
                                child: OutLineButtonCustom(
                                  onTap: (){},
                                  text: LocaleKeys.kDownload.tr(),
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
                                  text: LocaleKeys.kSendToClient.tr(),
                                  prefix: AssetsProviderData.send,
                                ),
                              ),
                            ],
                          ),
                        ):
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                            SizeData.s16,
                          ),
                          decoration: BoxDecoration(
                            color: ColorData.whiteColor,
                            borderRadius: BorderRadius.circular(
                              SizeData.s8,
                            ),
                            border: Border.all(
                              color: ColorData.gray100Color,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.kInvoice.tr(),
                                      style: Styles.textStyleGray500M14,
                                    ),
                                    SizedBox(
                                      height: SizeData.s4,
                                    ),
                                    Text(
                                      LocaleKeys.kHereYouCanGenerateYourInvoice.tr(),
                                      style: Styles.textStyleGray400R12,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: MainButtonCustom(
                                  onTap: (){
                                    setState(() {
                                      invoiceGenerated = true;
                                    });
                                  },
                                  isProvider: true,
                                  text: LocaleKeys.kGenerate.tr(),
                                  prefix: AssetsProviderData.addIcon,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.kCreationDetails.tr(),
                              style: Styles.textStyleGray500R16,
                            ),
                            Icon(
                              Icons.minimize_outlined,
                              color: ColorData.gray300Color,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorData.gray100Color,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kCreatedBy.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          data: 'username Parkorus + name',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kSourceOfRequest.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          data: 'Client phone',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kReservedAt.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.calendar2Icon,
                          data: '09/07/2024',
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        ViewDetailsTextFieldCustom(
                          icon: AssetsProviderData.clockIcon,
                          data: '06:50 PM',
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                        Text(
                          LocaleKeys.kSourceLink.tr(),
                          style: Styles.textStyleBlue500R14,
                        ),
                        SizedBox(
                          height: SizeData.s16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.kSideNotes.tr(),
                              style: Styles.textStyleGray500R16,
                            ),
                            Icon(
                              Icons.minimize_outlined,
                              color: ColorData.gray300Color,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Divider(
                          thickness: 1,
                          color: ColorData.gray100Color,
                        ),
                        SizedBox(
                          height: SizeData.s8,
                        ),
                        Text(
                          LocaleKeys.kComment.tr(),
                          style: Styles.textStyleGray500R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        ViewDetailsTextFieldCustom(
                          height: Unit(context).getHeightSize*0.24,
                          data: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad',
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


  Widget tabBarComponent({
    required BuildContext context,
    required String icon,
    required String title,
    String? textData,
    required int number,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(
            SizeData.s8,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorData.purple3Color
          ),
          width: Unit(context).getWidthSize*0.15,
          child: SvgPicture.asset(
            icon,
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
                title,
                style: Styles.textStyleGray600R14,
              ),
              if(textData != null) ...[
                SizedBox(
                  height: SizeData.s4,
                ),
                Text(
                  textData,
                  style: Styles.textStyleGrayR12,
                ),
              ],
            ],
          ),
        ),
        const Spacer(),
        Text(
         '$number',
          style: Styles.textStyleGrey400R16,
        ),
        SizedBox(
          width: SizeData.s8,
        ),
      ],
    );
  }
}
