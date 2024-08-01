import 'package:flutter/services.dart';

import '../../core/phone_field/intl_phone_field.dart';
import 'controller/edit_profile_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/utils/validation_functions.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_floating_edit_text.dart';

import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable



class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController controller = Get.put(EditProfileController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    controller.nameController.text = "lbl_ronald_richard".tr;
    controller.emailController.text = "msg_ronaldrichards_gmail_com".tr;
    controller.phoneNumberController.text = "(505)765-1633";
    return WillPopScope(
      onWillPop: ()async{
        Get.back();
        return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.gray5001,
          appBar: CustomAppBar(
            height: getVerticalSize(81),
            leadingWidth: 40,
            leading: AppbarImage(
                height: getSize(24),
                width: getSize(24),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 16, top: 29, bottom: 28),
                onTap: () {
                  onTapArrowleft19();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_edit_profile".tr),
          ),
          body: Form(
              key: _formKey,
              child: Container(
                  width: double.maxFinite,
                  child: Container(
                      width: double.maxFinite,
                      margin: getMargin(top: 8),
                      padding: getPadding(
                          left: 16, top: 24, right: 16, bottom: 24),
                      decoration: AppDecoration.white,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: getVerticalSize(118),
                                width: getHorizontalSize(121),
                                child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      CustomImageView(
                                          imagePath:
                                          ImageConstant.imgEllipse238,
                                          height: getSize(118),
                                          width: getSize(118),
                                          radius: BorderRadius.circular(
                                              getHorizontalSize(59)),
                                          alignment: Alignment.center),
                                      Padding(
                                        padding: getPadding(bottom: 13),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorConstant.whiteA700,boxShadow: [
                                            BoxShadow(offset: Offset(0, 4),
                                                blurRadius: 4,
                                                color: ColorConstant.black900.withOpacity(0.06))
                                          ]),
                                          child: CustomImageView(
                                              margin: getMargin(all: 3),
                                              svgPath: ImageConstant.imgPlus),
                                        ),
                                      ),
                                    ])),
                            CustomFloatingEditText(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.nameController,
                                labelText: "lbl_name".tr,
                                hintText: "lbl_name".tr,
                                margin: getMargin(top: 30),
                                validator: (value) {
                                  if (!isText(value)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                }),
                            CustomFloatingEditText(
                                focusNode: FocusNode(),
                                autofocus: true,
                                controller: controller.emailController,
                                labelText: "lbl_email_address".tr,
                                hintText: "lbl_email_address".tr,
                                margin: getMargin(top: 30),
                                padding: FloatingEditTextPadding.PaddingT17,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                }),

                            SizedBox(height: getVerticalSize(30),),
                            IntlPhoneField(
                              controller: controller.phoneNumberController,
                              disableLengthCheck: true,
                              showCountryFlag: false,
                              flagsButtonMargin: EdgeInsets.only(left: 16,top: 10,bottom: 10,right: 0),
                              style: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  17,
                                ),
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                              ),
                              dropdownTextStyle: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  17,
                                ),
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                              ),
                              cursorColor: ColorConstant.indigo800,
                              dropdownIconPosition: IconPosition.trailing,
                              dropdownIcon: Icon(Icons.keyboard_arrow_down_outlined,color: ColorConstant.black900,),
                              decoration:  InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                labelStyle: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    13,
                                  ),
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                                hintText:"Phone number",
                                hintStyle:  TextStyle(
                                  color:ColorConstant.gray600,
                                  fontSize: getFontSize(
                                    17,
                                  ),
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(getHorizontalSize(16))),
                                  borderSide: BorderSide(
                                    color: ColorConstant.red,
                                    width: 1,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(getHorizontalSize(16))),
                                  borderSide: BorderSide(
                                    color: ColorConstant.red,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(getHorizontalSize(16))),
                                  borderSide: BorderSide(
                                    color: ColorConstant.gray300,
                                    width: 1,
                                  ),),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(getHorizontalSize(16))),
                                  borderSide: BorderSide(
                                    color: ColorConstant.indigo800,
                                    width: 1,
                                  ),),
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              initialCountryCode: 'IN',

                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                            Spacer(),
                            CustomButton(
                                height: getVerticalSize(54),
                                text: "lbl_save".tr,
                                margin: getMargin(bottom: 15),
                                onTap: () {
                                  onTapSave();
                                })
                          ]))))),
    );
  }

  onTapSave() {
    Get.back();
  }

  onTapArrowleft19() {
    Get.back();
  }
}









