import 'controller/dlete_booking_order_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DleteBookingOrderDialog extends StatelessWidget {
  DleteBookingOrderDialog(this.controller);

  DleteBookingOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getHorizontalSize(396),
        padding: getPadding(left: 0, top: 38, right: 0, bottom: 38),
        decoration: AppDecoration.white
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "msg_are_you_sure_you".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtHeadline,
            ),
            Padding(
              padding: getPadding(
                left: 30,
                top: 28,
                right: 30,
                bottom: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      height: getVerticalSize(
                        46,
                      ),
                      onTap: (){Get.back();},
                      text: "lbl_no".tr,
                      margin: getMargin(
                        right: 10,
                      ),
                      padding: ButtonPadding.PaddingT0,
                      variant: ButtonVariant.OutlineIndigo800,
                      shape: ButtonShape.RoundedBorder8,
                      fontStyle: ButtonFontStyle.OutfitBold18Indigo800,
                    ),
                  ),
                  Expanded(

                    child: CustomButton(
                      onTap: (){
                        Get.back();
                        Get.back();
                        },
                      height: getVerticalSize(
                        46,
                      ),
                      text: "lbl_yes".tr,
                      margin: getMargin(
                        left: 10,
                      ),
                      shape: ButtonShape.RoundedBorder8,
                      padding: ButtonPadding.PaddingT0,

                    ),
                  ),
                ],
              ),
            ),
          ],
        ));

  }
}
