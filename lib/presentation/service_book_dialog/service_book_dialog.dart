import 'controller/service_book_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ServiceBookDialog extends StatelessWidget {
  ServiceBookDialog(this.controller);

  ServiceBookController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getHorizontalSize(396),
        padding: getPadding(left: 44, top: 38, right: 44, bottom: 38),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("msg_your_service_has".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOutfitBold22),
              CustomImageView(
                  svgPath: ImageConstant.imgCheckmark,
                  height: getSize(96),
                  width: getSize(96),
                  margin: getMargin(top: 23)),
              Container(
                  width: getHorizontalSize(306),
                  margin: getMargin(top: 24),
                  child: Text("msg_witness_the_magic".tr,
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtBody)),
              CustomButton(
                  height: getVerticalSize(53),
                  text: "lbl_go_to_home".tr,
                  margin: getMargin(left: 28, top: 20, right: 28),
                  onTap: () {
                    onTapGotohome();
                  })
            ]));
  }

  onTapGotohome() {
   Get.offAllNamed(AppRoutes.homeContainerScreen);
  }
}
