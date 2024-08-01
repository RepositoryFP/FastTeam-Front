import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fastteam_app/presentation/employee_screen/controller/employee_controller.dart';
import 'package:fastteam_app/presentation/inbox_screen/controller/inbox_controller.dart';
import 'package:fastteam_app/presentation/inbox_screen/models/inbox_model.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_floating_edit_text.dart';
import 'package:flutter/services.dart';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final InboxController controller = Get.find();
  List<DateTime?> _dates = [];
  List<String> day = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
  String absenType = 'Clock In';
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    controller.getNotificationList();
  }

  // Future markAllAsRead() async {
  //   var result =
  //       await inboxController!.requestReadAllNotification(userId.toString());
  //   if (result['status'] == 200) {
  //     await fetchData();
  //     showSnackBar('All notification is read', Colors.green);
  //   } else {
  //     showSnackBar('Failed to perform mark all as read', Colors.red);
  //   }
  // }

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
              margin: getMargin(left: 16, top: 29, bottom: 28),
            ),
            centerTitle: true,
            title: AppbarTitle(text: "Inbox".tr),
          ),
          body: SafeArea(
            child: Container(
              width: double.maxFinite,
              decoration: AppDecoration.white,
              child: DefaultTabController(
                length: 2,
                child: Column(children: <Widget>[
                  Container(
                    color:
                        ColorConstant.whiteA700, // warna latar belakang tab bar
                    child: TabBar(
                      tabs: [
                        Tab(
                          text: "Notification",
                        ),
                        Tab(
                          text: "Approval",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        children: [
                          notification_tab(),
                          approval_tab(),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget approval_tab() {
    return Padding(
      padding: getPadding(right: 10, left: 10),
      child: ListView(
        padding: getPadding(top: 16),
        children: [
          menuOption(() {
            Get.toNamed(AppRoutes.profileDetailsScreen);
          }, ImageConstant.imgClock, "Attendance".tr),
          menuOption(() {
            Get.toNamed(AppRoutes.profileDetailsScreen);
          }, ImageConstant.imgDate, "Leave".tr),
          menuOption(() {
            Get.toNamed(AppRoutes.profileDetailsScreen);
          }, ImageConstant.imgOvertime, "Overtime".tr),
        ],
      ),
    );
  }

  Widget menuOption(function, icon, title) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ColorConstant.gray300))),
        child: Padding(
          padding: getPadding(left: 16, top: 19, bottom: 19, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImageView(
                    svgPath: icon,
                    height: getSize(
                      22,
                    ),
                    width: getSize(
                      22,
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(16),
                  ),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtBody,
                  ),
                ],
              ),
              CustomImageView(
                svgPath: ImageConstant.imgArrowright,
                height: getSize(
                  18,
                ),
                width: getSize(
                  18,
                ),
                margin: getMargin(
                  top: 2,
                  right: 6,
                  bottom: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget notification_tab() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (controller.notifications.isEmpty) {
        return _noNotifications();
      }
      return Padding(
        padding: getPadding(right: 10, left: 10),
        child: ListView.builder(
          padding: getPadding(top: 16),
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            return _buildNotificationItem(controller.notifications[index]);
          },
        ),
      );
    });
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    print(notification.sender?.photo);
    return Container(
      height: getVerticalSize(40),
      width: getHorizontalSize(double.infinity),
      color: ColorConstant.amber700,
    );
    // return ListTile(
    //   onTap: () {},
    //   leading: CustomImageView(
    //     url: notification.sender?.photo,
    //     height: getSize(50),
    //     width: getSize(50),
    //     radius: BorderRadius.circular(getHorizontalSize(60)),
    //     alignment: Alignment.center,
    //   ),
    //   title: Text(notification.sender?.name ?? ''),
    // );
  }

  Widget _noNotifications() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200, // Adjust width as needed
            height: 200, // Adjust height as needed
            decoration: BoxDecoration(
              color: Colors.blue[100], // Adjust color as needed
              borderRadius: BorderRadius.circular(
                  100), // Half the height for an oval shape
            ),
            child: const Center(
              child: Icon(
                Icons.update,
                size: 100.0,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            'There is no notification',
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
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
