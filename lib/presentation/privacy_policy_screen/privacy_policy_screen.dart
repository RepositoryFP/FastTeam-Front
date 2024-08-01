import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';




class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

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
                    onTapArrowleft27();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_privacy_policy".tr),
            ),
            body: Container(
                width: double.maxFinite,
                child: Container(
                    width: double.maxFinite,
                    margin: getMargin(top: 8),
                    padding:
                    getPadding(left: 16, top: 13, right: 16, bottom: 13),
                    decoration: AppDecoration.white,
                    child: ListView(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(left: 1),
                                  child: Text("msg_1_types_of_data".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorConstant.black900,
                                        fontSize: getFontSize(
                                          20,
                                        ),
                                        height: getVerticalSize(1),
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w700,
                                      ))),
                              Container(
                                  width: getHorizontalSize(385),
                                  margin: getMargin(left: 1, top: 13, right: 9),
                                  child: Text("msg_duis_tristique_diam".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style:
                                      AppStyle.txtSFProTextRegular16Gray600)),
                              Padding(
                                  padding: getPadding(left: 1, top: 25),
                                  child: Text("msg_2_use_of_your_personal".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProTextBold20)),
                              Container(
                                  width: getHorizontalSize(395),
                                  margin: getMargin(left: 1, top: 13),
                                  child: Text("msg_sed_sollicitudin".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style:
                                      AppStyle.txtSFProTextRegular16Gray600)),
                              Padding(
                                  padding: getPadding(left: 1, top: 27),
                                  child: Text("msg_3_disclosure_of".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProTextBold20)),
                              Container(
                                  width: getHorizontalSize(395),
                                  margin: getMargin(left: 1, top: 13, bottom: 5),
                                  child: Text("msg_sed_sollicitudin2".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProTextRegular16Gray600))
                            ]),
                      ],
                    )))),
      ),
    );
  }

  onTapArrowleft27() {
    Get.back();
  }
}




