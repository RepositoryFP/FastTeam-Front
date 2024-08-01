import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../filter_bottomsheet/controller/filter_controller.dart';
import '../filter_bottomsheet/filter_bottomsheet.dart';
import '../home_page/models/home_model.dart';
import '../home_page/models/populer_center_model.dart';
import '../popular_centers_screen/widgets/popular_centers_item_widget.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';




class PopularCentersScreen extends StatefulWidget {
  const PopularCentersScreen({Key? key}) : super(key: key);

  @override
  State<PopularCentersScreen> createState() => _PopularCentersScreenState();
}

class _PopularCentersScreenState extends State<PopularCentersScreen> {
  List<PopulerCenterData> populerlist = HomeModel.getPopulerData();
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
                    onTapArrowleft5();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_popular_center".tr),
              actions: [
                AppbarImage(
                    onTap: () {
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
                    margin: getMargin(left: 16, top: 29, right: 16, bottom: 28))
              ],
            ),
            body: GridView.builder(
                padding: getPadding(left: 16, right: 16, top: 18),
                primary: false,
                shrinkWrap: true,
                itemCount: populerlist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: getVerticalSize(177),
                    crossAxisCount: 2,
                    mainAxisSpacing: getVerticalSize(20),
                    crossAxisSpacing: getHorizontalSize(12)),
                itemBuilder: (context, index) {
                  PopulerCenterData model = populerlist[index];
                  return PopularCentersItemWidget(model,
                      onTapColumnrectangle: () {
                        onTapColumnrectangle();
                      });
                })),
      ),
    );
  }

  onTapColumnrectangle() {
    Get.toNamed(AppRoutes.serviceDetailScreen);
  }

  onTapArrowleft5() {
    Get.back();
  }
}



