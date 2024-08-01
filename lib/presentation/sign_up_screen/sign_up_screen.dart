import 'package:flutter/services.dart';

import '../../core/phone_field/intl_phone_field.dart';
import 'controller/sign_up_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/utils/validation_functions.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:fastteam_app/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignUpController controller  = Get.put(SignUpController());
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
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          body: SafeArea(
            child: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                    getPadding(left: 16, top: 37, right: 16, bottom: 37),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(top: 6),
                              child: Text("lbl_sign_up".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtOutfitBold34)),
                          CustomFloatingEditText(
                              controller: controller.nameController,
                              labelText: "lbl_name".tr,
                              hintText: "lbl_name".tr,
                              margin: getMargin(top: 62),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          CustomFloatingEditText(
                              controller: controller.emailController,
                              labelText: "lbl_email_address".tr,
                              hintText: "lbl_email_address".tr,
                              margin: getMargin(top: 16),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          // Container(
                          //     height: getVerticalSize(70),
                          //     width: getHorizontalSize(396),
                          //     margin: getMargin(top: 15),
                          //     child: Stack(
                          //         alignment: Alignment.topLeft,
                          //         children: [
                          //           Align(
                          //               alignment: Alignment.bottomCenter,
                          //               child: Container(
                          //                   margin: getMargin(top: 9),
                          //                   padding:
                          //                       getPadding(top: 10, bottom: 10),
                          //                   decoration: AppDecoration
                          //                       .outlineGray300
                          //                       .copyWith(
                          //                           borderRadius:
                          //                               BorderRadiusStyle
                          //                                   .roundedBorder16),
                          //                   child: Row(
                          //                       crossAxisAlignment:
                          //                           CrossAxisAlignment.start,
                          //                       children: [
                          //                         CustomButton(
                          //                             height:
                          //                                 getVerticalSize(40),
                          //                             width:
                          //                                 getHorizontalSize(77),
                          //                             text: "lbl_1".tr,
                          //                             margin: getMargin(top: 1),
                          //                             variant: ButtonVariant
                          //                                 .OutlineGray300,
                          //                             shape: ButtonShape.Square,
                          //                             padding: ButtonPadding
                          //                                 .PaddingT9,
                          //                             fontStyle: ButtonFontStyle
                          //                                 .SFProDisplayRegular17,
                          //                             suffixWidget: Container(
                          //                                 margin: getMargin(
                          //                                     left: 14),
                          //                                 child: CustomImageView(
                          //                                     svgPath: ImageConstant
                          //                                         .imgArrowdown))),
                          //                         Padding(
                          //                             padding: getPadding(
                          //                                 left: 14,
                          //                                 top: 8,
                          //                                 bottom: 11),
                          //                             child: Text(
                          //                                 "lbl_505_765_1633".tr,
                          //                                 overflow: TextOverflow
                          //                                     .ellipsis,
                          //                                 textAlign:
                          //                                     TextAlign.left,
                          //                                 style:
                          //                                     AppStyle.txtBody))
                          //                       ]))),
                          //           Align(
                          //               alignment: Alignment.topLeft,
                          //               child: Container(
                          //                   height: getVerticalSize(17),
                          //                   width: getHorizontalSize(91),
                          //                   margin: getMargin(left: 16),
                          //                   child: Stack(
                          //                       alignment: Alignment.center,
                          //                       children: [
                          //                         Align(
                          //                             alignment:
                          //                                 Alignment.topCenter,
                          //                             child: Container(
                          //                                 height:
                          //                                     getVerticalSize(
                          //                                         16),
                          //                                 width:
                          //                                     getHorizontalSize(
                          //                                         91),
                          //                                 decoration: BoxDecoration(
                          //                                     color: ColorConstant
                          //                                         .whiteA700))),
                          //                         Align(
                          //                             alignment:
                          //                                 Alignment.center,
                          //                             child: Text(
                          //                                 "lbl_phone_number".tr,
                          //                                 overflow: TextOverflow
                          //                                     .ellipsis,
                          //                                 textAlign:
                          //                                     TextAlign.left,
                          //                                 style: AppStyle
                          //                                     .txtFootnote))
                          //                       ])))
                          //         ])),

                          SizedBox(
                            height: getVerticalSize(16),
                          ),

                          IntlPhoneField(

                            controller: controller.phoneController,
                            disableLengthCheck: true,
                            showCountryFlag: false,
                            flagsButtonMargin: EdgeInsets.only(
                                left: 16, top: 14, bottom: 14, right: 14),
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
                            dropdownDecoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: ColorConstant.gray300))),
                            dropdownIcon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: ColorConstant.black900,
                            ),
                            validator: (p0) {
                              if (p0 == null || p0.number.isEmpty) {
                                return "Enter valid number";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              floatingLabelStyle: TextStyle(
                                color: ColorConstant.black900,
                                fontSize: getFontSize(
                                  17,
                                ),
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding: EdgeInsets.zero,
                              // labelStyle: TextStyle(
                              //   color: ColorConstant.black900,
                              //   fontSize: getFontSize(
                              //     13,
                              //   ),
                              //   fontFamily: 'Outfit',
                              //   fontWeight: FontWeight.w400,
                              // ),
                              // labelText: "Phone number",
                              label: Text(
                                "Phone number",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    17,
                                  ),
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              // label: Align(alignment: Alignment.topLeft,child: Text("Phone number",textAlign: TextAlign.left,)),
                              hintText: "Phone number",
                              hintStyle: TextStyle(
                                color: ColorConstant.gray600,
                                fontSize: getFontSize(
                                  17,
                                ),
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w400,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(getHorizontalSize(16))),
                                borderSide: BorderSide(
                                  color: ColorConstant.red,
                                  width: 1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(getHorizontalSize(16))),
                                borderSide: BorderSide(
                                  color: ColorConstant.red,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(getHorizontalSize(16))),
                                borderSide: BorderSide(
                                  color: ColorConstant.gray300,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(getHorizontalSize(16))),
                                borderSide: BorderSide(
                                  color: ColorConstant.indigo800,
                                  width: 1,
                                ),
                              ),

                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'IN',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          ),

                          Obx(
                                () => CustomFloatingEditText(
                                controller: controller.passwordController,
                                labelText: "lbl_password".tr,
                                hintText: "lbl_password".tr,
                                margin: getMargin(top: 16),
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.emailAddress,
                                suffix: InkWell(
                                    onTap: () {
                                      controller.isShowPassword.value =
                                      !controller.isShowPassword.value;
                                    },
                                    child: Container(
                                        margin: getMargin(
                                            left: 30,
                                            top: 16,
                                            right: 16,
                                            bottom: 16),
                                        child: CustomImageView(
                                            svgPath: controller
                                                .isShowPassword.value
                                                ? ImageConstant.imgAirplane
                                                : ImageConstant.imgAirplane))),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(56)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter valid password";
                                  }
                                  return null;
                                },
                                isObscureText: controller.isShowPassword.value),
                          ),

                          CustomButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.back();
                                }
                              },
                              height: getVerticalSize(54),
                              text: "lbl_sign_up2".tr,
                              margin: getMargin(top: 26)),
                          Padding(
                            padding: getPadding(left: 64, right: 64, top: 30),
                            child: GestureDetector(
                              onTap: () {
                                onTapContinuewith();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(getHorizontalSize(16))),
                                    color: ColorConstant.whiteA700,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 4,
                                          color: ColorConstant.black900
                                              .withOpacity(0.06))
                                    ]),
                                width: double.infinity,
                                child: Padding(
                                  padding: getPadding(
                                      top: 16, bottom: 16, left: 28, right: 28),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomImageView(
                                        height: getVerticalSize(24),
                                        width: getHorizontalSize(24),
                                        svgPath:
                                        ImageConstant.imgGoogleButtonIcon,
                                      ),
                                      Text(
                                        "msg_continue_with_google".tr,
                                        style: TextStyle(
                                          color: ColorConstant.black900,
                                          fontSize: getFontSize(
                                            17,
                                          ),
                                          fontFamily: 'SF Pro Text',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                onTapTxtAlreadyhavean();
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "lbl_already".tr,
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "msg_have_an_account".tr,
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "lbl_sign_in2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.indigo800,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w400))
                                  ]),
                                  textAlign: TextAlign.left))
                        ]))),
          )),
    );
  }

  onTapContinuewith() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapTxtAlreadyhavean() {
    Get.back();
  }
}






