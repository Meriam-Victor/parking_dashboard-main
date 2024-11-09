import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parking_dashboard/Core/translations/locale_keys.g.dart';
import 'package:parking_dashboard/Core/unit/assets_data.dart';
import 'package:parking_dashboard/Core/unit/color_data.dart';
import 'package:parking_dashboard/Core/unit/size_data.dart';
import 'package:parking_dashboard/Core/unit/style_data.dart';
import 'package:parking_dashboard/Core/unit/unit.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/out_line_button_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/widget/progress_steps.dart';
import 'package:parking_dashboard/Core/unit/app_routes.dart';
import 'package:parking_dashboard/Core/widget/provider_app/buttons/main_button_custom.dart';
import 'package:parking_dashboard/Feature/create_account/presentation/view/add_parking_view.dart';

class AddingParkingPicturesView extends StatefulWidget {
  const AddingParkingPicturesView({super.key});

  @override
  State<AddingParkingPicturesView> createState() => _AddingParkingPicturesView();
}

class _AddingParkingPicturesView extends State<AddingParkingPicturesView> {

  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorData.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorData.whiteColor,
        title: Text(
          LocaleKeys.kAddParking.tr(),
          style: Styles.textStyleGray700R16,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          SizeData.s24,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressSteps(
                step1State: LocaleKeys.kConfirmed.tr(),
                step2State: LocaleKeys.kConfirmed.tr(),
                step3State: LocaleKeys.kInProgress.tr(),
                step4State: LocaleKeys.kPending.tr(),
                step5State: LocaleKeys.kPending.tr(),
              ),
              SizedBox(
                height: SizeData.s48,
              ),
              Text(
                LocaleKeys.kAddParkingPhotos.tr(),
                style: Styles.textStyleGray500M20,
              ),
              SizedBox(
                height: SizeData.s10,
              ),
              Text(
                LocaleKeys.kYouCanStillAddPhotosLater.tr(),
                style: Styles.textStyleGrey300R14,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Text(
                LocaleKeys.kCoverPhoto.tr(),
                style: Styles.textStyleGrey600M14,
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
                    SizeData.s10,
                ),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    height: Unit(context).getHeightSize*0.173,
                    padding: EdgeInsets.all(
                      SizeData.s24,
                    ),
                    alignment: Alignment.center,
                    child: _imageFile == null
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorData.purple3Color,
                              radius: Unit(context).getWidthSize*0.059,
                              child: SvgPicture.asset(
                                AssetsProviderData.documentUploadIcon,
                                width: Unit(context).getWidthSize*0.064,
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s12,
                            ),
                            Text(
                              LocaleKeys.kDragAndDrop.tr(),
                              style: Styles.textStyleGray600R14,
                            ),
                            SizedBox(
                              height: SizeData.s4,
                            ),
                            Text(
                                LocaleKeys.kMaxFileSize25MB.tr(),
                              style: Styles.textStyleGray400R12,
                            ),
                          ],
                        )
                        : Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Text(
                LocaleKeys.kGallery.tr(),
                style: Styles.textStyleGrey600M14,
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
                  SizeData.s10,
                ),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    height: Unit(context).getHeightSize*0.173,
                    padding: EdgeInsets.all(
                      SizeData.s24,
                    ),
                    alignment: Alignment.center,
                    child: _imageFile == null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorData.purple3Color,
                          radius: Unit(context).getWidthSize*0.059,
                          child: SvgPicture.asset(
                            AssetsProviderData.documentUploadIcon,
                            width: Unit(context).getWidthSize*0.064,
                          ),
                        ),
                        SizedBox(
                          height: SizeData.s12,
                        ),
                        Text(
                          LocaleKeys.kDragAndDrop.tr(),
                          style: Styles.textStyleGray600R14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        Text(
                          LocaleKeys.kMaxFileSize25MB.tr(),
                          style: Styles.textStyleGray400R12,
                        ),
                      ],
                    )
                        : Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
                  SizeData.s10,
                ),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    height: Unit(context).getHeightSize*0.173,
                    padding: EdgeInsets.all(
                      SizeData.s24,
                    ),
                    alignment: Alignment.center,
                    child: _imageFile == null
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorData.purple3Color,
                              radius: Unit(context).getWidthSize*0.059,
                              child: SvgPicture.asset(
                                AssetsProviderData.documentUploadIcon,
                                width: Unit(context).getWidthSize*0.064,
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s12,
                            ),
                            Text(
                              LocaleKeys.kDragAndDrop.tr(),
                              style: Styles.textStyleGray600R14,
                            ),
                            SizedBox(
                              height: SizeData.s4,
                            ),
                            Text(
                              LocaleKeys.kMaxFileSize25MB.tr(),
                              style: Styles.textStyleGray400R12,
                            ),
                          ],
                        )
                        : Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
                  SizeData.s10,
                ),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    height: Unit(context).getHeightSize*0.173,
                    padding: EdgeInsets.all(
                      SizeData.s24,
                    ),
                    alignment: Alignment.center,
                    child: _imageFile == null
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorData.purple3Color,
                              radius: Unit(context).getWidthSize*0.059,
                              child: SvgPicture.asset(
                                AssetsProviderData.documentUploadIcon,
                                width: Unit(context).getWidthSize*0.064,
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s12,
                            ),
                            Text(
                              LocaleKeys.kDragAndDrop.tr(),
                              style: Styles.textStyleGray600R14,
                            ),
                            SizedBox(
                              height: SizeData.s4,
                            ),
                            Text(
                              LocaleKeys.kMaxFileSize25MB.tr(),
                              style: Styles.textStyleGray400R12,
                            ),
                          ],
                        )
                        : Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: SizeData.s32,
              ),
              Row(
                children: [
                  OutLineButtonCustom(
                    onTap: (){},
                    text: LocaleKeys.kSaveForLater.tr(),
                    color: ColorData.whiteColor,
                    isProvider: true,
                  ),
                  const Spacer(),
                  MainButtonCustom(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kOfferedServicesFirstView);
                    },
                    isProvider: true,
                    text: LocaleKeys.kNext.tr(),
                    arrowIcon: true,
                  ),
                ],
              ),
              if (!TypeOfParkingFlow.isBusiness) ...[
                SizedBox(
                  height: SizeData.s32,
                ),
                GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kOfferedServicesFirstView);
                  },
                  child: Center(
                    child: Text(
                      LocaleKeys.kSkipThisStep.tr(),
                      style: Styles.textStyleBlue500M14,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
