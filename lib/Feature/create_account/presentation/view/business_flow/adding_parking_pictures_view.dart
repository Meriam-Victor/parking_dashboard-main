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
      backgroundColor: ColorProviderData.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorProviderData.whiteColor,
        title: Text(
          LocaleKeys.kAddParking.tr(),
          style: StylesProvider.textStyleGreyBlue5ColorR16,
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
                style: StylesProvider.textStyleGreyBlue1ColorM20,
              ),
              SizedBox(
                height: SizeData.s10,
              ),
              Text(
                LocaleKeys.kYouCanStillAddPhotosLater.tr(),
                style: StylesProvider.textStyleGreyBlue3ColorR14,
              ),
              SizedBox(
                height: SizeData.s32,
              ),
              Text(
                LocaleKeys.kCoverPhoto.tr(),
                style: StylesProvider.textStyleGreyBlue4ColorM14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              DottedBorder(
                color: ColorProviderData.greyBlue2Color,
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
                              backgroundColor: ColorProviderData.secondary1Color,
                              radius: Unit(context).getWidthSize*0.059,
                              child: SvgPicture.asset(
                                AssetsData.documentUploadIcon,
                                width: Unit(context).getWidthSize*0.064,
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s12,
                            ),
                            Text(
                              LocaleKeys.kDragAndDrop.tr(),
                              style: StylesProvider.textStyleGreyBlue8ColorR14,
                            ),
                            SizedBox(
                              height: SizeData.s4,
                            ),
                            Text(
                                LocaleKeys.kMaxFileSize25MB.tr(),
                              style: StylesProvider.textStyleGreyBlue8ColorR12,
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
                style: StylesProvider.textStyleGreyBlue4ColorM14,
              ),
              SizedBox(
                height: SizeData.s8,
              ),
              DottedBorder(
                color: ColorProviderData.greyBlue2Color,
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
                          backgroundColor: ColorProviderData.secondary1Color,
                          radius: Unit(context).getWidthSize*0.059,
                          child: SvgPicture.asset(
                            AssetsData.documentUploadIcon,
                            width: Unit(context).getWidthSize*0.064,
                          ),
                        ),
                        SizedBox(
                          height: SizeData.s12,
                        ),
                        Text(
                          LocaleKeys.kDragAndDrop.tr(),
                          style: StylesProvider.textStyleGreyBlue8ColorR14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        Text(
                          LocaleKeys.kMaxFileSize25MB.tr(),
                          style: StylesProvider.textStyleGreyBlue8ColorR12,
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
                color: ColorProviderData.greyBlue2Color,
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
                          backgroundColor: ColorProviderData.secondary1Color,
                          radius: Unit(context).getWidthSize*0.059,
                          child: SvgPicture.asset(
                            AssetsData.documentUploadIcon,
                            width: Unit(context).getWidthSize*0.064,
                          ),
                        ),
                        SizedBox(
                          height: SizeData.s12,
                        ),
                        Text(
                          LocaleKeys.kDragAndDrop.tr(),
                          style: StylesProvider.textStyleGreyBlue8ColorR14,
                        ),
                        SizedBox(
                          height: SizeData.s4,
                        ),
                        Text(
                          LocaleKeys.kMaxFileSize25MB.tr(),
                          style: StylesProvider.textStyleGreyBlue8ColorR12,
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
                color: ColorProviderData.greyBlue2Color,
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
                              backgroundColor: ColorProviderData.secondary1Color,
                              radius: Unit(context).getWidthSize*0.059,
                              child: SvgPicture.asset(
                                AssetsData.documentUploadIcon,
                                width: Unit(context).getWidthSize*0.064,
                              ),
                            ),
                            SizedBox(
                              height: SizeData.s12,
                            ),
                            Text(
                              LocaleKeys.kDragAndDrop.tr(),
                              style: StylesProvider.textStyleGreyBlue8ColorR14,
                            ),
                            SizedBox(
                              height: SizeData.s4,
                            ),
                            Text(
                              LocaleKeys.kMaxFileSize25MB.tr(),
                              style: StylesProvider.textStyleGreyBlue8ColorR12,
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
                  MainButtonProviderCustom(
                    onTap: (){},
                    width: Unit(context).getWidthSize*0.35,
                    text: LocaleKeys.kSaveForLater.tr(),
                    color: ColorProviderData.whiteColor,
                    colorFont: ColorProviderData.primary2Color,
                    borderColor: ColorProviderData.primary2Color,
                    borderWidth: 1.0,
                  ),
                  const Spacer(),
                  MainButtonProviderCustom(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kOfferedServicesFirstView);
                    },
                    width: Unit(context).getWidthSize*0.48,
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
                      style: StylesProvider.textStyleBlue1ColorM14,
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
