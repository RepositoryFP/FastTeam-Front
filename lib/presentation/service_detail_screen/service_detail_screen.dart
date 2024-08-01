import 'package:fastteam_app/presentation/service_detail_screen/models/packege_data.dart';
import 'package:flutter/services.dart';

import '../location_with_select_one_screen/controller/location_with_select_one_controller.dart';
import 'controller/service_detail_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'models/service_detail_model.dart';


class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({Key? key}) : super(key: key);

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  LocationWithSelectOneController locationWithSelectOneController =
  Get.put(LocationWithSelectOneController());
  List<ServiceDetailModel> packegeData = PackegeData.getPackegeData();
  PageController pageController = PageController();
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
    return GetBuilder<LocationWithSelectOneController>(
      init: LocationWithSelectOneController(),
      builder: (lovcationcontroller) => WillPopScope(
        onWillPop: () async {
          if (lovcationcontroller.isNavigate) {
            Get.back();
            Get.back();
            lovcationcontroller.setDetailNavigationIsHome(false);
          } else {
            Get.back();
          }
          return true;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray5001,
            body: GetBuilder<ServiceDetailController>(
              init: ServiceDetailController(),
              builder: (controller) => SizedBox(
                  width: size.width,
                  child: Padding(
                      padding: getPadding(bottom: 5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: getVerticalSize(286),
                                width: double.maxFinite,
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Container(
                                        height: getSize(286),
                                        child: PageView.builder(
                                          onPageChanged: (value) {
                                            controller.setCurrentPage(value);
                                          },
                                          controller: pageController,
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle28,
                                                height: getVerticalSize(286),
                                                width: double.infinity,
                                                alignment: Alignment.center);
                                          },
                                        ),
                                      ),
                                      SafeArea(
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 12,
                                                    top: 8,
                                                    bottom: 13),
                                                child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      CustomIconButton(
                                                          height: 36,
                                                          width: 36,
                                                          variant:
                                                          IconButtonVariant
                                                              .White,
                                                          onTap: () {
                                                            if (lovcationcontroller
                                                                .isNavigate) {
                                                              Get.back();
                                                              Get.back();
                                                              // Get.offAllNamed(
                                                              //     AppRoutes
                                                              //         .homeContainerScreen);
                                                              lovcationcontroller
                                                                  .setDetailNavigationIsHome(
                                                                  false);
                                                            } else {
                                                              Get.back();
                                                            }
                                                          },
                                                          child: CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgArrowleft)),
                                                      Container(
                                                        width: getSize(68),
                                                        height: getSize(36),
                                                        decoration: AppDecoration
                                                            .fillWhiteBorder24,
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Text(
                                                                  "${controller.currentPage + 1}",
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
                                                                  style: AppStyle
                                                                      .txtSFProDisplayindigo400),
                                                              Text(" / ${3}",
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
                                                                  style: AppStyle
                                                                      .txtSFProDisplayblack400),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ]))),
                                      )
                                    ])),
                            Expanded(
                              child: ListView(
                                children: [
                                  Container(
                                      width: double.maxFinite,
                                      child: Container(
                                          width: double.maxFinite,
                                          margin: getMargin(top: 0),
                                          padding: getPadding(
                                              left: 16,
                                              top: 11,
                                              right: 16,
                                              bottom: 11),
                                          decoration: AppDecoration.white,
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text("lbl_wash_shine".tr,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtOutfitBold20),
                                                Padding(
                                                    padding:
                                                    getPadding(top: 11),
                                                    child: Text(
                                                        "msg_3891_ranchview_dr"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                        TextAlign.left,
                                                        style:
                                                        AppStyle.txtBody)),
                                                Padding(
                                                    padding:
                                                    getPadding(top: 10),
                                                    child: Row(children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgIcstar,
                                                          height: getSize(24),
                                                          width: getSize(24)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 2,
                                                              top: 3,
                                                              bottom: 3),
                                                          child: Text(
                                                              "lbl_4_9".tr,
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: AppStyle
                                                                  .txtFootnoteGray600)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 6,
                                                              top: 4,
                                                              bottom: 2),
                                                          child: Text(
                                                              "lbl_1200_reviews"
                                                                  .tr,
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: AppStyle
                                                                  .txtFootnoteGray600))
                                                    ]))
                                              ]))),
                                  Container(
                                      width: double.maxFinite,
                                      child: Container(
                                          margin: getMargin(top: 20),
                                          padding: getPadding(
                                              left: 16,
                                              top: 17,
                                              right: 16,
                                              bottom: 17),
                                          decoration: AppDecoration.white,
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text("lbl_service_pakage".tr,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtOutfitBold20),
                                                ListView.builder(
                                                  itemCount: packegeData.length,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    ServiceDetailModel data =
                                                    packegeData[index];
                                                    return Padding(
                                                      padding: getPadding(
                                                          top: 10, bottom: 10),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .setCurrentPackege(
                                                              index);
                                                        },
                                                        child: Container(
                                                            width: double
                                                                .maxFinite,
                                                            child: Container(
                                                                padding: getPadding(
                                                                    left: 16,
                                                                    top: 15,
                                                                    right: 16,
                                                                    bottom: 15),
                                                                decoration: controller
                                                                    .currentPackege ==
                                                                    index
                                                                    ? AppDecoration
                                                                    .outlineIndigo800
                                                                    .copyWith(
                                                                    borderRadius: BorderRadiusStyle
                                                                        .roundedBorder16)
                                                                    : AppDecoration
                                                                    .fillGray5001
                                                                    .copyWith(
                                                                    borderRadius: BorderRadiusStyle
                                                                        .roundedBorder16),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Row(
                                                                          mainAxisAlignment: MainAxisAlignment
                                                                              .spaceBetween,
                                                                          crossAxisAlignment:
                                                                          CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                                padding: getPadding(top: 1),
                                                                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                  Text(data.packegeName!, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtHeadline),
                                                                                  Padding(padding: getPadding(top: 6), child: Text(data.packegePrice!, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtHeadlineIndigo800))
                                                                                ])),
                                                                            controller.currentPackege == index?CustomImageView(
                                                                                svgPath: ImageConstant.imgSelectedRadio ,
                                                                                height: getSize(24),
                                                                                width: getSize(24),
                                                                                margin: getMargin(bottom: 30)):SizedBox()
                                                                          ]),
                                                                      controller.currentPackege ==
                                                                          index
                                                                          ? ListView
                                                                          .builder(
                                                                        padding: getPadding(left: 9, top: 1),
                                                                        primary: false,
                                                                        shrinkWrap: true,
                                                                        itemCount: data.packegeFeature!.length,
                                                                        itemBuilder: (context, index) {
                                                                          String features = data.packegeFeature![index];
                                                                          return Padding(
                                                                            padding: getPadding(top: 4, bottom: 4),
                                                                            child: Text("•  ${features}", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtBody),
                                                                          );
                                                                        },
                                                                      )
                                                                          : SizedBox(),
                                                                    ]))),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ]))),
                                  Container(
                                      width: double.maxFinite,
                                      child: Container(
                                          margin: getMargin(top: 20),
                                          padding: getPadding(
                                              left: 16,
                                              top: 15,
                                              right: 16,
                                              bottom: 15),
                                          decoration: AppDecoration.white,
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                          "msg_customer_reviews"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: AppStyle
                                                              .txtOutfitBold20),
                                                      GestureDetector(
                                                          onTap: () {
                                                            onTapTxtViewall();
                                                          },
                                                          child: Padding(
                                                              padding:
                                                              getPadding(
                                                                  top: 2,
                                                                  bottom:
                                                                  2),
                                                              child: Text(
                                                                  "lbl_view_all2"
                                                                      .tr,
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  textAlign:
                                                                  TextAlign
                                                                      .left,
                                                                  style: AppStyle
                                                                      .txtBody)))
                                                    ]),
                                                Container(
                                                    width: double.maxFinite,
                                                    child: Container(
                                                        width:
                                                        getHorizontalSize(
                                                            396),
                                                        margin:
                                                        getMargin(top: 19),
                                                        padding: getPadding(
                                                            left: 16,
                                                            top: 13,
                                                            right: 16,
                                                            bottom: 13),
                                                        decoration:
                                                        AppDecoration
                                                            .fillGray5001,
                                                        child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Padding(
                                                                  padding:
                                                                  getPadding(
                                                                      top:
                                                                      2),
                                                                  child: Row(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        CustomImageView(
                                                                            imagePath:
                                                                            ImageConstant.imgEllipse30,
                                                                            height: getSize(56),
                                                                            width: getSize(56),
                                                                            radius: BorderRadius.circular(getHorizontalSize(28))),
                                                                        Padding(
                                                                            padding: getPadding(
                                                                                left: 17,
                                                                                top: 1,
                                                                                bottom: 8),
                                                                            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                              Text("lbl_ralph_edwards".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtBody),
                                                                              Padding(
                                                                                  padding: getPadding(top: 5),
                                                                                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                                    CustomImageView(svgPath: ImageConstant.imgIcstar, height: getSize(19), width: getSize(19)),
                                                                                    CustomImageView(svgPath: ImageConstant.imgIcstar, height: getSize(19), width: getSize(19), margin: getMargin(left: 4)),
                                                                                    CustomImageView(svgPath: ImageConstant.imgIcstar, height: getSize(19), width: getSize(19), margin: getMargin(left: 4)),
                                                                                    CustomImageView(svgPath: ImageConstant.imgIcstar, height: getSize(19), width: getSize(19), margin: getMargin(left: 4)),
                                                                                    CustomImageView(svgPath: ImageConstant.imgIcstar, height: getSize(19), width: getSize(19), margin: getMargin(left: 4))
                                                                                  ]))
                                                                            ]))
                                                                      ])),
                                                              Container(
                                                                  width:
                                                                  getHorizontalSize(
                                                                      305),
                                                                  margin:
                                                                  getMargin(
                                                                      top:
                                                                      16,
                                                                      right:
                                                                      58),
                                                                  child: Text(
                                                                      "msg_speed_car_wash_is"
                                                                          .tr,
                                                                      maxLines:
                                                                      null,
                                                                      textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                      style: AppStyle
                                                                          .txtBody))
                                                            ]))),
                                              ]))),
                                  SizedBox(
                                    height: getVerticalSize(20),
                                  )
                                ],
                              ),
                            )
                          ]))),
            ),
            bottomNavigationBar: Container(
                margin: getMargin(left: 16, right: 16, bottom: 14),
                decoration: AppDecoration.white,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                          height: getVerticalSize(54),
                          text: "lbl_book_now".tr,
                          onTap: () {
                            onTapBooknow();
                          })
                    ]))),
      ),
    );
  }

  onTapBtnArrowleft() {
    Get.back();
  }

  onTapTxtViewall() {
    Get.toNamed(
      AppRoutes.reviewsScreen,
    );
  }

  onTapBooknow() {
    Get.toNamed(
      AppRoutes.addCarDetailsOneScreen,
    );
  }
}





