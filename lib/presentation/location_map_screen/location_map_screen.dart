import 'package:flutter/services.dart';

import '../location_with_select_one_screen/location_with_select_one_screen.dart';
import 'controller/location_map_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_icon_button.dart';
import 'package:fastteam_app/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable

class LocationMapScreen extends StatefulWidget {
  const LocationMapScreen({Key? key}) : super(key: key);

  @override
  State<LocationMapScreen> createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  LocationMapController locationMapController =
  Get.put(LocationMapController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationMapController>(
      init: LocationMapController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstant.imgBackground),
                      fit: BoxFit.fill)),
              height: double.infinity,
              width: double.maxFinite,
              child: SafeArea(
                child: Padding(
                  padding: getPadding(left: 16, right: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: getPadding(top: 30),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CustomSearchView(

                            onFieldSubmitted: (value) {
                              controller.setSerching(value);
                            },
                            width: double.infinity,
                            controller: controller.searchController,
                            hintText: "lbl_search_location".tr,
                            variant: SearchViewVariant.FillWhiteA700,
                            alignment: Alignment.topCenter,
                            prefix: Container(
                              margin: getMargin(
                                left: 20,
                                top: 11,
                                right: 13,
                                bottom: 11,
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgSearch,
                              ),
                            ),
                            prefixConstraints: BoxConstraints(
                              maxHeight: getVerticalSize(
                                46,
                              ),
                            ),
                            suffix: Padding(
                              padding: EdgeInsets.only(
                                right: getHorizontalSize(
                                  15,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  controller.searchController.clear();
                                  controller.setSerching("");
                                },
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      controller.serchingText.isNotEmpty?  Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: getMargin(top: 576),
                              padding: getPadding(all: 16),
                              decoration: AppDecoration.outlineGray9000f
                                  .copyWith(
                                  borderRadius:
                                  BorderRadiusStyle.roundedBorder16),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                        imagePath:
                                        ImageConstant.imgRectangle2,
                                        height: getVerticalSize(88),
                                        width: getHorizontalSize(110),
                                        radius: BorderRadius.circular(
                                            getHorizontalSize(10))),
                                    Padding(
                                        padding: getPadding(
                                            left: 16, top: 17, bottom: 15),
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      controller.serchingText,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      textAlign:
                                                      TextAlign.left,
                                                      style: AppStyle
                                                          .txtHeadline)),
                                              Padding(
                                                  padding: getPadding(top: 8),
                                                  child: Row(children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgEyeIndigo800,
                                                        height: getSize(24),
                                                        width: getSize(24)),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 3,
                                                            top: 1,
                                                            bottom: 1),
                                                        child: Text(
                                                            "lbl_10_mtr_left"
                                                                .tr,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                            TextAlign
                                                                .left,
                                                            style: AppStyle
                                                                .txtBodyGray600))
                                                  ]))
                                            ])),
                                    Spacer(),
                                    CustomIconButton(
                                        height: 50,
                                        width: 50,
                                        margin: getMargin(
                                            top: 23, right: 4, bottom: 15),
                                        variant: IconButtonVariant
                                            .OutlineGray9000f,
                                        shape: IconButtonShape.CircleBorder14,
                                        padding:
                                        IconButtonPadding.PaddingAll17,
                                        onTap: () {
                                          onTapBtnLocation(context);
                                        },
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgLocationWhiteA70050x50))
                                  ]))):SizedBox()
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
  onTapBtnLocation(context) {
    showDialog(
      barrierDismissible: false,
      context: context,

      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
          EdgeInsets.zero,
          content: LocationWithSelectOneScreen(),
        );
      },
    );


  }
}



