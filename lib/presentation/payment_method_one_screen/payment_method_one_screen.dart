import 'package:fastteam_app/presentation/service_book_dialog/service_book_dialog.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../profile_screen/controller/profile_controller.dart';
import '../service_book_dialog/controller/service_book_controller.dart';
import 'controller/payment_method_one_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'models/payment_method_one_model.dart';
import 'models/payment_option_data.dart';


class PaymentMethodOneScreen extends StatefulWidget {
  const PaymentMethodOneScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodOneScreen> createState() => _PaymentMethodOneScreenState();
}

class _PaymentMethodOneScreenState extends State<PaymentMethodOneScreen> {
  PaymentMethodOneController controller  = Get.put(PaymentMethodOneController());
  ProfileController proController = Get.put(ProfileController());
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
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder:(profileController) =>  WillPopScope(
        onWillPop: ()async{
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
                      onTapArrowleft12();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_payment_method".tr),
              ),
              body: SafeArea(
                child: Container(
                    width: double.maxFinite,
                    child: Container(
                        width: double.maxFinite,
                        margin: getMargin(top: 20),
                        padding: getPadding(top: 17, bottom: 17),
                        decoration: AppDecoration.white,
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

                              Spacer(),
                              CustomButton(
                                  onTap: (){
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,

                                      builder: (context) {
                                        return AlertDialog(
                                          insetPadding: EdgeInsets.all(16),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          contentPadding:
                                          EdgeInsets.zero,
                                          content: ServiceBookDialog(ServiceBookController()),
                                        );
                                      },
                                    );
                                  },
                                  height: getVerticalSize(54),
                                  text: "msg_confirm_payment".tr,
                                  margin:
                                  getMargin(left: 16, right: 16, bottom: 21),
                                  alignment: Alignment.center)
                            ]))),
              )),
        ),
      ),
    );
  }


  Widget payment_option(icon,title,id){
    return  GetBuilder<PaymentMethodOneController>(
      init: PaymentMethodOneController(),
      builder:(paymentMethodController) =>  GestureDetector(
        onTap: (){
          paymentMethodController.setCurrentPaymentMethod(id);
        },
        child: Container(
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
                CustomImageView(
                  svgPath: paymentMethodController.currentPaymentMetho==id?ImageConstant.imgSelectedRadio:ImageConstant.imgUnSelectedRadio,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapArrowleft12() {
    Get.back();
  }
}





