import 'package:flutter/services.dart';

import '../customer_reviews_screen/models/clientrevies_item_model.dart';
import '../customer_reviews_screen/models/customer_reviews_model.dart';
import '../reviews_screen/widgets/reviews_item_widget.dart';
import 'controller/reviews_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';




class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  List<ClientreviesItemModel> review = CustomerReviewsModel.getReview();

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
      onWillPop: ()async{
        Get.back();
        return true;
      },
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
                  onTapArrowleft13();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_reviews".tr),
          ),
          body: GetBuilder<ReviewsController>(
            init: ReviewsController(),
            builder:(controller) =>  Padding(
              padding: getPadding(top: 20),
              child: Container(
                  decoration: AppDecoration.white,
                  width: double.maxFinite,
                  child: ListView(
                    padding: getPadding(left: 0,right: 0,),
                    children: [
                      Padding(
                        padding: getPadding(left: 16,right: 16,top: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("lbl_4_9".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtOutfitBold34),
                            Padding(
                                padding: getPadding(top: 13),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgIcstarOrange300,
                                          height: getSize(24),
                                          width: getSize(24)),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgIcstarOrange300,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(left: 16)),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgIcstarOrange300,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(left: 16)),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgIcstarOrange300,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(left: 16)),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgStar,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(left: 16))
                                    ])),
                            Padding(
                                padding: getPadding(top: 15),
                                child: Text("msg_based_on_23_reviews".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtBody)),
                            Padding(
                                padding: getPadding(top: 15, right: 2),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_excellent".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody),
                                      Padding(
                                          padding:
                                          getPadding(top: 7, bottom: 7),
                                          child: Container(
                                              height: getVerticalSize(6),
                                              width: getHorizontalSize(271),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .gray300),
                                              child: ClipRRect(
                                                  child: LinearProgressIndicator(
                                                      value: 0.92,
                                                      backgroundColor:
                                                      ColorConstant
                                                          .gray300,
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                          ColorConstant
                                                              .green600)))))
                                    ])),
                            Padding(
                                padding: getPadding(top: 12),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_good".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody),
                                      Padding(
                                          padding:
                                          getPadding(top: 7, bottom: 7),
                                          child: Container(
                                              height: getVerticalSize(6),
                                              width: getHorizontalSize(271),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .gray300),
                                              child: ClipRRect(
                                                  child: LinearProgressIndicator(
                                                      value: 0.79,
                                                      backgroundColor:
                                                      ColorConstant
                                                          .gray300,
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                          ColorConstant
                                                              .lime600)))))
                                    ])),
                            Padding(
                                padding: getPadding(top: 13),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_average".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody),
                                      Padding(
                                          padding:
                                          getPadding(top: 5, bottom: 9),
                                          child: Container(
                                              height: getVerticalSize(6),
                                              width: getHorizontalSize(271),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .gray300),
                                              child: ClipRRect(
                                                  child: LinearProgressIndicator(
                                                      value: 0.56,
                                                      backgroundColor:
                                                      ColorConstant
                                                          .gray300,
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                          ColorConstant
                                                              .yellow500)))))
                                    ])),
                            Padding(
                                padding: getPadding(top: 11),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_below_average".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody),
                                      Padding(
                                          padding:
                                          getPadding(top: 5, bottom: 9),
                                          child: Container(
                                              height: getVerticalSize(6),
                                              width: getHorizontalSize(271),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .gray300),
                                              child: ClipRRect(
                                                  child: LinearProgressIndicator(
                                                      value: 0.4,
                                                      backgroundColor:
                                                      ColorConstant
                                                          .gray300,
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                          ColorConstant
                                                              .yellow800)))))
                                    ])),
                            Padding(
                                padding: getPadding(top: 10),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text("lbl_poor".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtBody),
                                      Padding(
                                          padding:
                                          getPadding(top: 6, bottom: 8),
                                          child: Container(
                                              height: getVerticalSize(6),
                                              width: getHorizontalSize(271),
                                              decoration: BoxDecoration(
                                                  color: ColorConstant
                                                      .gray300),
                                              child: ClipRRect(
                                                  child: LinearProgressIndicator(
                                                      value: 0.2,
                                                      backgroundColor:
                                                      ColorConstant
                                                          .gray300,
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                          ColorConstant
                                                              .red700)))))
                                    ])),
                          ],
                        ),
                      ),
                      Padding(
                          padding: getPadding(all: 16),
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text("msg_customer_reviews2".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtOutfitBold20),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtViewall();
                                    },
                                    child: Padding(
                                        padding: getPadding(
                                            top: 2, bottom: 2),
                                        child: Text(
                                            "lbl_view_all2".tr,
                                            overflow:
                                            TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtBody)))
                              ])),
                      Align(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: getPadding(left: 16, right: 16),
                              child: IntrinsicWidth(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            controller.setCurrentReviewId(1);
                                          },
                                          child: Container(
                                              width: getHorizontalSize(79),
                                              padding: getPadding(
                                                  left: 0, top: 7, right: 0, bottom: 7),
                                              decoration: controller.currentReviewId==1?AppDecoration.fillIndigo800
                                                  .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder8):AppDecoration.outlineIndigo8001
                                                  .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder8),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgIcstarWhiteA700,
                                                        color: controller.currentReviewId==1?ColorConstant.whiteA700:ColorConstant.indigo800,
                                                        height: getSize(16),
                                                        width: getSize(16)),
                                                    Padding(
                                                        padding: getPadding(left: 8),
                                                        child: Text("lbl_all".tr,
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: controller.currentReviewId==1?AppStyle
                                                                .txtSFProTextRegular13:AppStyle
                                                                .txtSFProTextRegular13Indigo800))
                                                  ])),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            controller.setCurrentReviewId(2);
                                          },
                                          child: Container(
                                              width: getHorizontalSize(79),
                                              margin: getMargin(left: 16),
                                              padding: getPadding(
                                                  left: 17, top: 7, right: 17, bottom: 7),
                                              decoration: controller.currentReviewId==2?AppDecoration.fillIndigo800
                                                  .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder8):AppDecoration.outlineIndigo8001
                                                  .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder8),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgIcstarIndigo800,
                                                        color: controller.currentReviewId==2?ColorConstant.whiteA700:ColorConstant.indigo800,
                                                        height: getSize(16),
                                                        width: getSize(16)),
                                                    Padding(
                                                        padding: getPadding(left: 7),
                                                        child: Text("lbl_5_0".tr,
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: controller.currentReviewId==2?AppStyle
                                                                .txtSFProTextRegular13:AppStyle
                                                                .txtSFProTextRegular13Indigo800))
                                                  ])),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            controller.setCurrentReviewId(3);
                                          },
                                          child: Container(
                                              width: getHorizontalSize(79),
                                              margin: getMargin(left: 16),
                                              padding: getPadding(
                                                  left: 17, top: 7, right: 17, bottom: 7),
                                              decoration: controller.currentReviewId==3?AppDecoration.fillIndigo800
                                                  .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder8):AppDecoration.outlineIndigo8001
                                                  .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder8),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgIcstarIndigo800,
                                                        color: controller.currentReviewId==3?ColorConstant.whiteA700:ColorConstant.indigo800,
                                                        height: getSize(16),
                                                        width: getSize(16)),
                                                    Padding(
                                                        padding: getPadding(left: 7),
                                                        child: Text("lbl_4_0".tr,
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: controller.currentReviewId==3?AppStyle
                                                                .txtSFProTextRegular13:AppStyle
                                                                .txtSFProTextRegular13Indigo800))
                                                  ])),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            controller.setCurrentReviewId(4);
                                          },
                                          child: Container(
                                              width: getHorizontalSize(79),
                                              margin: getMargin(left: 16),
                                              padding: getPadding(
                                                  left: 17, top: 7, right: 17, bottom: 7),
                                              decoration: controller.currentReviewId==4?AppDecoration.fillIndigo800
                                                  .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder8):AppDecoration.outlineIndigo8001
                                                  .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder8),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgIcstarIndigo800,
                                                        color: controller.currentReviewId==4?ColorConstant.whiteA700:ColorConstant.indigo800,
                                                        height: getSize(16),
                                                        width: getSize(16)),
                                                    Padding(
                                                        padding: getPadding(left: 7),
                                                        child: Text("lbl_3_02".tr,
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: controller.currentReviewId==4?AppStyle
                                                                .txtSFProTextRegular13:AppStyle
                                                                .txtSFProTextRegular13Indigo800))
                                                  ])),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            controller.setCurrentReviewId(5);
                                          },
                                          child: Container(
                                              width: getHorizontalSize(79),
                                              margin: getMargin(left: 16),
                                              padding: getPadding(
                                                  left: 16, top: 8, right: 16, bottom: 8),
                                              decoration: controller.currentReviewId==5?AppDecoration.fillIndigo800
                                                  .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder8):AppDecoration.outlineIndigo8001
                                                  .copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder8),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgIcstarIndigo800,
                                                        color: controller.currentReviewId==5?ColorConstant.whiteA700:ColorConstant.indigo800,
                                                        height: getSize(16),
                                                        width: getSize(16)),
                                                    Padding(
                                                        padding: getPadding(left: 4),
                                                        child: Text("lbl_3_5".tr,
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            textAlign: TextAlign.center,
                                                            style: controller.currentReviewId==5?AppStyle
                                                                .txtSFProTextRegular13:AppStyle
                                                                .txtSFProTextRegular13Indigo800))
                                                  ])),
                                        )
                                      ])))),
                      Padding(
                          padding: getPadding(top: 16, bottom: 45),
                          child: ListView.separated(
                              padding: getPadding(left: 16,right: 16),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                    height: getVerticalSize(16));
                              },
                              itemCount: review.length>2?2:review.length,
                              itemBuilder: (context, index) {
                                ClientreviesItemModel model = review[index];
                                return ReviewsItemWidget(model);
                              }))
                    ],
                  )),
            ),
          )),
    );
  }

  onTapTxtViewall() {
    Get.toNamed(
      AppRoutes.customerReviewsScreen,
    );
  }

  onTapArrowleft13() {
    Get.back();
  }
}



