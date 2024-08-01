import 'package:fastteam_app/presentation/our_reviews_success_screen/our_reviews_success_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'controller/our_reviews_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class OurReviewsScreen extends StatefulWidget {
  const OurReviewsScreen({Key? key}) : super(key: key);

  @override
  State<OurReviewsScreen> createState() => _OurReviewsScreenState();
}

class _OurReviewsScreenState extends State<OurReviewsScreen> {
  OurReviewsController controller = Get.put(OurReviewsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 20, bottom: 19),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: getVerticalSize(9),
          ),
          CustomImageView(
            svgPath: ImageConstant.imgEditGreenIcon,
          ),
          Container(
              width: double.infinity,
              margin: getMargin(top: 20),
              child: Text("msg_you_have_done_using".tr,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtOutfitBold22)),
          Container(
              width: double.infinity,
              margin: getMargin(top: 20),
              child: Text("msg_please_leave_your".tr,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtBody)),
          SizedBox(
            height: getVerticalSize(16),
          ),
          RatingBar(
            initialRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 25,
            glow: false,
            ratingWidget: RatingWidget(
                full: CustomImageView(
                  svgPath: ImageConstant.imgRatingFill,
                  height: getVerticalSize(30),
                  width: getVerticalSize(30),
                ),
                half: CustomImageView(
                  svgPath: ImageConstant.imgRatingEmpty,
                  height: getVerticalSize(30),
                  width: getVerticalSize(30),
                ),
                empty: CustomImageView(
                  svgPath: ImageConstant.imgRatingEmpty,
                  height: getVerticalSize(30),
                  width: getVerticalSize(30),
                )),
            itemPadding: getPadding(left: 10, right: 10),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Padding(
            padding: getPadding(left: 16, right: 16),
            child: CustomTextFormField(
                focusNode: FocusNode(),
                autofocus: true,
                controller: controller.englishtextController,
                hintText: "msg_write_your_review".tr,
                margin: getMargin(top: 30),
                variant: TextFormFieldVariant.White,
                padding: TextFormFieldPadding.PaddingAll16,
                fontStyle: TextFormFieldFontStyle.OutfitRegular17,
                textInputAction: TextInputAction.done),
          ),
          CustomButton(
              height: getVerticalSize(57),
              width: getHorizontalSize(242),
              text: "lbl_write_review".tr,
              margin: getMargin(top: 25, bottom: 4),
              onTap: () {
                onTapWritereview();
              })
        ],
      ),
    );
  }

  onTapWritereview() {
    Get.back();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.zero,
          content: OurReviewsSuccessScreen(),
        );
      },
    );
  }
}
