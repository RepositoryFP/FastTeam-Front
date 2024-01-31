import 'package:Fast_Team/style/color_theme.dart';
import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Fast_Team/controller/inbox_controller.dart';
import 'package:get/get.dart';

class ApprovalOvertimePage extends StatefulWidget {
  const ApprovalOvertimePage({Key? key}) : super(key: key);

  @override
  State<ApprovalOvertimePage> createState() => _ApprovalOvertimePageState();
}

class _ApprovalOvertimePageState extends State<ApprovalOvertimePage> {
  InboxController? inboxController;
  List<Map<String, dynamic>> overtimeList = [];

  @override
  void initState() {
    super.initState();

    inboxController = Get.put(InboxController());
    fetchData();
  }

  Future refreshItem() async {
    fetchData();
  }

  Future<void> fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int userId = sharedPreferences.getInt('user-id_user') ?? 0;
    var result = await inboxController!.retrieveOvertimeList(userId);
    if (result['status'] == 200) {
      List<dynamic> data = result['details'];
      setState(() {
        overtimeList = List<Map<String, dynamic>>.from(data);
      });
      print(overtimeList);
    }
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
          'Overtime List',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: RefreshWidget(
        onRefresh: refreshItem,
        child: ListView.builder(
          itemCount: overtimeList.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final overtime = overtimeList[index];
            return _attendanceTile(overtime);
          },
        ),
      ),
    );
  }

  Widget _attendanceTile(overtime) {
    return Container(
      padding: EdgeInsets.all(9.w),
      margin: EdgeInsets.symmetric(vertical: 2.w, horizontal: 10.w),
      decoration: BoxDecoration(
        color: ColorsTheme.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('dd MMM yyyy')
                  .format(DateTime.parse(overtime['tanggal'])),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: getStatusColor(overtime['status']),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                getStatusText(overtime['status']),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      Text(
                        'End Time',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overtime['jam_mulai'],
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      Text(
                        overtime['jam_selesai'],
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
    // return Container(
    //   padding: EdgeInsets.all(9.w),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           Padding(
    //             padding: EdgeInsets.only(left: 8.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    // Text(
    //   overtime['tanggal'],
    //   style: const TextStyle(
    //     fontSize: 16,
    //     color: Colors.grey,
    //   ),
    // ),
    // Row(
    //   children: <Widget>[
    //     Icon(Icons.rotate_right),
    //     Text(
    //       overtime['jam_mulai'],
    //     )
    //   ],
    // ),
    // Row(
    //   children: <Widget>[
    //     Icon(Icons.rotate_left),
    //     Text(
    //       overtime['jam_selesai'],
    //     )
    //   ],
    // )
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    // Container(
    //   padding: EdgeInsets.all(6.0),
    //   decoration: BoxDecoration(
    //     color: getStatusColor(overtime['status']),
    //     shape: BoxShape.rectangle,
    //     borderRadius: BorderRadius.circular(20.0),
    //   ),
    //   child: Text(
    //     getStatusText(overtime['status']),
    //     style: TextStyle(color: Colors.white),
    //   ),
    // )
    //     ],
    //   ),
    // );
  }
}
