import 'package:flutter/services.dart';

import 'controller/location_with_select_one_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';



class LocationWithSelectOneScreen extends StatefulWidget {
  const LocationWithSelectOneScreen({Key? key}) : super(key: key);

  @override
  State<LocationWithSelectOneScreen> createState() => _LocationWithSelectOneScreenState();
}

class _LocationWithSelectOneScreenState extends State<LocationWithSelectOneScreen> {
  LocationWithSelectOneController locationWithSelectOneController = Get.put(LocationWithSelectOneController());
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
    return GetBuilder<LocationWithSelectOneController>(
      init: LocationWithSelectOneController(),
      builder:(controller) =>  Padding(
        padding: getPadding(top: 38,left: 30,right: 30,bottom: 38),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
            MainAxisAlignment.start,
            children: [
              Text("msg_you_have_arrived".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtOutfitBold22),
              CustomImageView(
                  svgPath: ImageConstant.imgCheckmark,
                  height: getSize(96),
                  width: getSize(96),
                  margin: getMargin(top: 23)),
              Container(
                  width: getHorizontalSize(317),
                  margin: getMargin(top: 24),
                  child: Text(
                      "msg_you_have_successfully".tr,
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtBody)),
              CustomButton(
                  height: getVerticalSize(53),
                  text: "msg_go_to_service_detail".tr,
                  margin: getMargin(
                      left: 35, top: 20, right: 35),
                  onTap: () {
                    controller.setDetailNavigationIsHome(true);
                    Get.toNamed(
                      AppRoutes.serviceDetailScreen,
                    );
                  })
            ]),
      ),
    );
  }

}




