import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/services.dart';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class BookAWashScreen extends StatefulWidget {
  const BookAWashScreen({Key? key}) : super(key: key);

  @override
  State<BookAWashScreen> createState() => _BookAWashScreenState();
}

class _BookAWashScreenState extends State<BookAWashScreen> {
  List<DateTime?> _dates = [];
  List<String> day = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
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
      child: SafeArea(
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
                    onTapArrowleft11();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "msg_book_appointment".tr),
            ),
            body: SafeArea(
              child: Container(
                  width: double.maxFinite,
                  decoration: AppDecoration.white,
                  child: ListView(
                    padding: getPadding(top: 16),
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(left: 16,right: 16,bottom: 16),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("msg_select_date_and".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtOutfitBold20)),
                            ),
                            CalendarDatePicker2(
                              config: CalendarDatePicker2Config(
                                  weekdayLabelTextStyle:
                                  AppStyle.txtSFProTextSemibold13,
                                  weekdayLabels: day,

                                  controlsTextStyle:
                                  AppStyle.txtSFProTextSemibold17,
                                  customModePickerIcon: CustomImageView(
                                      svgPath: ImageConstant.imglastMonth,
                                      height: getVerticalSize(11),
                                      width: getHorizontalSize(6),
                                      margin:
                                      getMargin(left: 8, top: 4, bottom: 4)),
                                  lastMonthIcon: CustomImageView(
                                      svgPath: ImageConstant.imgPreviousMonth,
                                      height: getVerticalSize(11),
                                      width: getHorizontalSize(6),
                                      margin:
                                      getMargin(left: 8, top: 4, bottom: 4)),
                                  nextMonthIcon: CustomImageView(
                                      svgPath: ImageConstant.imglastMonth,
                                      height: getVerticalSize(11),
                                      width: getHorizontalSize(6),
                                      margin:
                                      getMargin(left: 8, top: 4, bottom: 4)),
                                  dayTextStyle:  TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      20,
                                    ),
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  selectedDayHighlightColor:
                                  ColorConstant.indigo800,
                                  selectedDayTextStyle:
                                  AppStyle.txtSFProDisplaySemibold20.copyWith(
                                      letterSpacing:
                                      getHorizontalSize(0.38))),
                              value: _dates,
                              onValueChanged: (dates) => _dates = dates,
                            ),
                            Padding(
                                padding: getPadding(left: 16, top: 0, right: 16),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                          padding: getPadding(top: 6, bottom: 6),
                                          child: Text("lbl_time".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtSFProTextSemibold17)),
                                      CustomButton(
                                          height: getVerticalSize(34),
                                          width: getHorizontalSize(88),
                                          text: "lbl_9_41_am".tr,
                                          variant: ButtonVariant.FillGray6001e,
                                          shape: ButtonShape.RoundedBorder8,
                                          padding: ButtonPadding.PaddingAll7,
                                          fontStyle:
                                          ButtonFontStyle.SFProTextRegular17)
                                    ])),
                            Padding(
                              padding: getPadding(left: 16,right: 16),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(top: 38),
                                      child: Text("lbl_package_details".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtOutfitBold20))),
                            ),
                            Padding(
                              padding: getPadding(left: 16,right: 16),
                              child: Container(
                                  margin: getMargin(top: 13),
                                  padding: getPadding(
                                      left: 16, top: 14, right: 16, bottom: 14),
                                  decoration: AppDecoration.fillGray5001.copyWith(
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: getPadding(top: 5),
                                            child: Text("lbl_gold_package2".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtHeadline)),
                                        Padding(
                                            padding: getPadding(top: 2, bottom: 3),
                                            child: Text("lbl_55_00".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtHeadline))
                                      ])),
                            ),
                            Padding(
                              padding: getPadding(left: 16,right: 16),
                              child: CustomButton(
                                  height: getVerticalSize(54),
                                  text: "lbl_continue".tr,
                                  margin: getMargin(top: 103, bottom: 5),
                                  onTap: () {
                                    onTapContinue();
                                  }),
                            )
                          ])
                    ],
                  )),
            )),
      ),
    );
  }

  onTapContinue() {
    Get.toNamed(
      AppRoutes.paymentMethodOneScreen,
    );
  }

  onTapArrowleft11() {
    Get.back();
  }
}








