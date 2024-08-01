import 'package:flutter/services.dart';

import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/add_payment_method_active_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';



class AddPaymentMethodActiveScreen extends StatefulWidget {
  const AddPaymentMethodActiveScreen({Key? key}) : super(key: key);

  @override
  State<AddPaymentMethodActiveScreen> createState() => _AddPaymentMethodActiveScreenState();
}

class _AddPaymentMethodActiveScreenState extends State<AddPaymentMethodActiveScreen> {
  AddPaymentMethodActiveController controller = Get.put(AddPaymentMethodActiveController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    return Form(
      key: _formKey,
      child: WillPopScope(
        onWillPop: ()async{
          Get.back();
          return true;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                    Get.back();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_add_a_card".tr),),
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Expanded(
                        child: Container(
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
                                          enable: false,
                                          textInputType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty || value == Null) {
                                              return "Please enter valid Number";
                                            }
                                            return null;
                                          },
                                          focusNode:
                                          FocusNode(),
                                          autofocus: true,
                                          controller:
                                          controller.cardnumberoneController,
                                          hintText:
                                          "lbl_1234_5678_9124".tr,

                                          margin:
                                          getMargin(
                                              top: 5)),




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
                                                                  enable: false,
                                                                  textInputType: TextInputType.datetime,
                                                                  validator: (value) {
                                                                    if (value!.isEmpty || value == Null) {
                                                                      return "Please enter valid date";
                                                                    }
                                                                    return null;
                                                                  },
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
                                                                  enable: false,
                                                                  textInputType: TextInputType.number,
                                                                  width:
                                                                  getHorizontalSize(
                                                                      178),
                                                                  validator: (value) {
                                                                    if (value!.isEmpty || value == Null) {
                                                                      return "Please enter valid cvv";
                                                                    }
                                                                    return null;
                                                                  },
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
                                          margin: getMargin(top: 28, bottom: 0),
                                          onTap: () {
                                            if(_formKey.currentState!.validate()){
                                              onTapAddcard();}
                                          })
                                    ]))),
                      )
                    ]))),
      ),
    );
  }

  onTapAddacard() {
    Get.toNamed(
      AppRoutes.paymentMethodScreen,
    );
  }

  onTapAddcard() {
    Get.back();
  }
}










