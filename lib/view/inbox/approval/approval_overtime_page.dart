import 'package:Fast_Team/style/color_theme.dart';
import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  Future? _loadData;
  TextStyle alertErrorTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.white,
  );

  @override
  void initState() {
    super.initState();

    inboxController = Get.put(InboxController());
    initData();
  }

  initData() async {
    setState(() {
      _loadData = fetchData();
    });
  }

  Future refreshItem() async {
    setState(() {
      _loadData = fetchData();
    });
  }

  Future<void> fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int userId = sharedPreferences.getInt('user-id_user') ?? 0;
    var result = await inboxController!.retrieveOvertimeList(userId);
    print(result);
    if (result['status'] == 200) {
      List<dynamic> data = result['details'];
      setState(() {
        overtimeList = List<Map<String, dynamic>>.from(data);
      });
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
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Custom back button action
              Navigator.pop(context, 'true');
            },
          )),
      body: FutureBuilder(
          future: _loadData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _body(false);
            } else if (snapshot.hasError) {
              SchedulerBinding.instance!.addPostFrameCallback((_) {
                var snackbar = SnackBar(
                  content: Text('Error: ${snapshot.error}',
                      style: alertErrorTextStyle),
                  backgroundColor: ColorsTheme.lightRed,
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              });
              return _body(false);
            } else if (snapshot.hasData) {
              return _body(true);
            } else {
              return _body(true);
            }
          }),
    );
  }

  Widget _body(isLoading) {
    return RefreshWidget(
      onRefresh: refreshItem,
      child: (!isLoading)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: overtimeList.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final overtime = overtimeList[index];
                return _attendanceTile(overtime);
              },
            ),
    );
  }

  Widget _attendanceTile(overtime) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/overtimeDetail', arguments: {
          'tanggal': overtime['tanggal'],
          'start_time': overtime['jam_mulai'],
          'end_time': overtime['jam_selesai'],
          'status': overtime['status'],
          'nama': overtime['user']['name'],
          'photo': overtime['user']['photo'],
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 9.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Tanggal",
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text("Start Time",
                                  style: const TextStyle(
                                    color: Colors.black,
                                  )),
                              Text("End Time",
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                overtime['tanggal'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(overtime['jam_mulai'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  )),
                              Text(overtime['jam_selesai'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                    SizedBox(
                      height: 10.w,
                    ),
                    Text(
                      "Tap for more details",
                      style: TextStyle(fontSize: 10.sp),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.w,
            ),
            Divider(
              height: 0.5,
              color: Colors.grey[200],
            )
          ],
        ),
      ),
    );
  }
}
