import 'package:flutter/services.dart';

import 'controller/add_payment_method_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';



class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  AddPaymentMethodController controller = Get.put(AddPaymentMethodController());
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.red500,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray5001,
        body: Container(
            width: double.maxFinite,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                      height: getVerticalSize(81),
                      text: "lbl_add_a_card".tr,
                      variant: ButtonVariant.FillWhiteA700,
                      shape: ButtonShape.Square,
                      padding: ButtonPadding.PaddingT47,
                      fontStyle: ButtonFontStyle.OutfitBold28,
                      prefixWidget: Container(
                          margin: getMargin(right: 30),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgArrowleft)),
                      onTap: () {
                        onTapAddacard();
                      }),
                  Container(
                      width: double.maxFinite,
                      child: Container(
                          margin: getMargin(top: 8),
                          padding: getPadding(
                              left: 16, top: 14, right: 16, bottom: 14),
                          decoration: AppDecoration.white,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: getHorizontalSize(315),
                                        margin:
                                        getMargin(left: 39, right: 40),
                                        child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                  "msg_enter_your_card2"
                                                      .tr,
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .black900,
                                                      fontSize:
                                                      getFontSize(16),
                                                      fontFamily:
                                                      'SF Pro Text',
                                                      fontWeight:
                                                      FontWeight.w400)),
                                              TextSpan(
                                                  text: "lbl_learn_more".tr,
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .indigo800,
                                                      fontSize:
                                                      getFontSize(16),
                                                      fontFamily:
                                                      'SF Pro Text',
                                                      fontWeight:
                                                      FontWeight.w400))
                                            ]),
                                            textAlign: TextAlign.center))),
                                Padding(
                                    padding: getPadding(top: 29),
                                    child: Text("lbl_card_number".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtBody)),
                                CustomTextFormField(
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller:
                                    controller.cardnumberoneController,
                                    hintText: "lbl_1234_5678_9124".tr,
                                    margin: getMargin(top: 7),
                                    enable: false,
                                    padding:
                                    TextFormFieldPadding.PaddingT20),
                                Padding(
                                    padding: getPadding(top: 17),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Padding(
                                                  padding: getPadding(
                                                      top: 1, right: 20),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                            "lbl_exp_date"
                                                                .tr,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                            TextAlign
                                                                .left,
                                                            style: AppStyle
                                                                .txtBody),
                                                        CustomTextFormField(
                                                            width:
                                                            getHorizontalSize(
                                                                178),
                                                            focusNode:
                                                            FocusNode(),
                                                            autofocus: true,
                                                            controller:
                                                            controller
                                                                .expdateoneController,
                                                            hintText:
                                                            "lbl_mm_yy"
                                                                .tr,
                                                            margin:
                                                            getMargin(
                                                                top: 5))
                                                      ]))),
                                          Expanded(
                                              child: Padding(
                                                  padding:
                                                  getPadding(left: 20),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text("lbl_cvv".tr,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                            TextAlign
                                                                .left,
                                                            style: AppStyle
                                                                .txtBody),
                                                        CustomTextFormField(
                                                            width:
                                                            getHorizontalSize(
                                                                178),
                                                            focusNode:
                                                            FocusNode(),
                                                            autofocus: true,
                                                            controller:
                                                            controller
                                                                .cvvoneController,
                                                            hintText:
                                                            "lbl_123"
                                                                .tr,
                                                            margin:
                                                            getMargin(
                                                                top: 7),
                                                            textInputAction:
                                                            TextInputAction
                                                                .done)
                                                      ])))
                                        ])),
                                CustomButton(
                                    height: getVerticalSize(54),
                                    text: "lbl_add_card".tr,
                                    margin: getMargin(top: 30, bottom: 403),
                                    onTap: () {
                                      onTapAddcard();
                                    })
                              ])))
                ])));
  }

  onTapAddacard() {
    Get.toNamed(
      AppRoutes.paymentMethodScreen,
    );
  }

  onTapAddcard() {
    Get.toNamed(
      AppRoutes.paymentMethodScreen,
    );
  }
}





