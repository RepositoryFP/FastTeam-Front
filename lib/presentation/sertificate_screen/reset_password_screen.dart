import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_floating_edit_text.dart';
import '../reset_password_one_dialog/reset_password_one_dialog.dart';
import 'controller/reset_password_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';




class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordController controller = Get.put(ResetPasswordController());
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
      onWillPop: ()async{
        Get.back();
        return true;
      },
      child: ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: Scaffold(
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
                      onTapArrowleft3();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_reset_password".tr),
                styleType: Style.bgFillWhiteA700),
            body: SafeArea(
              child: Form(
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
                          Obx(() => CustomFloatingEditText(
                            /*
                            labelText: "lbl_password".tr,
                                hintText: "lbl_password".tr,
                                margin: getMargin(top: 16),
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.emailAddress,
                             */
                              controller: controller.newpasswordController,
                              labelText: "lbl_password".tr,
                              hintText: "lbl_password".tr,
                              margin: getMargin(top: 52),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
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
                                          svgPath: controller.isShowPassword.value
                                              ? ImageConstant.imgAirplane
                                              : ImageConstant.imgAirplane))),
                              suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(56)),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText: controller.isShowPassword.value)),
                          Obx(() => CustomFloatingEditText(
                              controller: controller.confirmpasswordController,
                              hintText: "lbl_conf_password".tr,
                              labelText: "lbl_conf_password".tr,
                              margin: getMargin(top: 16),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword1.value =
                                    !controller.isShowPassword1.value;
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 16,
                                          right: 16,
                                          bottom: 16),
                                      child: CustomImageView(
                                          svgPath:
                                          controller.isShowPassword1.value
                                              ? ImageConstant.imgAirplane
                                              : ImageConstant.imgAirplane))),
                              suffixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(56)),
                              validator: (value) {
                                if (value == null ||value.isEmpty) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText: controller.isShowPassword1.value)),
                          CustomButton(
                              height: getVerticalSize(54),
                              text: "lbl_reset_pasword".tr,
                              margin: getMargin(top: 30, bottom: 5),
                              onTap: () {
                                onTapResetpasword(context);
                              })
                        ])),
              ),
            )),
      ),
    );
  }

  onTapResetpasword(context) {

    showDialog(
      barrierDismissible: false,
      context: context,

      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
          EdgeInsets.zero,
          content: ResetPasswordOneDialog(),
        );
      },
    );

  }

  onTapArrowleft3() {
    Get.back();
  }
}




