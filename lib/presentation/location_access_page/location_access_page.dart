import 'package:flutter/services.dart';

import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_search_view.dart';
import '../location_map_screen/controller/location_map_controller.dart';
import '../location_with_select_one_screen/location_with_select_one_screen.dart';
import 'controller/location_access_controller.dart';
import 'models/location_access_model.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LocationAccessPage extends StatefulWidget {
  @override
  State<LocationAccessPage> createState() => _LocationAccessPageState();
}

class _LocationAccessPageState extends State<LocationAccessPage> {
  LocationAccessController location =
      Get.put(LocationAccessController(LocationAccessModel().obs));

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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    return GetBuilder<LocationAccessController> (
      init: LocationAccessController(LocationAccessModel().obs),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.gray5001,
          body:controller.locationSearch? GetBuilder<LocationMapController>(
            init: LocationMapController(),
            builder: (locationcontroller) =>  Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgBackground),
                        fit: BoxFit.fill)),
                height: double.infinity,
                width: double.maxFinite,
                child: SafeArea(
                  child: Padding(
                    padding: getPadding(left: 16, right: 16,bottom: 59),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: getPadding(top: 30),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: CustomSearchView(

                              onFieldSubmitted: (value) {
                                locationcontroller.setSerching(value);
                              },
                              width: double.infinity,
                              controller: locationcontroller.searchController,
                              hintText: "lbl_search_location".tr,
                              variant: SearchViewVariant.FillWhiteA700,
                              alignment: Alignment.topCenter,
                              prefix: Container(
                                margin: getMargin(
                                  left: 20,
                                  top: 11,
                                  right: 13,
                                  bottom: 11,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgSearch,
                                ),
                              ),
                              prefixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(
                                  46,
                                ),
                              ),
                              suffix: Padding(
                                padding: EdgeInsets.only(
                                  right: getHorizontalSize(
                                    15,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    locationcontroller.searchController.clear();
                                    locationcontroller.setSerching("");
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        locationcontroller.serchingText.isNotEmpty?  Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
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
                                                        locationcontroller.serchingText,
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
                                            onTapBtnLocation(context);
                                          },
                                          child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgLocationWhiteA70050x50))
                                    ]))):SizedBox()
                      ],
                    ),
                  ),
                )),
          ):Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillGray5001,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: getPadding(left: 16, right: 16),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgEye,
                                  height: getVerticalSize(83),
                                  width: getHorizontalSize(67),
                                  margin: getMargin(top: 51)),
                              Container(
                                  width: getHorizontalSize(216),
                                  margin: getMargin(top: 20),
                                  child: Text("msg_hello_nice_to".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtOutfitBold28)),
                              Container(
                                  width:double.infinity,
                                  margin: getMargin(top: 14),
                                  child: Text("msg_set_your_location".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtBody)),
                              CustomButton(
                                  height: getVerticalSize(53),
                                  text: "msg_user_current_location".tr,
                                  margin: getMargin(top: 18),
                                  padding: ButtonPadding.PaddingT17,
                                  fontStyle: ButtonFontStyle.OutfitRegular18,
                                  prefixWidget: Container(
                                      margin: getMargin(right: 4),
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgLocationWhiteA700)),
                                  onTap: () {
                                    controller.setLocationSearch(true);
                                  }),
                              Container(
                                  width: double.infinity,
                                  margin: getMargin(top: 22),
                                  child: Text(
                                      "msg_we_access_your_location".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtBody))
                            ]))
                  ]))),
    );
  }

  onTapUsercurrent() {
    Get.toNamed(
      AppRoutes.locationMapScreen,
    );
  }

  onTapBtnLocation(context) {
    showDialog(
      barrierDismissible: false,
      context: context,

      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
          EdgeInsets.zero,
          content: LocationWithSelectOneScreen(),
        );
      },
    );


  }
}
