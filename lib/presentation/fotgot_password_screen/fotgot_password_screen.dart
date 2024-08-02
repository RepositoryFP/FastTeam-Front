import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'controller/fotgot_password_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/utils/validation_functions.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable

class FotgotPasswordScreen extends StatefulWidget {
  const FotgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<FotgotPasswordScreen> createState() => _FotgotPasswordScreenState();
}

class _FotgotPasswordScreenState extends State<FotgotPasswordScreen> {
  FotgotPasswordController controller = Get.put(FotgotPasswordController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  bool isLoading = false;

  requestResetPassword() async {
    var result = await controller.sendResetPassword(controller.emailController.text);
    print(result);
    if (result['status'] == 200) {
      showCustomDialog(
          context, 'Password reset instructions sent to your email.');
    } else if (result['status'] == 400) {
      String message = '';

      if (result['details']['email'] is List) {
        message = result['details']['email'][0];
      } else {
        message = result['details']['email'];
      }

      showSnackBar(message, Colors.red);
    }
  }

  validateFromInput() async {
    if (controller.emailController.text.isEmpty) {
      showSnackBar("Email cannot be empty", Colors.red);
    } else {
      await requestResetPassword();
    }
    setState(() {
      isLoading = false;
    });
  }

  showSnackBar(String message, Color color) {
    snackbar() => SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          backgroundColor: color,
          duration: const Duration(milliseconds: 2000),
        );
    ScaffoldMessenger.of(context).showSnackBar(snackbar());
  }

  void showCustomDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
                      onTapArrowleft();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_forgot_password".tr),
                styleType: Style.bgFillWhiteA700),
            body: SafeArea(
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding:
                          getPadding(left: 16, top: 10, right: 16, bottom: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imageLogoFP,
                                height: getVerticalSize(240),
                                width: getHorizontalSize(220),
                                margin: getMargin(bottom: 0)),
                            Container(
                                width: getHorizontalSize(318),
                                margin: getMargin(left: 39, right: 38),
                                child: Text("msg_please_enter_the".tr,
                                    maxLines: null,
                                    textAlign: TextAlign.center,
                                    style: AppStyle.txtBody)),
                            CustomFloatingEditText(
                                controller: controller.emailController,
                                labelText: "lbl_email_address".tr,
                                hintText: "lbl_email_address".tr,
                                margin: getMargin(top: 26),
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                }),
                            CustomButton(
                                height: getVerticalSize(54),
                                text: "lbl_send".tr,
                                margin: getMargin(top: 28, bottom: 5),
                                onTap: () {
                                  if (!isLoading) {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    validateFromInput();
                                  }
                                })
                          ]))),
            )),
      ),
    );
  }

  onTapSend() {
    Get.toNamed(
      AppRoutes.verificationScreen,
    );
  }

  onTapArrowleft() {
    Get.back();
  }
}
