import 'controller/reset_password_success_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordSuccessScreen
    extends GetWidget<ResetPasswordSuccessController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle378,
                height: getVerticalSize(
                  926,
                ),
                width: getHorizontalSize(
                  428,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
