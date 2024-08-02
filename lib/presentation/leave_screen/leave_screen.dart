import 'package:fastteam_app/presentation/employee_screen/controller/employee_controller.dart';
import 'package:fastteam_app/presentation/leave_screen/controller/leave_controller.dart';
import 'package:fastteam_app/widgets/custom_search_view.dart';
import 'package:flutter/services.dart';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  LeaveController controller = Get.put(LeaveController());
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    controller.getLeaveList();
  }

  String formatDateString(String dateString) {
    // Parse the original date string
    DateTime originalDate = DateTime.parse(dateString);

    // Define the date format
    DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy');

    // Format the date to the desired format
    String formattedDate = formatter.format(originalDate);

    return formattedDate;
  }

  String formatTimeString(String timeString) {
    // Parse the original date string
    DateTime originalTime = DateTime.parse(timeString);

    // Define the date format
    DateFormat formatter = DateFormat('HH:mm');

    // Format the date to the desired format
    String formattedTime = formatter.format(originalTime);

    return formattedTime;
  }

  Color getStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.yellow;
      case 1:
        return Colors.green;
      case 2:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String getStatusText(int status) {
    switch (status) {
      case 0:
        return 'Pending';
      case 1:
        return 'Approved';
      case 2:
        return 'Rejected';
      default:
        return 'Tidak Diketahui';
    }
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
                title: AppbarTitle(text: "Leave".tr),
              ),
              body: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!controller.isDataLoaded.value) {
                  return _noLeave();
                }

                return SafeArea(
                    child: Container(
                  width: double.maxFinite,
                  decoration: AppDecoration.white,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: getPadding(top: 16),
                          itemCount: controller
                              .leaveList.length, // Use filteredEmployees here
                          itemBuilder: (context, index) {
                            final data = controller
                                .leaveList[index]; 
                                print(data);
                            return _attendanceTile(data);
                          },
                        ),
                      ),
                    ],
                  ),
                ));
              })),
        ));
  }

  Widget _attendanceTile(leave) {
    return Column(children: <Widget>[
      InkWell(
        onTap: () async {
          // Navigator.pushNamed(context, '/leaveDetail', arguments: {
          //   'tanggal': leave['tanggal'].toString().split(' ')[0],
          //   'time': DateFormat.Hms()
          //       .parse(leave['tanggal'].toString().split(' ')[1]),
          //   'status': leave['status'],
          //   'bukti': leave['bukti'],
          //   'alasan': leave['alasan'],
          //   'nama': leave['user']['name'],
          //   'photo': leave['user']['photo'],
          //   'cuti': leave['cuti']['name'],
          // });
        },
        child: Container(
          padding: getPadding(left: 15, right: 15, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              MdiIcons.calendarMonth,
                              size: getFontSize(25),
                            ),
                            SizedBox(
                              height: getVerticalSize(5),
                            ),
                            Icon(
                              MdiIcons.clockOutline,
                              size: getFontSize(25),
                            ),
                          ]),
                      Padding(
                        padding: getPadding(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              formatDateString(leave.tanggal),
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: getFontSize(14),
                              ),
                            ),
                            SizedBox(
                              height: getVerticalSize(12),
                            ),
                            Text(
                              formatTimeString(leave.tanggal),
                              style: const TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getVerticalSize(5)),
                  Row(
                    children: [
                      SizedBox(
                        width: getHorizontalSize(35),
                      ),
                      Container(
                        padding: getPadding(left: 10, right: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(getHorizontalSize(20)),
                            border: Border.all(color: Colors.blueAccent)),
                        child: Text(
                          "Request For ${leave.cuti.name}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: getFontSize(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: getHorizontalSize(80),
                padding: getPadding(all: 6),
                decoration: BoxDecoration(
                  color: getStatusColor(leave.status),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(getHorizontalSize(20)),
                ),
                child: Text(
                  getStatusText(leave.status),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: (leave.status == 0)
                          ? ColorConstant.black900
                          : ColorConstant.whiteA700),
                ),
              ),
            ],
          ),
        ),
      ),
      Divider(
        height: 0.5,
        color: Colors.grey[200],
      )
    ]);
  }

  Widget _noLeave() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: getVerticalSize(200), // Adjust width as needed
            height: getHorizontalSize(200), // Adjust height as needed
            decoration: BoxDecoration(
              color: Colors.blue[100], // Adjust color as needed
              borderRadius: BorderRadius.circular(
                  getHorizontalSize(100)), // Half the height for an oval shape
            ),
            child: Center(
              child: Icon(
                Icons.update,
                size: getFontSize(100),
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: getVerticalSize(16),
          ),
          Text(
            'There is no leave',
            style: TextStyle(
              fontSize: getFontSize(18),
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
