import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:flutter/material.dart';
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

  Container _attendanceTile(overtime) {
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
                  backgroundImage: NetworkImage("http://103.29.214.154:9002/static/imgUserProfile/${overtime['user']['photo']}"),
                  radius: 30.0,
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
                        fontSize: 16,
                        color: Colors.grey,
                      ),  
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.rotate_right),
                        Text(
                          overtime['jam_mulai'], 
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.rotate_left),
                        Text(
                          overtime['jam_selesai'], 
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
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
          )
        ],
      ),
    );
  }
}