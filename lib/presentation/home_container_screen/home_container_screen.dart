import 'package:fastteam_app/presentation/employee_screen/employee_screen.dart';
import 'package:fastteam_app/presentation/inbox_screen/inbox_screen.dart';
import 'package:fastteam_app/presentation/request_screen/request_screen.dart';
import 'package:flutter/services.dart';

import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import '../../widgets/custom_button.dart';
import '../booking_upcoming_screen/booking_upcoming_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/home_page/home_page.dart';
import 'package:fastteam_app/presentation/location_access_page/location_access_page.dart';
import 'package:fastteam_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  State<HomeContainerScreen> createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomePage(),
      EmployeeScreen(),
      RequestScreen(),
      InboxScreen(),
      ProfileScreen()
    ];
    return GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          if (controller.selectedIndex == 0) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                    insetPadding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.zero,
                    content: Container(
                        width: getHorizontalSize(396),
                        padding:
                            getPadding(left: 0, top: 38, right: 0, bottom: 38),
                        decoration: AppDecoration.white.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Are your sure you want to exit?".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtHeadline,
                            ),
                            Padding(
                              padding: getPadding(
                                left: 30,
                                top: 28,
                                right: 30,
                                bottom: 2,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      height: getVerticalSize(
                                        46,
                                      ),
                                      text: "lbl_no".tr,
                                      margin: getMargin(
                                        right: 10,
                                      ),
                                      onTap: () {
                                        Get.back();
                                      },
                                      variant: ButtonVariant.OutlineIndigo800,
                                      shape: ButtonShape.RoundedBorder8,
                                      padding: ButtonPadding.PaddingAll11,
                                      fontStyle:
                                          ButtonFontStyle.OutfitBold18Indigo800,
                                    ),
                                  ),
                                  SizedBox(
                                    width: getHorizontalSize(10),
                                  ),
                                  Expanded(
                                    child: CustomButton(
                                      onTap: () {
                                        if (controller.selectedIndex == 0) {
                                          closeApp();
                                        } else {
                                          controller.getIndex(0);
                                          Get.back();
                                        }
                                      },
                                      height: getVerticalSize(
                                        46,
                                      ),
                                      text: "lbl_yes".tr,
                                      margin: getMargin(
                                        left: 10,
                                      ),
                                      shape: ButtonShape.RoundedBorder8,
                                      padding: ButtonPadding.PaddingAll11,
                                      fontStyle:
                                          ButtonFontStyle.SFProDisplayBold18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )));
              },
            );
          } else {
            controller.getIndex(0);
            // Get.back();
          }
          return false;
        },
        child: Scaffold(
            backgroundColor: ColorConstant.gray5001,
            body: screen[controller.selectedIndex],
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })),
      ),
    );
    /*
    Get.toNamed(getCurrentRoute(type), id: 1);
     */
  }

  ///Handling page based on route
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homeContainerScreen;
      case BottomBarEnum.Employee:
        return AppRoutes.bookingUpcomingScreen;
      case BottomBarEnum.Request:
        return AppRoutes.bookingUpcomingScreen;
      case BottomBarEnum.Explore:
        return AppRoutes.locationAccessPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      default:
        return "/";
    }
  }
}
