import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/input_text_custom.dart';
import 'package:parking_dashboard/Core/widget/provider_app/input_fields/drop_down_custom.dart';
import 'package:file_picker/file_picker.dart';

class PersonalDetailsView extends StatefulWidget {
  const PersonalDetailsView({super.key});

  @override
  State<PersonalDetailsView> createState() => _PersonalDetailsView();
}

class _PersonalDetailsView extends State<PersonalDetailsView> with SingleTickerProviderStateMixin {

  int currentIndex = 0;
  late TabController tabController;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController shareCapitalController = TextEditingController();
  TextEditingController SIRENController = TextEditingController();
  TextEditingController NICController = TextEditingController();

  TextEditingController contactPhoneController = TextEditingController();
  TextEditingController contactEmailController = TextEditingController();
  TextEditingController contactMessageController = TextEditingController();
  TextEditingController contactWhatsappController = TextEditingController();

  bool phoneChecked = false;
  bool emailChecked = false;
  bool messageChecked = false;
  bool whatsappChecked = false;

  bool subjectToVATChecked = false;
  bool sendDocumentsChecked = false;

  bool filePicked = false;

  PlatformFile? selectedFile1;
  PlatformFile? selectedFile2;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFile1 = result.files.first;
        selectedFile2 = result.files.first;
        filePicked = true;
      });
    } else {
      setState(() {
        filePicked = false;
      });
    }
  }



  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.whiteColor,
      appBar: AppBar(
        title: Text(
          LocaleKeys.kPersonalDetails.tr(),
          style: Styles.textStyleGray700R16,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          SizeData.s16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorData.whiteColor,
                    border: Border.all(
                      width: 5.0,
                      color: ColorData.whiteColor,
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
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: ColorData.white3Color,
                    child: SvgPicture.asset(
                      AssetsProviderData.userIcon,
                      width: Unit(context).getWidthSize*0.17,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 18.0,
                  backgroundColor: ColorData.whiteColor,
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: ColorData.secondaryColor,
                    child: Icon(
                      Icons.edit,
                      color: ColorData.whiteColor,
                      size: Unit(context).getWidthSize*0.05,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeData.s16,
            ),
            Container(
              height: Unit(context).getHeightSize*0.06,
              decoration: BoxDecoration(
                color: ColorData.white6Color,
                borderRadius: BorderRadius.circular(
                    SizeData.s25,
                ),
              ),
              child: TabBar(
                controller: tabController,
                onTap: (val){
                  setState(() {
                    currentIndex = val;
                  });
                },
                padding: EdgeInsets.all(
                  SizeData.s8,
                ),
                indicator: BoxDecoration(
                  color: ColorData.purple1Color,
                  borderRadius: BorderRadius.circular(
                    SizeData.s25,
                  ),
                ),
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: Styles.textStyleWhiteR12,
                unselectedLabelStyle: Styles.textStyleGray400R12,
                tabs: [
                  Tab(
                    child: Center(
                      child: Text(
                        LocaleKeys.kParticularAccount.tr(),
                      ),
                    ),
                  ),
                  Tab(
                    child: Center(
                      child: Text(
                        LocaleKeys.kBusinessAccount.tr(),
                      ),
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
                    Text(
                      LocaleKeys.kDetails.tr(),
                      style: Styles.textStyleGray500R16,
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kManagerOwner.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    DropDownFieldProviderCustom(
                      hintText: LocaleKeys.kTypeHere.tr(),
                      icon: SvgPicture.asset(
                        AssetsProviderData.arrowDown,
                      ),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kFullName.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextProviderCustom(
                        controller: nameController,
                        hintText: LocaleKeys.kTypeHere.tr(),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kEmail.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextProviderCustom(
                      controller: emailController,
                      hintText: LocaleKeys.kTypeHere.tr(),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kPhoneOne.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    IntlPhoneField(
                      disableLengthCheck: true,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.kPhoneNumber.tr(),
                        labelStyle: Styles.textStyleGray300R12,
                        hintText: LocaleKeys.kTypeHere.tr(),
                        hintStyle: Styles.textStyleGray300R12,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            SizeData.s8,
                          ),
                          borderSide: BorderSide(
                            color: ColorData.gray100Color,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            SizeData.s8,
                          ),
                          borderSide: BorderSide(
                            color: ColorData.gray100Color,
                          ),
                        ),
                      ),
                      onChanged: (phone) {},
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kPhoneTwo.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    IntlPhoneField(
                      disableLengthCheck: true,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.kPhoneNumber.tr(),
                        labelStyle: Styles.textStyleGray300R12,
                        hintText: LocaleKeys.kTypeHere.tr(),
                        hintStyle: Styles.textStyleGray300R12,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            SizeData.s8,
                          ),
                          borderSide: BorderSide(
                            color: ColorData.gray100Color,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            SizeData.s8,
                          ),
                          borderSide: BorderSide(
                            color: ColorData.gray100Color,
                          ),
                        ),
                      ),
                      onChanged: (phone) {},
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kAddress.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextProviderCustom(
                      controller: addressController,
                      hintText: LocaleKeys.kTypeHere.tr(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.kContactInfo.tr(),
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
                    height: SizeData.s16,
                  ),
                  // Expanded(
                  //   child: Text(
                  //     LocaleKeys.kHereYouCanSelectTheContactInformation.tr(),
                  //     style: Styles.textStyleGray500R12,
                  //   ),
                  // ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: ColorData.blue500Color,
                        value: phoneChecked,
                        onChanged: (value){
                          setState(() {
                            phoneChecked = !phoneChecked;
                          });
                        }),
                      SizedBox(
                        height: SizeData.s4,
                      ),
                      Expanded(
                        child: InputTextProviderCustom(
                          controller: contactPhoneController,
                          hintText: LocaleKeys.kTypeHere.tr(),
                          prefix: Padding(
                            padding: EdgeInsets.all(
                              SizeData.s16,
                            ),
                            child: SvgPicture.asset(
                              AssetsProviderData.callIcon,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: ColorData.blue500Color,
                          value: emailChecked,
                          onChanged: (value){
                            setState(() {
                              emailChecked = !emailChecked;
                            });
                          }),
                      SizedBox(
                        height: SizeData.s4,
                      ),
                      Expanded(
                        child: InputTextProviderCustom(
                          controller: contactEmailController,
                          hintText: LocaleKeys.kTypeHere.tr(),
                          prefix: Padding(
                            padding: EdgeInsets.all(
                              SizeData.s16,
                            ),
                            child: SvgPicture.asset(
                              AssetsProviderData.smsIcon,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: ColorData.blue500Color,
                          value: messageChecked,
                          onChanged: (value){
                            setState(() {
                              messageChecked = !messageChecked;
                            });
                          }),
                      SizedBox(
                        height: SizeData.s4,
                      ),
                      Expanded(
                        child: InputTextProviderCustom(
                          controller: contactMessageController,
                          hintText: LocaleKeys.kTypeHere.tr(),
                          prefix: Padding(
                            padding: EdgeInsets.all(
                              SizeData.s16,
                            ),
                            child: SvgPicture.asset(
                              AssetsProviderData.messagesIcon,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: ColorData.blue500Color,
                          value: whatsappChecked,
                          onChanged: (value){
                            setState(() {
                              whatsappChecked = !whatsappChecked;
                            });
                          }),
                      SizedBox(
                        height: SizeData.s4,
                      ),
                      Expanded(
                        child: InputTextProviderCustom(
                          controller: contactWhatsappController,
                          hintText: LocaleKeys.kTypeHere.tr(),
                          prefix: Padding(
                            padding: EdgeInsets.all(
                              SizeData.s16,
                            ),
                            child: SvgPicture.asset(
                              AssetsProviderData.whatsappIcon,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if(currentIndex == 1) ...[
                SizedBox(
                height: SizeData.s16,
              ),
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
                    Text(
                      LocaleKeys.kBusinessInformation.tr(),
                      style: Styles.textStyleGray500R16,
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kNRCSRM.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    DropDownFieldProviderCustom(
                      hintText: LocaleKeys.kTypeHere.tr(),
                      icon: SvgPicture.asset(
                        AssetsProviderData.arrowDown,
                      ),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kShareCapitalAmount.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextProviderCustom(
                      controller: shareCapitalController,
                      hintText: LocaleKeys.kTypeHere.tr(),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kLegalForm.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    DropDownFieldProviderCustom(
                      hintText: LocaleKeys.kTypeHere.tr(),
                      icon: SvgPicture.asset(
                        AssetsProviderData.arrowDown,
                      ),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kSIREN.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextProviderCustom(
                      controller: SIRENController,
                      hintText: LocaleKeys.kTypeHere.tr(),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Text(
                      LocaleKeys.kNIC.tr(),
                      style: Styles.textStyleGray500R14,
                    ),
                    SizedBox(
                      height: SizeData.s8,
                    ),
                    InputTextProviderCustom(
                      controller: NICController,
                      hintText: LocaleKeys.kTypeHere.tr(),
                    ),
                    SizedBox(
                      height: SizeData.s16,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: ColorData.blue500Color,
                          value: subjectToVATChecked,
                          onChanged: (value){
                            setState(() {
                              subjectToVATChecked = !subjectToVATChecked;
                            });
                          },
                        ),
                        SizedBox(
                          width: SizeData.s4,
                        ),
                        Text(
                          LocaleKeys.kSubjectToVAT.tr(),
                          style: Styles.textStyleGray500R12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(
              height: SizeData.s16,
            ),
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
                  Text(
                    LocaleKeys.kDocumentation.tr(),
                    style: Styles.textStyleGray500R16,
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Text(
                    LocaleKeys.kLiabilityInsuranceForParking.tr(),
                    style: Styles.textStyleGray500R14,
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  DottedBorder(
                    color: ColorData.gray100Color,
                    strokeWidth: 1,
                    dashPattern: const [6, 3],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(
                      SizeData.s8,
                    ),
                    child: GestureDetector(
                      onTap: pickFile,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(
                          SizeData.s16,
                        ),
                        alignment: Alignment.center,
                        child: selectedFile1 == null ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorData.gray25Color,
                              radius: Unit(context).getWidthSize*0.059,
                              child: SvgPicture.asset(
                                AssetsProviderData.documentUploadIcon,
                                width: Unit(context).getWidthSize*0.064,
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          LocaleKeys.kClickToUpload.tr(),
                                          style: Styles.textStyleBlue500R14,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'or ' + LocaleKeys.kDragAndDrop.tr(),
                                          style: Styles.textStyleGray600R14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeData.s4,
                                  ),
                                  Text(
                                    LocaleKeys.kMaxFileSize25MB.tr(),
                                    style: Styles.textStyleGray400R12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                        : Container(
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedFile1!.name,
                                      style: Styles.textStyleGray700R14,
                                    ),
                                    Text(
                                      "${(selectedFile1!.size / 1024).toStringAsFixed(2)} KB",
                                      style: Styles.textStyleGray300R12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Implement file view functionality here
                                      },
                                      child: Text(
                                        LocaleKeys.kClickToView.tr(),
                                        style: Styles.textStyleGray3SB14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                    Icons.delete,
                                    color: ColorData.gray100Color,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedFile1 = null;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Text(
                    LocaleKeys.kDueDate.tr(),
                    style: Styles.textStyleGray500R14,
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  DropDownFieldProviderCustom(
                    hintText: LocaleKeys.kTypeHere.tr(),
                    icon: SvgPicture.asset(
                      AssetsProviderData.arrowDown,
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Text(
                    LocaleKeys.kCertificateOfRegistrationOfCompany.tr(),
                    style: Styles.textStyleGray500R14,
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  DottedBorder(
                    color: ColorData.gray100Color,
                    strokeWidth: 1,
                    dashPattern: const [6, 3],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(
                      SizeData.s8,
                    ),
                    child: GestureDetector(
                      onTap: pickFile,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(
                          SizeData.s16,
                        ),
                        alignment: Alignment.center,
                        child: selectedFile2 == null ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorData.gray25Color,
                              radius: Unit(context).getWidthSize*0.059,
                              child: SvgPicture.asset(
                                AssetsProviderData.documentUploadIcon,
                                width: Unit(context).getWidthSize*0.064,
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          LocaleKeys.kClickToUpload.tr(),
                                          style: Styles.textStyleBlue500R14,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'or ' + LocaleKeys.kDragAndDrop.tr(),
                                          style: Styles.textStyleGray600R14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeData.s4,
                                  ),
                                  Text(
                                    LocaleKeys.kMaxFileSize25MB.tr(),
                                    style: Styles.textStyleGray400R12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                        : Container(
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedFile2!.name,
                                      style: Styles.textStyleGray700R14,
                                    ),
                                    Text(
                                      "${(selectedFile2!.size / 1024).toStringAsFixed(2)} KB",
                                      style: Styles.textStyleGray300R12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Implement file view functionality here
                                      },
                                      child: Text(
                                        LocaleKeys.kClickToView.tr(),
                                        style: Styles.textStyleGray3SB14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: ColorData.gray100Color,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedFile2 = null;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Text(
                    LocaleKeys.kDueDate.tr(),
                    style: Styles.textStyleGray500R14,
                  ),
                  SizedBox(
                    height: SizeData.s8,
                  ),
                  DropDownFieldProviderCustom(
                    hintText: LocaleKeys.kTypeHere.tr(),
                    icon: SvgPicture.asset(
                      AssetsProviderData.arrowDown,
                    ),
                  ),
                  SizedBox(
                    height: SizeData.s16,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: ColorData.blue500Color,
                        value: sendDocumentsChecked,
                        onChanged: (value){
                          setState(() {
                            sendDocumentsChecked = !sendDocumentsChecked;
                          });
                        },
                      ),
                      SizedBox(
                        width: SizeData.s4,
                      ),
                      Expanded(
                        child: Text(
                          LocaleKeys.kCheckThisBoxIfYouWishToSendTheseDocumentsByEmail.tr(),
                          style: Styles.textStyleGray500R12,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(
              height: SizeData.s16,
            ),
            Row(
              children: [
                Expanded(
                  child: MainButtonProviderCustom(
                    onTap: (){},
                    text: LocaleKeys.kCancel.tr(),
                    color: ColorData.primaryP2Color,
                    colorFont: ColorData.purple4Color,
                  ),
                ),
                SizedBox(
                  width: SizeData.s8,
                ),
                Expanded(
                  child: MainButtonProviderCustom(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kTypeOfPropertyView);
                    },
                    text: LocaleKeys.kSave.tr(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
