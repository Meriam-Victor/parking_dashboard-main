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
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/drop_down_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fileds/input_text_custom.dart';
import 'package:parking_dashboard/Feature/calender/presentation/view/widget/functions/assign_driver_dialog.dart';
import 'package:parking_dashboard/Feature/dashboard/presentation/view/widget/view_details_text_field_custom.dart';

class CreateBooking extends StatefulWidget {
  const CreateBooking({super.key});

  @override
  State<CreateBooking> createState() => _CreateBooking();
}

class _CreateBooking extends State<CreateBooking> with SingleTickerProviderStateMixin{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController plateNoController = TextEditingController();

  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  TextEditingController firstTransferDateController = TextEditingController();
  TextEditingController firstTransferTimeController = TextEditingController();
  TextEditingController secondTransferDateController = TextEditingController();
  TextEditingController secondTransferTimeController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  TextEditingController clientPhoneController = TextEditingController();
  TextEditingController reservedAtDateController = TextEditingController();
  TextEditingController reservedAtTimeController = TextEditingController();

  TextEditingController commentController = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode plateNoNode = FocusNode();

  FocusNode startDateNode = FocusNode();
  FocusNode startTimeNode = FocusNode();
  FocusNode endDateNode = FocusNode();
  FocusNode endTimeNode = FocusNode();

  FocusNode firstTransferDateNode = FocusNode();
  FocusNode firstTransferTimeNode = FocusNode();
  FocusNode secondTransferDateNode = FocusNode();
  FocusNode secondTransferTimeNode = FocusNode();

  FocusNode priceNode = FocusNode();
  FocusNode clientPhoneNode = FocusNode();
  FocusNode reservedAtDateNode = FocusNode();
  FocusNode reservedAtTimeNode = FocusNode();

  FocusNode commentNode = FocusNode();


  int currentIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.whiteColor,
      appBar: AppBar(
        title: Text(
          LocaleKeys.kReferenceId.tr(),
          style: Styles.textStyleGray700R16,
        ),
      ),
      body: SingleChildScrollView(
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
                color: ColorData.primaryPColor,
                borderRadius: BorderRadius.circular(
                  SizeData.s16,
                ),
              ),
              child: Text(
                LocaleKeys.kNewBooking.tr(),
                style: Styles.textStyleWhiteR16,
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
                  InputTextCustom(
                    controller: nameController,
                    focusNode: nameNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(emailNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.personalCard,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  InputTextCustom(
                    controller: emailController,
                    focusNode: emailNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(phoneNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.smsIcon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  InputTextCustom(
                    controller: phoneController,
                    focusNode: phoneNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(plateNoNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.callIcon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  DropDownFiledCustom(
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.only(
                        right: SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.carIcon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  DropDownFiledCustom(
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.only(
                        right: SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.carIcon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  InputTextCustom(
                    controller: plateNoController,
                    focusNode: plateNoNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(startDateNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.plateNoIcon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  InputTextCustom(
                    controller: startDateController,
                    focusNode: startDateNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(startTimeNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.calendar2Icon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  InputTextCustom(
                    controller: startTimeController,
                    focusNode: startTimeNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(endDateNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.clockIcon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  InputTextCustom(
                    controller: endDateController,
                    focusNode: endDateNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(endTimeNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.calendar2Icon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  InputTextCustom(
                    controller: endTimeController,
                    focusNode: endTimeNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(firstTransferDateNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.clockIcon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  DropDownFiledCustom(
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.only(
                        right: SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.building,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  DropDownFiledCustom(
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.only(
                        right: SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.category,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                        InputTextCustom(
                          controller: firstTransferDateController,
                          focusNode: firstTransferDateNode,
                          onEditingComplete: ()=>FocusScope.of(context).requestFocus(firstTransferTimeNode),
                          hintText: LocaleKeys.kTypeHere.tr(),
                          prefix: Padding(
                            padding: EdgeInsets.all(
                              SizeData.s12,
                            ),
                            child: SvgPicture.asset(
                              AssetsProviderData.calendar2Icon,
                              width: Unit(context).getWidthSize*0.06,
                            ),
                          ),
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
                        InputTextCustom(
                          controller: firstTransferTimeController,
                          focusNode: firstTransferTimeNode,
                          onEditingComplete: ()=>FocusScope.of(context).requestFocus(secondTransferDateNode),
                          hintText: LocaleKeys.kTypeHere.tr(),
                          prefix: Padding(
                            padding: EdgeInsets.all(
                              SizeData.s12,
                            ),
                            child: SvgPicture.asset(
                              AssetsProviderData.clockIcon,
                              width: Unit(context).getWidthSize*0.06,
                            ),
                          ),
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
                                LocaleKeys.kDrivers.tr(),
                                style: Styles.textStyleGray500M16,
                              ),
                              SizedBox(
                                height: SizeData.s8,
                              ),
                              Text(
                                LocaleKeys.kHereYouCanAssignDriverToSecondTripShuttle.tr(),
                                style: Styles.textStyleGray400R14,
                              ),
                              SizedBox(
                                height: SizeData.s16,
                              ),
                              MainButtonCustom(
                                onTap: (){
                                  buildAssignDriversDialog(
                                    context: context,
                                    title: LocaleKeys.kFirstTransfer.tr(),
                                    firstTransferDateController: firstTransferDateController,
                                    firstTransferTimeController: firstTransferTimeController,
                                    secondTransferDateController: secondTransferDateController,
                                    secondTransferTimeController: secondTransferTimeController,
                                  );
                                },
                                isProvider: true,
                                text: LocaleKeys.kAssignDriver.tr(),
                                prefix: AssetsProviderData.addIcon,
                              ),
                            ],
                          ),
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
                        InputTextCustom(
                          controller: secondTransferDateController,
                          focusNode: secondTransferDateNode,
                          onEditingComplete: ()=>FocusScope.of(context).requestFocus(secondTransferTimeNode),
                          hintText: LocaleKeys.kTypeHere.tr(),
                          prefix: Padding(
                            padding: EdgeInsets.all(
                              SizeData.s12,
                            ),
                            child: SvgPicture.asset(
                              AssetsProviderData.calendar2Icon,
                              width: Unit(context).getWidthSize*0.06,
                            ),
                          ),
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
                        InputTextCustom(
                          controller: secondTransferTimeController,
                          focusNode: secondTransferTimeNode,
                          onEditingComplete: ()=>FocusScope.of(context).requestFocus(priceNode),
                          hintText: LocaleKeys.kTypeHere.tr(),
                          prefix: Padding(
                            padding: EdgeInsets.all(
                              SizeData.s12,
                            ),
                            child: SvgPicture.asset(
                              AssetsProviderData.clockIcon,
                              width: Unit(context).getWidthSize*0.06,
                            ),
                          ),
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
                                LocaleKeys.kDrivers.tr(),
                                style: Styles.textStyleGray500M16,
                              ),
                              SizedBox(
                                height: SizeData.s8,
                              ),
                              Text(
                                LocaleKeys.kHereYouCanAssignDriverToSecondTripShuttle.tr(),
                                style: Styles.textStyleGray400R14,
                              ),
                              SizedBox(
                                height: SizeData.s16,
                              ),
                              MainButtonCustom(
                                onTap: (){
                                  buildAssignDriversDialog(
                                    context: context,
                                    title: LocaleKeys.kSecondTransfer.tr(),
                                    firstTransferDateController: firstTransferDateController,
                                    firstTransferTimeController: firstTransferTimeController,
                                    secondTransferDateController: secondTransferDateController,
                                    secondTransferTimeController: secondTransferTimeController,
                                  );
                                },
                                isProvider: true,
                                text: LocaleKeys.kAssignDriver.tr(),
                                prefix: AssetsProviderData.addIcon,
                              ),
                            ],
                          ),
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
                  DropDownFiledCustom(
                    hintText: LocaleKeys.kSelectHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.only(
                        right: SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.money,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  InputTextCustom(
                    controller: priceController,
                    focusNode: priceNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(clientPhoneNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.money2,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  DropDownFiledCustom(
                    hintText: LocaleKeys.kSelectHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.only(
                        right: SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.money,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  DropDownFiledCustom(
                    hintText: '------',
                    prefix: Padding(
                      padding: EdgeInsets.only(
                        right: SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.discount,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.kDocumentation.tr(),
                    style: Styles.textStyleGray500R16,
                  ),
                  Icon(
                    Icons.add,
                    color: ColorData.gray300Color,
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
                    icon: AssetsProviderData.userIcon,
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
                  InputTextCustom(
                    controller: clientPhoneController,
                    focusNode: clientPhoneNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(reservedAtDateNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.userIcon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  InputTextCustom(
                    controller: reservedAtDateController,
                    focusNode: reservedAtDateNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(reservedAtTimeNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.calendar2Icon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  InputTextCustom(
                    controller: reservedAtTimeController,
                    focusNode: reservedAtTimeNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(commentNode),
                    hintText: LocaleKeys.kTypeHere.tr(),
                    prefix: Padding(
                      padding: EdgeInsets.all(
                        SizeData.s12,
                      ),
                      child: SvgPicture.asset(
                        AssetsProviderData.clockIcon,
                        width: Unit(context).getWidthSize*0.06,
                      ),
                    ),
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
                  InputTextCustom(
                    controller: commentController,
                    focusNode: commentNode,
                    onEditingComplete: ()=>FocusScope.of(context).requestFocus(),
                    hintText: LocaleKeys.kTypeHere.tr(),
                  ),
                ],
              ),
            ),
          ],
        ),
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
