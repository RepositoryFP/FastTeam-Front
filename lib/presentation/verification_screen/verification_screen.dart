import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:pinput/pinput.dart';

import 'controller/verification_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';




class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  VerificationController controller  = Get.put(VerificationController());
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
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(81),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 29, bottom: 28),
                    onTap: () {
                      onTapArrowleft1();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_verification".tr),
                styleType: Style.bgFillWhiteA700),
            body: Form(
              key: _formKey,
              child: SafeArea(
                child: Container(
                    width: double.maxFinite,
                    padding: getPadding(left: 16, top: 10, right: 16, bottom: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: getHorizontalSize(318),
                              margin: getMargin(left: 39, right: 38),
                              child: Text("msg_please_enter_the".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtBody)),
                          Padding(
                              padding: getPadding(top: 28),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "lbl_code_sent_to".tr,
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "msg_ronaldrich08_gmail_com".tr,
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w600))
                                  ]),
                                  textAlign: TextAlign.left)),
                          Padding(
                              padding: getPadding(left: 3, top: 24, right: 3),
                              child: Obx(() =>
                              // PinCodeTextField(
                              // appContext: context,
                              // controller: controller.otpController.value,
                              // length: 6,
                              // obscureText: false,
                              // obscuringCharacter: '*',
                              // keyboardType: TextInputType.number,
                              // autoDismissKeyboard: true,
                              // enableActiveFill: true,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
                              // cursorColor: ColorConstant.indigo800,
                              // onChanged: (value) {},
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return "Please enter valid OTP";
                              //   }
                              //   return null;
                              // },
                              // pinTheme: PinTheme(
                              //   errorBorderColor: ColorConstant.red500,
                              //   fieldHeight: getVerticalSize(51),
                              //   fieldWidth: getHorizontalSize(51),
                              //   shape: PinCodeFieldShape.box,
                              //   borderRadius: BorderRadius.circular(
                              //       getHorizontalSize(8)),
                              //   selectedFillColor: ColorConstant.gray5001,
                              //   activeFillColor: ColorConstant.gray5001,
                              //   inactiveFillColor: ColorConstant.gray5001,
                              //   inactiveColor: ColorConstant.gray5001,
                              //   selectedColor: ColorConstant.gray5001,
                              //   activeColor:
                              //       ColorConstant.fromHex("#1212121D"),
                              // )),
                              Padding(
                                padding: getPadding(left: 3,right: 3),
                                child: Pinput(

                                  errorTextStyle:  TextStyle(
                                    color:ColorConstant.red,
                                    fontSize: getFontSize(
                                      16,
                                    ),
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  disabledPinTheme: PinTheme(
                                      padding: getPadding(left: 9,right: 9),
                                      decoration: BoxDecoration(color: Colors.red)
                                  ),
                                  controller: controller.otpController.value,
                                  length: 6,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid OTP";
                                    }
                                    return null;
                                  },
                                  errorPinTheme: PinTheme(
                                    padding: getPadding(left: 9,right: 9),
                                    decoration: BoxDecoration(
                                      color:ColorConstant.gray5001,
                                      border: Border.all(color:ColorConstant.red500 ),
                                      borderRadius:  BorderRadius.circular(
                                        getHorizontalSize(8),),

                                    ),
                                    textStyle: TextStyle(
                                      color:ColorConstant.red,
                                      fontSize: getFontSize(
                                        16,
                                      ),
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    width: getHorizontalSize(51),
                                    height: getVerticalSize(51),
                                  ),
                                  defaultPinTheme: PinTheme(
                                    padding: getPadding(left: 9,right: 9),
                                    width: getHorizontalSize(51),
                                    height: getVerticalSize(51),
                                    textStyle:TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(
                                        24,
                                      ),
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: BoxDecoration(
                                      color:ColorConstant.gray5001,
                                      border: Border.all(color:ColorConstant.gray5001 ),
                                      borderRadius:  BorderRadius.circular(
                                        getHorizontalSize(8),),

                                    ),
                                  ),
                                ),
                              )
                              )),
                          CustomButton(
                              height: getVerticalSize(54),
                              text: "lbl_send".tr,
                              margin: getMargin(top: 30),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  onTapSend();
                                }
                              }),
                          Padding(
                              padding: getPadding(top: 32),
                              child: Text("lbl_00_25".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSFProDisplaySemibold18)),
                          Padding(
                              padding: getPadding(top: 21, bottom: 5),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_didn_t_receive_a2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.gray600,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "lbl_resend_code".tr,
                                        style: TextStyle(
                                            color: ColorConstant.black900,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w400))
                                  ]),
                                  textAlign: TextAlign.left))
                        ])),
              ),
            )),
      ),
    );
  }

  onTapSend() {
    Get.toNamed(
      AppRoutes.resetPasswordScreen,
    );
  }

  onTapArrowleft1() {
    Get.back();
  }
}




