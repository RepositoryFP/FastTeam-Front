import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fastteam_app/presentation/employee_screen/controller/employee_controller.dart';
import 'package:fastteam_app/presentation/inbox_screen/controller/inbox_controller.dart';
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
  InboxController controller = Get.put(InboxController());
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
      return Padding(
        padding: getPadding(right: 10, left: 10),
        child: ListView(
          padding: getPadding(top: 16),
          children: [],
        ),
      );
    });
  }

  Widget _absentTypeRadio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio(
              value: 'Clock In',
              groupValue: absenType,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Text('Clock In', style: AppStyle.txtSFProTextRegular16),
            Radio(
              value: 'Clock Out',
              groupValue: absenType,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Text('Clock Out', style: AppStyle.txtSFProTextRegular16),
          ],
        ),
      ],
    );
  }

  Widget _agendaTypeRadio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio(
              value: 'Leave',
              groupValue: absenType,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Text('Leave', style: AppStyle.txtSFProTextRegular16),
            Radio(
              value: 'Sick',
              groupValue: absenType,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Text('Sick', style: AppStyle.txtSFProTextRegular16),
            Radio(
              value: 'Off',
              groupValue: absenType,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Text('Out of Town Dutty', style: AppStyle.txtSFProTextRegular16),
          ],
        ),
      ],
    );
  }

  Widget _employee_list() {
    return Column(
      children: [
        Container(
          margin: getMargin(top: 15),
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
          ),
          child: Padding(
            padding: getPadding(bottom: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.avatarPict,
                      height: getVerticalSize(60),
                      width: getHorizontalSize(60),
                      radius: BorderRadius.circular(getHorizontalSize(60)),
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: getPadding(left: 15, top: 5, right: 5),
                      child: Container(
                        width:
                            getHorizontalSize(150), // Adjust width as necessary
                        child: Text(
                          'Febriansyah Dwi Kurnia Wicaksono',
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOutfitBold20,
                          softWrap: true,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  Container(
                    child: Row(
                      children: [
                        // Text('${datalist['clock_in']}')
                        IconButton(
                          icon: Icon(Icons.phone,
                              size: getFontSize(24),
                              color: ColorConstant.indigo800),
                          onPressed: () {},
                        ),
                        SizedBox(width: getHorizontalSize(5)),
                        IconButton(
                          icon: Icon(Icons.email,
                              size: getFontSize(24),
                              color: ColorConstant.indigo800),
                          onPressed: () {},
                        ),
                        SizedBox(width: getHorizontalSize(5)),
                        IconButton(
                          icon: ImageIcon(
                            const AssetImage(
                              'assets/fastteam_image/whatsapp.png',
                            ),
                            color: ColorConstant.green600,
                            size: getFontSize(24),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ])
              ],
            ),
          ),
        ),
        Divider()
      ],
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
