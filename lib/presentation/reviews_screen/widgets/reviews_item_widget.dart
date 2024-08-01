import '../../customer_reviews_screen/models/clientrevies_item_model.dart';
import '../controller/reviews_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReviewsItemWidget extends StatelessWidget {
  ReviewsItemWidget(this.reviewsItemModelObj);

  ClientreviesItemModel reviewsItemModelObj;

  var controller = Get.find<ReviewsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 16,
          top: 13,
          right: 16,
          bottom: 13,
        ),
        decoration: AppDecoration.fillGray5001,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(
                top: 2,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: reviewsItemModelObj.userImage,
                    height: getSize(
                      56,
                    ),
                    width: getSize(
                      56,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 17,
                      top: 1,
                      bottom: 8,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          reviewsItemModelObj.name!,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtBody,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgIcstar,
                                height: getSize(
                                  19,
                                ),
                                width: getSize(
                                  19,
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgIcstar,
                                height: getSize(
                                  19,
                                ),
                                width: getSize(
                                  19,
                                ),
                                margin: getMargin(
                                  left: 4,
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgIcstar,
                                height: getSize(
                                  19,
                                ),
                                width: getSize(
                                  19,
                                ),
                                margin: getMargin(
                                  left: 4,
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgIcstar,
                                height: getSize(
                                  19,
                                ),
                                width: getSize(
                                  19,
                                ),
                                margin: getMargin(
                                  left: 4,
                                ),
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.imgIcstar,
                                height: getSize(
                                  19,
                                ),
                                width: getSize(
                                  19,
                                ),
                                margin: getMargin(
                                  left: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: getHorizontalSize(
                305,
              ),
              margin: getMargin(
                top: 16,
                right: 58,
              ),
              child: Text(
                reviewsItemModelObj.reviewDescription!,
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtBody,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
