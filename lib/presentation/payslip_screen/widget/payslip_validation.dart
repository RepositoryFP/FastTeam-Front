import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/utils/image_constant.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/presentation/log_in_screen/controller/log_in_controller.dart';
import 'package:fastteam_app/routes/app_routes.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_floating_edit_text.dart';
import 'package:fastteam_app/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayslipValidationScreen extends StatefulWidget {
  const PayslipValidationScreen({Key? key}) : super(key: key);

  @override
  State<PayslipValidationScreen> createState() => _PayslipValidationScreen();
}

class _PayslipValidationScreen extends State<PayslipValidationScreen> {
  bool isLoading = false;

  LogInController controller = Get.put(LogInController());
  TextEditingController passwordController = TextEditingController();
  

  @override
  void initState() {
    super.initState();
  }

  requestLoginUser(username, password) async {
    var loginResult = await controller.requestLogin(username, password);

    if (loginResult['status'] == 200) {
      if (loginResult['details']['status'] == 'error') {
        showSnackBar(loginResult['details']['message'], Colors.red);
      } else {
        Get.toNamed(
          AppRoutes.payslip,
        );
      }
    } else {
      showSnackBar('Server dalam gangguan', Colors.red);
    }
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                onTapArrowleft11();
              }),
          centerTitle: true,
          title: AppbarTitle(text: "My Payslip".tr),
        ),
        body: Center(
          child: Padding(
            padding: getPadding(all: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: getVerticalSize(70)),
                  CustomImageView(
                    height: getVerticalSize(200),
                    width: getVerticalSize(200),
                    imagePath: ImageConstant.imageLogoFP,
                  ),
                  SizedBox(height: getVerticalSize(20)),
                  _infoMessage(),
                  SizedBox(height: getVerticalSize(40)),
                  _passwordField(),
                  SizedBox(height: getVerticalSize(16)),
                  _buildButton(context)
                ]),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Obx(
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
                  margin: getMargin(left: 30, top: 16, right: 16, bottom: 16),
                  child: CustomImageView(
                      svgPath: controller.isShowPassword.value
                          ? ImageConstant.imgAirplane
                          : ImageConstant.imgAirplane))),
          suffixConstraints: BoxConstraints(maxHeight: getVerticalSize(56)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter valid password";
            }
            return null;
          },
          isObscureText: controller.isShowPassword.value),
    );
  }

  ElevatedButton _buildButton(BuildContext context) {
    requestLogin() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var userEmail = prefs.getString('user-email');
      requestLoginUser(userEmail, controller.passwordController.text);
    }

    validateFromInput() async {
      if (controller.passwordController.text.isEmpty) {
        showSnackBar("password cannot be empty", Colors.red);
      } else {
        await requestLogin();
      }
    }

    return ElevatedButton(
      onPressed: () async {
        await validateFromInput();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[900],
        splashFactory: InkSplash.splashFactory,
        minimumSize: const Size(double.infinity, 48.0),
      ).copyWith(overlayColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // Customize the overlay color when pressed
            return Colors.blue[800]!;
          }
          return Colors.transparent;
        },
      )),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
    );
  }

  Text _infoMessage() {
    return Text(
      'Please Enter Your Password To Access Payslip',
      textAlign: TextAlign.center,
      style: AppStyle.txtSFProDisplay22indigo400,
    );
  }

  onTapArrowleft11() {
    Get.back();
  }

}
