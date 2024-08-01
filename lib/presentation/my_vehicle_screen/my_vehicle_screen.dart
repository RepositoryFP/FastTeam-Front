import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/services.dart';

import '../add_car_details_one_screen/controller/add_car_details_one_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'models/my_vehicle_data.dart';
import 'models/my_vehicle_model.dart';





class MyVehicleScreen extends StatefulWidget {
  const MyVehicleScreen({Key? key}) : super(key: key);

  @override
  State<MyVehicleScreen> createState() => _MyVehicleScreenState();
}

class _MyVehicleScreenState extends State<MyVehicleScreen> {
  List<MyVehicleModel> vehicle = MyVehicleData.getMyVehicle();
  AddCarDetailsOneController addCarDetailsOneController = Get.put(AddCarDetailsOneController());


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
    return GetBuilder<AddCarDetailsOneController>(
      init: AddCarDetailsOneController(),
      builder:(controller) =>  WillPopScope(
        onWillPop: () async {
          controller.setAddCarNavigation(false);
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
                      controller.setAddCarNavigation(false);
                      onTapArrowleft24();
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "lbl_my_vehicle".tr),
              ),
              body: vehicle.isEmpty ?Container(
                  width: double.maxFinite,
                  padding: getPadding(top: 171),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: EdgeInsets.all(0),
                            color: ColorConstant.indigo5001,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusStyle.circleBorder70),
                            child: Container(
                                height: getSize(140),
                                width: getSize(140),
                                padding: getPadding(all: 37),
                                decoration: AppDecoration.fillIndigo5001.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.circleBorder70),
                                child: Stack(children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCar,
                                      height: getSize(65),
                                      width: getSize(65),
                                      alignment: Alignment.center)
                                ]))),
                        Padding(
                            padding: getPadding(top: 41),
                            child: Text("lbl_no_car_yet".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtOutfitBold22)),
                        Padding(
                            padding: getPadding(top: 7),
                            child: Text("msg_it_is_a_long_established".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtBody)),
                        CustomButton(
                            onTap: (){
                              controller.setAddCarNavigation(true);
                              Get.toNamed(AppRoutes.addCarDetailsOneScreen);
                            },
                            height: getVerticalSize(53),
                            width: getHorizontalSize(178),
                            text: "lbl_add".tr,
                            margin: getMargin(top: 37, bottom: 5))
                      ])):Container(
                  width: double.maxFinite,
                  child: Container(
                      width: double.maxFinite,
                      margin: getMargin(top: 20),

                      decoration: AppDecoration.white,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GridView.builder(
                              padding: getPadding(all: 16),
                              itemCount: vehicle.length,
                              primary: false,
                              shrinkWrap: true,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: getVerticalSize(144),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: getHorizontalSize(16),
                                  crossAxisSpacing: getHorizontalSize(16)),
                              itemBuilder: (context, index) {
                                MyVehicleModel data = vehicle[index];
                                return Container(
                                  decoration: AppDecoration.outlineBlack900
                                      .copyWith(
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: getVerticalSize(24),
                                          ),
                                          Padding(
                                            padding:
                                            getPadding(left: 18, right: 18),
                                            child: Container(
                                              height: getVerticalSize(61),
                                              width: double.infinity,
                                              child: Image.asset(
                                                data.image!,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: getVerticalSize(16),
                                          ),
                                          Text(data.title!,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtHeadline)
                                        ],
                                      ),
                                      CustomIconButton(
                                          height: 24,
                                          width: 24,
                                          variant: IconButtonVariant.FillIndigo5001,
                                          shape: IconButtonShape.CircleBorder14,
                                          padding: IconButtonPadding.PaddingAll6,
                                          alignment: Alignment.topRight,
                                          child: CustomImageView(
                                              svgPath:
                                              ImageConstant.imgCloseBlack900))
                                    ],
                                  ),
                                );
                              },
                            ),
                            Spacer(),
                            CustomButton(
                                onTap: (){
                                  controller.setAddCarNavigation(true);
                                  Get.toNamed(AppRoutes.addCarDetailsOneScreen);
                                },
                                height: getVerticalSize(54),
                                text: "lbl_add_vehicle".tr,
                                margin: getPadding(bottom: 23,left: 16,right: 16))
                          ])))),
        ),
      ),
    );
  }

  onTapArrowleft24() {
    Get.back();
  }
}




