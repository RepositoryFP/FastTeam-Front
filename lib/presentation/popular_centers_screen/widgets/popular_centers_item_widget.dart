import '../../home_page/models/populer_center_model.dart';
import '../controller/popular_centers_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PopularCentersItemWidget extends StatelessWidget {
  PopularCentersItemWidget(
    this.popularCentersItemModelObj, {
    this.onTapColumnrectangle,
  });
  PopularCentersController popularCentersController = Get.put(PopularCentersController());
  PopulerCenterData popularCentersItemModelObj;


  var controller = Get.find<PopularCentersController>();

  VoidCallback? onTapColumnrectangle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumnrectangle?.call();
      },
      child: Container(
          decoration: AppDecoration.white.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Padding(
            padding: getPadding(all: 8),
            child: Column(
                mainAxisSize:
                MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                mainAxisAlignment:
                MainAxisAlignment
                    .start,
                children: [
                  CustomImageView(
                      imagePath:
                      popularCentersItemModelObj.image,
                      height:
                      getVerticalSize(
                          104),
                      width:
                      getHorizontalSize(
                          176),
                      radius: BorderRadius
                          .circular(
                          getHorizontalSize(
                              8))),
                  Padding(
                      padding:
                      getPadding(
                          top: 8),
                      child: Text(
                          popularCentersItemModelObj.title!,
                          overflow:
                          TextOverflow
                              .ellipsis,
                          textAlign:
                          TextAlign
                              .left,
                          style: AppStyle
                              .txtSubheadline)),
                  Padding(
                      padding:
                      getPadding(
                        top: 7,
                      ),
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomImageView(
                                    svgPath:
                                    ImageConstant.imgLocationIcon,
                                    height: getSize(14),
                                    width: getSize(14),
                                    margin: getMargin(top: 1, bottom: 2)),
                                Padding(
                                    padding:
                                    getPadding(left: 4, top: 1),
                                    child: Text("${popularCentersItemModelObj.distance!} mi away", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtOutfitRegular12)),
                              ],
                            ),
                            Row(
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant
                                        .imgIcstar,
                                    height: getSize(
                                        14),
                                    width: getSize(
                                        14),
                                    margin: getMargin(
                                        left: 55,
                                        top: 1,
                                        bottom: 2)),
                                Padding(
                                    padding:
                                    getPadding(left: 4, bottom: 1),
                                    child: Text(popularCentersItemModelObj.rate!, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtOutfitRegular12Black900))
                              ],
                            )
                          ]))
                ]),
          )),
    );























  }
}
