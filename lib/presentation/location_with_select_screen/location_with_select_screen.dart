import 'package:flutter/services.dart';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_bottom_bar.dart';
import 'package:fastteam_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;



class LocationWithSelectScreen extends StatefulWidget {
  const LocationWithSelectScreen({Key? key}) : super(key: key);

  @override
  State<LocationWithSelectScreen> createState() => _LocationWithSelectScreenState();
}

class _LocationWithSelectScreenState extends State<LocationWithSelectScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: size.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgRectangle4388,
                      height: getVerticalSize(838),
                      width: getHorizontalSize(428),
                      alignment: Alignment.topCenter),
                  Container(
                      height: getVerticalSize(696),
                      width: getHorizontalSize(396),
                      margin: getMargin(top: 30),
                      child:
                      Stack(alignment: Alignment.bottomCenter, children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: getMargin(
                                    left: 13, top: 23, right: 33, bottom: 101),
                                padding: getPadding(
                                    left: 76, top: 77, right: 76, bottom: 77),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: fs.Svg(ImageConstant.imgGroup5),
                                        fit: BoxFit.cover)),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Spacer(),
                                      CustomImageView(
                                          svgPath:
                                          ImageConstant.imgLocationarrow,
                                          height: getVerticalSize(27),
                                          width: getHorizontalSize(26))
                                    ]))),
                        Align(
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
                                                        "lbl_speedy_wash".tr,
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
                                            onTapBtnLocation();
                                          },
                                          child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgLocationWhiteA70050x50))
                                    ]))),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                margin: getMargin(bottom: 650),
                                padding: getPadding(
                                    left: 20, top: 10, right: 20, bottom: 10),
                                decoration: AppDecoration.fillGray50.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.roundedBorder16),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgSearch,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(bottom: 2)),
                                      Padding(
                                          padding: getPadding(
                                              left: 13, top: 2, bottom: 2),
                                          child: Text("lbl_speedy_wash2".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtBody)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightBlack900,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(top: 1, bottom: 1))
                                    ])))
                      ]))
                ])),
            bottomNavigationBar:
            CustomBottomBar(onChanged: (BottomBarEnum type) {})));
  }

  onTapBtnLocation() {
    Get.toNamed(
      AppRoutes.locationWithSelectOneScreen,
    );
  }
}



