import 'package:flutter/services.dart';

import '../customer_reviews_screen/widgets/clientrevies_item_widget.dart';
import 'models/clientrevies_item_model.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'models/customer_reviews_model.dart';



class CustomerReviewsScreen extends StatefulWidget {
  const CustomerReviewsScreen({Key? key}) : super(key: key);

  @override
  State<CustomerReviewsScreen> createState() => _CustomerReviewsScreenState();
}

class _CustomerReviewsScreenState extends State<CustomerReviewsScreen> {
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
                  onTapArrowleft14();
                }),
            centerTitle: true,
            title: AppbarTitle(text: "lbl_customer_review".tr),),
          body: SafeArea(
            child: Container(
                height: getVerticalSize(798),
                width: double.maxFinite,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: getPadding(top: 8),
                      child: Container(
                        decoration:
                        BoxDecoration(color: ColorConstant.whiteA700),
                        child: ListView.separated(
                            padding: getPadding(left: 16, top: 20, right: 16,bottom: 20),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: getVerticalSize(20));
                            },
                            itemCount:review.length,
                            itemBuilder: (context, index) {
                              ClientreviesItemModel model = review[index];
                              return ClientreviesItemWidget(model);
                            }),
                      ),
                    ))),
          )),
    );
  }

  onTapArrowleft14() {
    Get.back();
  }
}



