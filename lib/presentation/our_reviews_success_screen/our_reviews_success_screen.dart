import 'controller/our_reviews_success_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OurReviewsSuccessScreen extends GetWidget<OurReviewsSuccessController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: getPadding(
         left: 54,
         top: 48,
         right: 54,
         bottom: 48),
     child: Column(
         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment:
         MainAxisAlignment.start,
         children: [
          Text("lbl_review_submit".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style:
              AppStyle.txtOutfitBold22),
          CustomImageView(
              svgPath:
              ImageConstant.imgCheckmark,
              height: getSize(96),
              width: getSize(96),
              margin: getMargin(top: 23)),
          Padding(
              padding: getPadding(top: 25),
              child: Text(
                  "msg_you_have_successfully2"
                      .tr,
                  overflow:
                  TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtBody)),
          CustomButton(
              height: getVerticalSize(53),
              text: "lbl_go_to_home2".tr,
              margin: getMargin(
                  left: 18,
                  top: 21,
                  right: 18),
              onTap: () {
               onTapGotohome();
              })
         ]),
    );
  }

  onTapGotohome() {
   Get.offAllNamed(AppRoutes.homeContainerScreen);
  }
}
