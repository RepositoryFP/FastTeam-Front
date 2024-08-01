import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../notifications_screen/widgets/notifications_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/notifications_item_model.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';





class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationsController controller = Get.put(NotificationsController());
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
      onWillPop: ()async {
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
                    onTapArrowleft26();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_notifications".tr),
            ),
            body: Padding(
                padding: getPadding(left: 16, top: 16, right: 16),
                child: controller.notificationsModelObj.value
                    .notificationsItemList.value.isEmpty? Container(
                    width: double.maxFinite,
                    padding: getPadding(top: 222),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              margin: EdgeInsets.all(0),
                              color: ColorConstant.gray200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusStyle.circleBorder70),
                              child: Container(
                                  height: getSize(140),
                                  width: getSize(140),
                                  padding: getPadding(all: 30),
                                  decoration: AppDecoration.fillGray200.copyWith(
                                      borderRadius:
                                      BorderRadiusStyle.circleBorder70),
                                  child: Stack(children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgSignalBlack900,
                                        height: getSize(80),
                                        width: getSize(80),
                                        alignment: Alignment.center)
                                  ]))),
                          Padding(
                              padding: getPadding(top: 30),
                              child: Text("msg_no_notification".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtOutfitBold22)),
                          Padding(
                              padding: getPadding(top: 9, bottom: 5),
                              child: Text("msg_it_is_a_long_established".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtBody))
                        ])):Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(20));
                    },
                    itemCount: controller.notificationsModelObj.value
                        .notificationsItemList.value.length,
                    itemBuilder: (context, index) {
                      NotificationsItemModel model = controller
                          .notificationsModelObj
                          .value
                          .notificationsItemList
                          .value[index];
                      return NotificationsItemWidget(model);
                    })))),
      ),
    );
  }

  onTapArrowleft26() {
    Get.back();
  }
}



