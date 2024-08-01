import '../controller/home_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../models/slidergroup_item_model.dart';

// ignore: must_be_immutable
class ListItemWidget extends StatelessWidget {
  ListItemWidget(this.listItemModelObj);

  SlidergroupItemModel listItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        width: getHorizontalSize(
          374,
        ),
        margin: getMargin(
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: getVerticalSize(
                136,
              ),
              width: getHorizontalSize(
                201,
              ),
              margin: getMargin(
                bottom: 31,
              ),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CustomImageView(
                    svgPath: listItemModelObj.image,
                    height: getVerticalSize(
                      59,
                    ),
                    width: getHorizontalSize(
                      38,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        16,
                      ),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_25_off".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOutfitBold20,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 8,
                          ),
                          child: Text(
                            "msg_on_first_cleaning".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBody,
                          ),
                        ),
                        CustomButton(
                          height: getVerticalSize(
                            36,
                          ),
                          width: getHorizontalSize(
                            109,
                          ),
                          text: "lbl_book_now".tr,
                          margin: getMargin(
                            top: 9,
                          ),
                          padding: ButtonPadding.PaddingAll7,
                          fontStyle: ButtonFontStyle.OutfitRegular16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgImage,
              height: getVerticalSize(
                95,
              ),
              width: getHorizontalSize(
                162,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  16,
                ),
              ),
              margin: getMargin(
                left: 6,
                top: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
