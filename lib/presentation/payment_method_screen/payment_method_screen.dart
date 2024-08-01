import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../payment_method_one_screen/models/payment_method_one_model.dart';
import '../payment_method_one_screen/models/payment_option_data.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';




class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  List<PaymentMethodOneModel> paymentOption = PaymentData.getPaymentData();
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
      child: ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
              height: getVerticalSize(82),
              leadingWidth: 40,
              leading: AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 16, top: 29, bottom: 28),
                  onTap: () {
                    onTapArrowleft20();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_my_cards".tr),),
            body: paymentOption.isEmpty?Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                          height: getVerticalSize(81),
                          text: "lbl_my_cards".tr,
                          variant: ButtonVariant.FillWhiteA700,
                          shape: ButtonShape.Square,
                          padding: ButtonPadding.PaddingT47,
                          fontStyle: ButtonFontStyle.OutfitBold28,
                          prefixWidget: Container(
                              margin: getMargin(right: 30),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowleft)),
                          onTap: () {
                            Get.back();
                          }),
                      Spacer(),
                      Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          color: ColorConstant.indigo5001,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.circleBorder70),
                          child: Container(
                              height: getSize(140),
                              width: getSize(140),
                              padding: getPadding(
                                  left: 30, top: 40, right: 30, bottom: 40),
                              decoration: AppDecoration.fillIndigo5001.copyWith(
                                  borderRadius:
                                  BorderRadiusStyle.circleBorder70),
                              child: Stack(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgFileBlack900,
                                    height: getVerticalSize(58),
                                    width: getHorizontalSize(80),
                                    alignment: Alignment.center)
                              ]))),
                      Padding(
                          padding: getPadding(top: 41),
                          child: Text("lbl_no_card_yet".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtOutfitBold22)),
                      Padding(
                          padding: getPadding(top: 7),
                          child: Text("msg_it_is_a_long_established".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtBody)),
                      CustomButton(
                          height: getVerticalSize(53),
                          width: getHorizontalSize(178),
                          text: "lbl_add".tr,
                          margin: getMargin(top: 37, bottom: 299),
                          onTap: () {
                            onTapAdd();
                          })
                    ])):Container(
                width: double.maxFinite,
                padding: getPadding(top: 41, bottom: 41),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 16),
                          child: Text("lbl_payment_method".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtOutfitBold20)),
                      ListView.builder(itemCount: paymentOption.length,primary: false,shrinkWrap: true,itemBuilder: (context, index) {
                        PaymentMethodOneModel data = paymentOption[index];
                        return   payment_option(data.icon, data.title, data.id);
                      },),
                    ])),
            bottomNavigationBar: paymentOption.isNotEmpty?CustomButton(
                height: getVerticalSize(54),
                text: "lbl_add2".tr,
                margin: getMargin(left: 16, right: 16, bottom: 39),
                onTap: () {
                  onTapAdd();
                }):SizedBox()),
      ),
    );
  }

  onTapAdd() {
    Get.toNamed(
      AppRoutes.addPaymentMethodActiveScreen,
    );
  }
  Widget payment_option(icon,title,id){
    return  Container(
      decoration: AppDecoration.white,
      child: Padding(
        padding:getPadding(left: 20,right: 20,top: 25,bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomImageView(
                    svgPath:icon,
                    height: getSize(34),
                    width: getSize(34),
                    margin: getMargin(left: 4)),
                SizedBox(width: getHorizontalSize(16),),
                Text(title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBody)

              ],
            ),
            // !proController.isNavigatInProfile?CustomImageView(
            //   svgPath: paymentMethodController.currentPaymentMetho==id?ImageConstant.imgSelectedRadio:ImageConstant.imgUnSelectedRadio,
            // ):SizedBox()
            SizedBox(),
          ],
        ),
      ),
    );
  }
  onTapArrowleft20() {
    Get.back();
  }
}




