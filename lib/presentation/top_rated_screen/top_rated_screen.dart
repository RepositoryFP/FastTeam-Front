import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../filter_bottomsheet/controller/filter_controller.dart';
import '../filter_bottomsheet/filter_bottomsheet.dart';
import '../home_page/models/home_model.dart';
import '../home_page/models/top_rated_model.dart';
import '../top_rated_screen/widgets/top_rated_item_widget.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';


class TopRatedScreen extends StatefulWidget {
  const TopRatedScreen({Key? key}) : super(key: key);

  @override
  State<TopRatedScreen> createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {
  List<TopRatedData> topRatedList = HomeModel.getTopRatedData();
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
              height: getVerticalSize(82),
              leadingWidth: 40,
              leading: AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 16, top: 29, bottom: 28),
                  onTap: () {
                    onTapArrowleft7();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_top_rated".tr),
              actions: [
                AppbarImage(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(getHorizontalSize(32)),
                                topRight:
                                Radius.circular(getHorizontalSize(32)))),
                        builder: (context) {
                          return FilterBottomsheet(FilterController());
                        },
                      );
                    },
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgSettingsBlack900,
                    margin:
                    getMargin(left: 16, top: 29, right: 16, bottom: 28))
              ],
            ),
            body: SafeArea(
              child: Padding(
                  padding: getPadding(left: 16, top: 18, right: 16,bottom: 16),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: getVerticalSize(178),
                          crossAxisCount: 2,
                          mainAxisSpacing: getVerticalSize(20),
                          crossAxisSpacing: getHorizontalSize(12)),
                      physics: BouncingScrollPhysics(),
                      itemCount: topRatedList.length,
                      itemBuilder: (context, index) {
                        TopRatedData model = topRatedList[index];
                        return TopRatedItemWidget(model,
                            onTapColumnrectangle: () {
                              onTapColumnrectangle();
                            });
                      })),
            )),
      ),
    );
  }

  onTapColumnrectangle() {
    Get.toNamed(AppRoutes.serviceDetailScreen);
  }

  onTapArrowleft7() {
    Get.back();
  }
}




