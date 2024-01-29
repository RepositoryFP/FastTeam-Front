import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Fast_Team/controller/inbox_controller.dart';
import 'package:get/get.dart';

class ApprovalLeavePage extends StatefulWidget {
  const ApprovalLeavePage({Key? key}) : super(key: key);

  @override
  State<ApprovalLeavePage> createState() => _ApprovalLeavePageState();
}

class _ApprovalLeavePageState extends State<ApprovalLeavePage> {
  InboxController? inboxController;
  List<Map<String, dynamic>> leaveList = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Leave List',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: RefreshWidget(
        onRefresh: refreshItem,
        child: ListView.builder(
          itemCount: leaveList.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final leave = leaveList[index];
            return _attendanceTile(leave);
          },
        ),
      ),
    );
  }

  Container _attendanceTile(leave) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: <Widget>[
              Container(
                child: CircleAvatar(
                  backgroundImage: NetworkImage("http://103.29.214.154:9002/static/imgUserProfile/${leave['user']['photo']}"),
                  radius: 30.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      leave['cuti']['name'], 
                    ),
                    Text(
                      leave['tanggal'],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),  
                    ),
                    Text(
                      (leave['alasan'] == null || leave['alasan'] == '') ? '-': leave['alasan'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    )
                  ],
                ),
              )
            ],
          ),
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
          )
        ],
      ),
    );
  }
}