import 'package:Fast_Team/style/color_theme.dart';
import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Fast_Team/controller/inbox_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApprovalAttendancePage extends StatefulWidget {
  const ApprovalAttendancePage({Key? key}) : super(key: key);

  @override
  State<ApprovalAttendancePage> createState() => _ApprovalAttendancePageState();
}

class _ApprovalAttendancePageState extends State<ApprovalAttendancePage> {
  InboxController? inboxController;
  List<Map<String, dynamic>> attendanceList = [];
  var loading;

  @override
  void initState() {
    super.initState();

    inboxController = Get.put(InboxController());
    initConstructor();
    fetchData();
  }

  initConstructor() async {
    loading = false.obs;
  }

  Future refreshItem() async {
    fetchData();
  }

  Future<void> fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int userId = sharedPreferences.getInt('user-id_user') ?? 0;
    var result = await inboxController!.retrieveAttendanceList(userId);
    if (result['status'] == 200) {
      List<dynamic> data = result['details'];
      setState(() {
        attendanceList = List<Map<String, dynamic>>.from(data);
        loading = true.obs;
      });
    }
    print(loading);
  }

  showSnackBar(message) {
    snackbar() => SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(milliseconds: 2000),
        );
    ScaffoldMessenger.of(context).showSnackBar(snackbar());
  }

  Color getStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.blue;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendance List',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: RefreshWidget(
        onRefresh: refreshItem,
        child: ListView.builder(
          itemCount: attendanceList.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final attendance = attendanceList[index];
            final date = attendance['tanggal'].toString().split(' ')[0];
            DateTime parsedDate = DateTime.parse(date);
            final DateFormat formatter = DateFormat('dd MMM yyyy');
            final String formattedDate = formatter.format(parsedDate);
            return _attendanceTile(attendance, formattedDate);
          },
        ),
      ),
    );
  }

  Widget _loadingItems() {
    return ListView.builder(
      itemCount: 8,
      shrinkWrap: true,
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Column(children: [
                    Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Time",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Type",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ]),
                ),
                Container(
                    child: Column(
                  children: [
                    loadingData(90.w),
                    loadingData(90.w),
                    loadingData(90.w),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingData(width) => Shimmer.fromColors(
      baseColor: ColorsTheme.secondary!,
      highlightColor: ColorsTheme.lightGrey2!,
      child: Container(
        width: width,
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.r),
          color: ColorsTheme.white,
        ),
      ));

  Widget _attendanceTile(attendance, formattedDate) {
    return Column(
      children: [
        Container(
          child: InkWell(
            onTap: () async {
              final Uri url = Uri.parse(attendance['bukti']);
              await launchUrl(url);
            },
            child: Container(
              padding: EdgeInsets.all(9.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Date",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Time",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Type",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  formattedDate,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  attendance['tanggal']
                                      .toString()
                                      .split(' ')[1],
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  attendance['jenis'].toString().toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: (attendance['jenis'] == 'in')
                                        ? ColorsTheme.lightGreen
                                        : ColorsTheme.lightRed,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: getStatusColor(attendance['status']),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      getStatusText(attendance['status']),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
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
}
