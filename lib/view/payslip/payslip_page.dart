import 'package:Fast_Team/controller/account_controller.dart';
import 'package:Fast_Team/model/account_information_model.dart';
import 'package:Fast_Team/style/color_theme.dart';
import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:accordion/accordion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:shimmer/shimmer.dart';

class PayslipPage extends StatefulWidget {
  const PayslipPage({super.key});

  @override
  State<PayslipPage> createState() => _PayslipPageState();
}

class _PayslipPageState extends State<PayslipPage> {
  var nama;
  var posisi;
  var imgUrl;
  Future? _fetchData;
  bool isOpen = false;
  DateTime _selectedDate = DateTime.now();
  bool showSalary = false;

  TextStyle alertErrorTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.white,
  );

  @override
  void initState() {
    super.initState();
    initConstructor();
  }

  Future refreshItem() async {
    setState(() {});
  }

  initConstructor() async {
    nama = "".obs;
    posisi = "".obs;
    imgUrl = "".obs;

    setState(() {
      _fetchData = initData();
    });
  }

  Future<void> initData() async {
    AccountController accountController = Get.put(AccountController());
    var result = await accountController.retriveAccountInformation();
    AccountInformationModel accountModel =
        AccountInformationModel.fromJson(result['details']['data']);
    setState(() {
      nama = accountModel.fullName;
      posisi = accountModel.posisiPekerjaan;
      imgUrl = accountModel.imgProfUrl;
    });
  }

  Future<void> _selectMonth(BuildContext context) async {
    showMonthPicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(DateTime.now().year - 1, 1),
      lastDate: DateTime(DateTime.now().year + 1, 12),
    ).then((date) async {
      if (date != null) {
        setState(() {
          _selectedDate = date;
          print(date);
        });
        // await _loadDataForSelectedMonth();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMM().format(_selectedDate);
    Widget _body() {
      return FutureBuilder(
          future: _fetchData,
          builder: (context, AsyncSnapshot snapshot) {
            print(snapshot);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
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
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return _bodyContent(context, formattedDate);
            } else {
              return _bodyContent(context, formattedDate);
            }
          });
    }

    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'My Payslip',
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
        body: RefreshWidget(
          onRefresh: refreshItem,
          child: _body(),
        ));
  }

  Widget _bodyContent(BuildContext context, String formattedDate) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: TextButton(
              onPressed: () {
                _selectMonth(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                backgroundColor: Colors.transparent,
                primary: Colors.black,
                side: BorderSide(color: Colors.black, width: 1.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          size: 24,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          formattedDate,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          _cardInfo(context),
          SizedBox(height: 20.h),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView(
                children: [
                  _salarySlipCard(context),
                  _salarySlipCard(context),
                  SizedBox(
                    height: 10.w,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        splashFactory: InkSplash.splashFactory,
                        minimumSize: const Size(double.infinity, 48.0),
                      ),
                      child: Text(
                        'Download Salary Slip',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _salarySlipCard(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text("Salary Slip"),
        children: [
          Container(
            color: ColorsTheme.white,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("basic Salary"),
                      Text("Loan "),
                      Text("Overtime"),
                      Text("Bonus"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rp 100.000.000"),
                      Text("Rp 100.000.000"),
                      Text("Rp 100.000.000"),
                      Text("Rp 100.000.000"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            height: 40.w,
            color: ColorsTheme.whiteCream,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Deduction "),
                  Text("Rp 100.000.000"),
                ]),
          ),
        ],
        shape: Border.all(color: Colors.transparent),
      ),
    );
  }

  Widget _cardInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF42A5F5), Color(0xFF1976D2), Color(0xFF0D47A1)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.w),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: '$imgUrl',
                    imageBuilder: (context, imageProvider) => ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: CircleAvatar(
                        radius: 30.r,
                        backgroundImage: imageProvider,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$nama",
                        style: TextStyle(
                          color: ColorsTheme.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      Text(
                        "$posisi",
                        style: TextStyle(
                          color: ColorsTheme.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 1.w, color: ColorsTheme.white),
            SizedBox(
              height: 5.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Salary",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsTheme.white,
                      ),
                    ),
                    // Display salary only if showSalary is true
                    Text(
                      (showSalary) ? "Rp 100.000.000.000" : "********",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsTheme.white,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    showSalary ? Icons.visibility : Icons.visibility_off,
                    color: ColorsTheme.white,
                  ),
                  onPressed: () {
                    setState(() {
                      showSalary = !showSalary;
                    });
                  },
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
