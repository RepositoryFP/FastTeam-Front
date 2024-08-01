import '../controller/reset_password_controller.dart';
import '../models/reset_password_item_model.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResetPasswordItemWidget extends StatelessWidget {
  ResetPasswordItemWidget(this.resetPasswordItemModelObj);

  ResetPasswordItemModel resetPasswordItemModelObj;

  var controller = Get.find<ResetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(
        69,
      ),
      width: getHorizontalSize(
        396,
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: getMargin(
                top: 8,
              ),
              padding: getPadding(
                left: 16,
                top: 18,
                right: 16,
                bottom: 18,
              ),
              decoration: AppDecoration.outlineGray300.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgDots,
                    height: getVerticalSize(
                      6,
                    ),
                    width: getHorizontalSize(
                      118,
                    ),
                    margin: getMargin(
                      top: 10,
                      bottom: 9,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgAirplane,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                    margin: getMargin(
                      top: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: getVerticalSize(
                17,
              ),
              width: getHorizontalSize(
                62,
              ),
              margin: getMargin(
                left: 24,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: getVerticalSize(
                        16,
                      ),
                      width: getHorizontalSize(
                        62,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.whiteA700,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Obx(
                      () => Text(
                        resetPasswordItemModelObj.passwordtypeTxt.value,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtFootnote,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
