import 'package:fastteam_app/presentation/booking_upcoming_screen/models/booking_item_model.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../dlete_booking_order_dialog/controller/dlete_booking_order_controller.dart';
import '../dlete_booking_order_dialog/dlete_booking_order_dialog.dart';
import '../our_reviews_screen/our_reviews_screen.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class BookingDetailsScreen extends StatefulWidget {
   BookingDetailsScreen( {Key? key,required this.model}) : super(key: key);
   late BookingItemModel model;

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
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
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: Scaffold(
            backgroundColor: ColorConstant.gray5001,
            appBar: CustomAppBar(
              height: getVerticalSize(81),
              leadingWidth: 40,
              leading: AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 16, top: 29, bottom: 28),
                  onTap: () {
                    onTapArrowleft16();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_booking_details".tr),
            ),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 18),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: double.maxFinite,
                              child: Container(
                                  padding: getPadding(
                                      left: 16, top: 19, right: 16, bottom: 19),
                                  decoration: AppDecoration.white,
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: getPadding(left: 4, top: 2),
                                            child: Text("lbl_customer".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtCallout)),
                                        Padding(
                                            padding: getPadding(
                                                left: 4, top: 17, right: 5),
                                            child: Row(children: [
                                              CustomImageView(
                                                  imagePath:
                                                  ImageConstant.imgEllipse225,
                                                  height: getSize(56),
                                                  width: getSize(56),
                                                  radius: BorderRadius.circular(
                                                      getHorizontalSize(28))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 14,
                                                      top: 17,
                                                      bottom: 18),
                                                  child: Text(
                                                      "lbl_ace_car_wash".tr,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style:
                                                      AppStyle.txtCallout)),
                                              Spacer(),
                                              CustomIconButton(
                                                  height: 45,
                                                  width: 45,
                                                  margin: getMargin(
                                                      top: 5, bottom: 5),
                                                  child: CustomImageView(
                                                      svgPath:
                                                      ImageConstant.imgCall))
                                            ])),
                                        Padding(
                                            padding: getPadding(top: 21),
                                            child: Text("lbl_shop_address".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtBodyGray600)),
                                        Padding(
                                            padding: getPadding(top: 14),
                                            child: Text("msg_4140_parker_rd".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtBody)),
                                        Padding(
                                            padding: getPadding(top: 18),
                                            child: Divider(
                                                height: getVerticalSize(1),
                                                thickness: getVerticalSize(1),
                                                color: ColorConstant.gray300)),
                                        Padding(
                                            padding: getPadding(top: 19),
                                            child: Text("msg_client_ronald".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtBody)),
                                        Padding(
                                            padding: getPadding(top: 15),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "lbl_phone_1".tr,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .black900,
                                                          fontSize:
                                                          getFontSize(16),
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                          FontWeight.w400)),
                                                  TextSpan(
                                                      text: "lbl_505_765_1633".tr,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .black900,
                                                          fontSize:
                                                          getFontSize(16),
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                          FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                       //widget.model.status!.toLowerCase()=="cancelled"
                                       widget.model.status!.toLowerCase()=="completed"?
                                       GestureDetector(
                                           onTap: () {
                                             onTapRating();
                                           },
                                           child: Padding(
                                               padding: getPadding(top: 16),
                                               child: Row(crossAxisAlignment: CrossAxisAlignment.center,children: [
                                                 Text("lbl_rating".tr,
                                                     overflow:
                                                     TextOverflow.ellipsis,
                                                     textAlign: TextAlign.left,
                                                     style: AppStyle.txtBody),
                                                 CustomImageView(
                                                     svgPath: ImageConstant
                                                         .imgIcstarOrange300,
                                                     height: getSize(16),
                                                     width: getSize(16),
                                                     margin: getMargin(
                                                         left: 9, bottom: 0)),
                                                 CustomImageView(
                                                     svgPath: ImageConstant
                                                         .imgIcstarOrange300,
                                                     height: getSize(16),
                                                     width: getSize(16),
                                                     margin: getMargin(
                                                         left: 11, bottom: 0)),
                                                 CustomImageView(
                                                     svgPath: ImageConstant
                                                         .imgIcstarOrange300,
                                                     height: getSize(16),
                                                     width: getSize(16),
                                                     margin: getMargin(
                                                         left: 11, bottom: 0)),
                                                 CustomImageView(
                                                     svgPath: ImageConstant
                                                         .imgIcstarOrange300,
                                                     height: getSize(16),
                                                     width: getSize(16),
                                                     margin: getMargin(
                                                         left: 11, bottom: 0)),
                                                 CustomImageView(
                                                     svgPath: ImageConstant
                                                         .imgIcstarOrange300,
                                                     height: getSize(16),
                                                     width: getSize(16),
                                                     margin: getMargin(
                                                         left: 11, bottom: 0))
                                               ]))):widget.model.status!.toLowerCase()=="pending"?
                                       Padding(
                                            padding: getPadding(top: 21),
                                            child: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      insetPadding:
                                                      EdgeInsets.all(16),
                                                      shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              20)),
                                                      contentPadding:
                                                      EdgeInsets.zero,
                                                      content:
                                                      DleteBookingOrderDialog(
                                                          DleteBookingOrderController()),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text("lbl_cancel_booking".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                  AppStyle.txtCalloutRed500),
                                            )):SizedBox()
                                      ]))),
                          Container(
                              width: double.maxFinite,
                              child: Container(
                                  width: double.maxFinite,
                                  margin: getMargin(top: 20),
                                  padding: getPadding(
                                      left: 16, top: 13, right: 16, bottom: 13),
                                  decoration: AppDecoration.white,
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: getPadding(top: 3),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "msg_payment_method2"
                                                          .tr,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .black900,
                                                          fontSize:
                                                          getFontSize(16),
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                          FontWeight.w600)),
                                                  TextSpan(
                                                      text: "lbl_card".tr,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .black900,
                                                          fontSize:
                                                          getFontSize(16),
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                          FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Padding(
                                            padding: getPadding(top: 15),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "msg_payment_status2"
                                                          .tr,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .black900,
                                                          fontSize:
                                                          getFontSize(16),
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                          FontWeight.w600)),
                                                  TextSpan(
                                                      text: "msg_payment_complete"
                                                          .tr,
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .black900,
                                                          fontSize:
                                                          getFontSize(16),
                                                          fontFamily: 'Outfit',
                                                          fontWeight:
                                                          FontWeight.w400))
                                                ]),
                                                textAlign: TextAlign.left))
                                      ]))),
                          Container(
                              width: double.maxFinite,
                              child: Container(
                                  margin: getMargin(top: 20),
                                  padding: getPadding(
                                      left: 16, top: 17, right: 16, bottom: 17),
                                  decoration: AppDecoration.white,
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("msg_platinum_package2".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtCallout),
                                        Padding(
                                            padding:
                                            getPadding(top: 17, right: 22),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(top: 1),
                                                      child: Text(
                                                          "msg_interior_cleaning"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style:
                                                          AppStyle.txtBody)),
                                                  Padding(
                                                      padding:
                                                      getPadding(bottom: 1),
                                                      child: Text("lbl_30_00".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style:
                                                          AppStyle.txtBody))
                                                ])),
                                        Padding(
                                            padding:
                                            getPadding(top: 17, right: 22),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text("lbl_shine_wax".tr,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle.txtBody),
                                                  Text("lbl_30_00".tr,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle.txtBody)
                                                ])),
                                        Padding(
                                            padding:
                                            getPadding(top: 19, right: 22),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(top: 1),
                                                      child: Text(
                                                          "msg_exterior_cleaning"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style:
                                                          AppStyle.txtBody)),
                                                  Padding(
                                                      padding:
                                                      getPadding(bottom: 1),
                                                      child: Text("lbl_30_00".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style:
                                                          AppStyle.txtBody))
                                                ])),
                                        Padding(
                                            padding:
                                            getPadding(top: 17, right: 22),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text("lbl_car_wash2".tr,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle.txtBody),
                                                  Text("lbl_10_00".tr,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle.txtBody)
                                                ])),
                                        Padding(
                                            padding:
                                            getPadding(top: 19, right: 22),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(top: 1),
                                                      child: Text(
                                                          "lbl_car_detailing".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style:
                                                          AppStyle.txtBody)),
                                                  Padding(
                                                      padding:
                                                      getPadding(bottom: 1),
                                                      child: Text("lbl_20_00".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.left,
                                                          style:
                                                          AppStyle.txtBody))
                                                ])),
                                        Padding(
                                            padding: getPadding(top: 15),
                                            child: Divider(
                                                height: getVerticalSize(1),
                                                thickness: getVerticalSize(1),
                                                color: ColorConstant.gray300,
                                                endIndent:
                                                getHorizontalSize(22))),
                                        Padding(
                                            padding:
                                            getPadding(top: 20, right: 22),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text("lbl_total".tr,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style:
                                                      AppStyle.txtHeadline),
                                                  Text("lbl_120_00".tr,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle.txtHeadline)
                                                ]))
                                      ])))
                        ])))),
      ),
    );
  }

  onTapArrowleft16() {
    Get.back();
  }
  onTapRating() {


    showDialog(
      barrierDismissible: false,
      context: context,

      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
          EdgeInsets.zero,
          content: OurReviewsScreen(),
        );
      },
    );
    // Get.toNamed(
    //   AppRoutes.ourReviewsScreen,
    // );
  }
}


