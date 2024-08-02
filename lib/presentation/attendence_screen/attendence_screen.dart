import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/presentation/attendence_screen/controller/attendence_controller.dart';
import 'package:fastteam_app/presentation/employee_screen/controller/employee_controller.dart';
import 'package:fastteam_app/widgets/custom_search_view.dart';
import 'package:flutter/services.dart';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({Key? key}) : super(key: key);

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  AttendenceController controller = Get.put(AttendenceController());
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    controller.getAttendanceList();
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
                title: AppbarTitle(text: "Attendence".tr),
              ),
              body: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!controller.isDataLoaded.value) {
                  return _noAttendance();
                }

                return SafeArea(
                    child: Container(
                  width: double.maxFinite,
                  decoration: AppDecoration.white,
                  child: Expanded(
                    child: ListView.builder(
                      padding: getPadding(top: 16),
                      itemCount: controller
                          .attendanceList.length, // Use filteredEmployees here
                      itemBuilder: (context, index) {
                        final employee = controller.attendanceList[index];

                        final date = employee.tanggal.toString().split(' ')[0];
                        final time = employee.tanggal.toString().split(' ')[1];
                        DateFormat formatTime = DateFormat('HH:mm');
                        DateTime ParsedTime = formatTime.parse(time);
                        final String formattedTime =
                            formatTime.format(ParsedTime);
                        DateTime parsedDate = DateTime.parse(date);
                        final DateFormat formatter = DateFormat('dd MMMM yyyy');
                        final String formattedDate =
                            formatter.format(parsedDate);
                        return _attendanceTile(
                            employee, formattedTime, formattedDate);
                      },
                    ),
                  ),
                ));
              })),
        ));
  }

  Widget _attendanceTile(attendance, formattedTime, formattedDate) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            // final Uri url = Uri.parse(attendance['bukti']);
            // await launchUrl(url);
            // Navigator.pushNamed(context, '/attendenceDetail', arguments: {
            //   'tanggal': formattedDate,
            //   'time': DateFormat.Hms()
            //       .parse(attendance['tanggal'].toString().split(' ')[1]),
            //   'status': attendance['status'],
            //   'bukti': attendance['bukti'],
            //   'jenis': attendance['jenis'],
            //   'nama': attendance['user']['name'],
            //   'photo': attendance['user']['photo'],
            // });
          },
          child: Container(
            padding: getPadding(all: 9),
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
                        Padding(
                          padding: getPadding(left: 8),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                ],
                              ),
                              SizedBox(
                                width: getHorizontalSize(10),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    formattedDate,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: getFontSize(15)),
                                  ),
                                  SizedBox(
                                    height: getVerticalSize(10),
                                  ),
                                  Text(
                                    formattedTime,
                                    style: const TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(5),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: getVerticalSize(45),
                        ),
                        Container(
                          padding: getPadding(left: 10, right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.blueAccent)),
                          child: Text(
                            "Request For ${attendance.jenis.toString().capitalizeFirst}",
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
                    color: getStatusColor(attendance.status),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(getHorizontalSize(20)),
                  ),
                  child: Text(
                    getStatusText(attendance.status),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: (attendance.status == 0)
                          ? ColorConstant.black900
                          : ColorConstant.whiteA700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          height: 0.5,
          color: Colors.grey[200],
        )
      ],
    );
  }

  Widget _noAttendance() {
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
            'There is no attendance',
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
