import 'package:flutter/services.dart';

import '../../core/utils/validation_functions.dart';
import '../../widgets/custom_floating_edit_text.dart';
import 'controller/log_in_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:fastteam_app/domain/googleauth/google_auth_helper.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LogInController controller = Get.put(LogInController());
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  requestLogin(username, password) async {
    var loginResult = await controller.requestLogin(username, password);

    if (loginResult['status'] == 200) {
      if (loginResult['details']['status'] == "success") {
        var employeeResult = await controller.retrieveEmployeeInfo(
            loginResult['details']['data']['empoloyee_id'] ?? 0);

        if (employeeResult['status'] == 200) {
          controller.storeUserInfo(loginResult['details']['data']);
          controller.storeJsonUser(loginResult['details']['data']);
          controller.storeToken(loginResult['details']['token']);
          PrefUtils.setIsSignIn(false);
          controller.storeEmployeeInfo(employeeResult['details']['data']);
          Get.toNamed(AppRoutes.homeContainerScreen);
        } else {
          showSnackBar('Server dalam gangguan');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        closeApp();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        body: SafeArea(
          child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 16, top: 43, right: 16, bottom: 43),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imageLogoFP,
                          height: getVerticalSize(240),
                          width: getHorizontalSize(220),
                          margin: getMargin(bottom: 0)),
                      CustomFloatingEditText(
                          controller: controller.usernameController,
                          labelText: "lbl_email_address".tr,
                          hintText: "lbl_email_address".tr,
                          margin: getMargin(top: 40),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "Please enter valid email";
                            }
                            return null;
                          }),
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
                                        svgPath: controller.isShowPassword.value
                                            ? ImageConstant.imgAirplane
                                            : ImageConstant.imgAirplane))),
                            suffixConstraints:
                                BoxConstraints(maxHeight: getVerticalSize(56)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter valid password";
                              }
                              return null;
                            },
                            isObscureText: controller.isShowPassword.value),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtForgotpassword();
                              },
                              child: Padding(
                                  padding: getPadding(top: 17),
                                  child: Text("msg_forgot_password".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtFootnote)))),
                      CustomButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              requestLogin(controller.usernameController.text,
                                  controller.passwordController.text);
                            }
                          },
                          height: getVerticalSize(54),
                          text: "lbl_log_in".tr,
                          margin: getMargin(top: 25)),
                    ]),
              )),
        ),
      ),
    );
  }

  showSnackBar(message) {
    snackbar() => SnackBar(
          content: Text(
            message,
            style: AppStyle.txtRatingIndigo,
          ),
          backgroundColor: ColorConstant.red700,
          behavior: SnackBarBehavior.floating,
        );
    ScaffoldMessenger.of(context).showSnackBar(snackbar());
  }

  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.fotgotPasswordScreen,
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

  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
