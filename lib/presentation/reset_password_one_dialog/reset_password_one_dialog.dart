import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordOneDialog extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Container(
        width: getHorizontalSize(396),
        padding: getPadding(left: 37, top: 38, right: 37, bottom: 38),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: getPadding(top: 2),
                  child: Text("msg_password_updated".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOutfitBold22)),
              CustomImageView(
                  svgPath: ImageConstant.imgCheckmark,
                  height: getSize(96),
                  width: getSize(96),
                  margin: getMargin(top: 21)),
              Container(
                  width: getHorizontalSize(317),
                  margin: getMargin(top: 24),
                  child: Text("msg_you_have_successfully".tr,
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtBody)),
              CustomButton(
                  height: getVerticalSize(53),
                  text: "lbl_go_to_log_in".tr,
                  margin: getMargin(left: 35, top: 20, right: 35),
                  onTap: () {
                    onTapGotologin();
                  })
            ]));
  }

  onTapGotologin() {
    Get.offAllNamed(
      AppRoutes.logInScreen,
    );
  }
}
