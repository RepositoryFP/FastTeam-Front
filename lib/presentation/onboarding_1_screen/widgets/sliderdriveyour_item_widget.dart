import '../controller/onboarding_1_controller.dart';
import '../models/sliderdriveyour_item_model.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderdriveyourItemWidget extends StatelessWidget {
  SliderdriveyourItemWidget(this.sliderdriveyourItemModelObj);

  SliderdriveyourItemModel sliderdriveyourItemModelObj;

  var controller = Get.find<Onboarding1Controller>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: getHorizontalSize(
            257,
          ),
          child: Text(
            "msg_drive_your_car_clean".tr,
            maxLines: null,
            textAlign: TextAlign.center,
            style: AppStyle.txtOutfitBold28,
          ),
        ),
        Container(
          width: getHorizontalSize(
            290,
          ),
          margin: getMargin(
            top: 18,
          ),
          child: Text(
            "msg_meet_the_nearest".tr,
            maxLines: null,
            textAlign: TextAlign.center,
            style: AppStyle.txtBody,
          ),
        ),
      ],
    );
  }
}
