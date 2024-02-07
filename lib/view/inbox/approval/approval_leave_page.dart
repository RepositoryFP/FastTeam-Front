import 'package:Fast_Team/style/color_theme.dart';
import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Fast_Team/controller/inbox_controller.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ApprovalLeavePage extends StatefulWidget {
  const ApprovalLeavePage({Key? key}) : super(key: key);

  @override
  State<ApprovalLeavePage> createState() => _ApprovalLeavePageState();
}

class _ApprovalLeavePageState extends State<ApprovalLeavePage> {
  InboxController? inboxController;
  List<Map<String, dynamic>> leaveList = [];
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
    leaveList.clear();
    setState(() {
      _loadData = fetchData();
    });
  }

  Future<void> fetchData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int userId = sharedPreferences.getInt('user-id_user') ?? 0;
    var result = await inboxController!.retrieveLeaveList(userId);
    if (result['status'] == 200) {
      List<dynamic> data = result['details'];
      setState(() {
        leaveList = List<Map<String, dynamic>>.from(data);
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

  String formatDateString(String dateString) {
    // Parse the original date string
    DateTime originalDate = DateTime.parse(dateString);

    // Define the date format
    DateFormat formatter = DateFormat('dd MMM yyyy HH:mm');

    // Format the date to the desired format
    String formattedDate = formatter.format(originalDate);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Leave List',
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
          : (leaveList.isNotEmpty)
              ? ListView.builder(
                  itemCount: leaveList.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final leave = leaveList[index];
                    return _attendanceTile(leave);
                  })
              : Center(
                  child: const CircularProgressIndicator(),
                ),
    );
  }

  Widget _attendanceTile(leave) {
    final date = leave['tanggal'].toString().split(' ')[0];
    DateTime parsedDate = DateTime.parse(date);
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formattedDate = formatter.format(parsedDate);
    return Column(children: <Widget>[
      InkWell(
        onTap: () async {
          Navigator.pushNamed(context, '/leaveDetail', arguments: {
            'tanggal': formattedDate,
            'time': DateFormat.Hms()
                .parse("${leave['tanggal'].toString().split(' ')[1]}"),
            'status': leave['status'],
            'bukti': leave['bukti'],
            'alasan': leave['alasan'],
            'nama': leave['user']['name'],
            'photo': leave['user']['photo'],
            'cuti': leave['cuti']['name'],
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Type',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                        Text('Date',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                        Text('Reason',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ]),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(leave['cuti']['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          formatDateString(leave['tanggal']),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          (leave['alasan'] == null || leave['alasan'] == '')
                              ? '-'
                              : leave['alasan'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        )
                      ],
                    ),
                  )
                ],
              ),
              // (leave['bukti'].toString().isEmpty)
              // ? Container(
              //   padding: EdgeInsets.all(15.0),
              //   decoration: BoxDecoration(
              //     color: Colors.purple[100],
              //     shape: BoxShape.rectangle,
              //     borderRadius: BorderRadius.circular(100.0),
              //   ),
              //   child: const Icon(Icons.photo, color: Colors.white, size: 30,),
              // )
              // : GestureDetector(
              //   onTap: () {
              //     showImage(context, leave['bukti']);
              //   },
              //   child: CircleAvatar(
              //     backgroundImage: NetworkImage('http://103.29.214.154:9002/static/bukti/${leave['bukti']}'),
              //     radius: 30,
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: getStatusColor(leave['status']),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      getStatusText(leave['status']),
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
        ),
      ),
      Divider(
        height: 0.5,
        color: Colors.grey[200],
      )
    ]);
  }

  Widget _pillDecoration(message, Color color) {
    return Container(
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
