import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fastteam_app/presentation/employee_screen/controller/employee_controller.dart';
import 'package:fastteam_app/presentation/request_screen/controller/request_controller.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_drop_down.dart';
import 'package:fastteam_app/widgets/custom_floating_edit_text.dart';
import 'package:fastteam_app/widgets/custom_search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  EmployeeController controller = Get.put(EmployeeController());
  RequestController requestController = Get.put(RequestController());

  List<DateTime?> _dates = [DateTime.now()];
  List<DateTime?> _dates_absent = [DateTime.now()];
  DateTime _time_absent = DateTime.now();
  TextEditingController urlController = TextEditingController();

  File? imageFile;
  String leaveType = '1';
  List<DateTime?> _dates_leave = [DateTime.now()];
  DateTime _time_leave = DateTime.now();
  TextEditingController reasonController = TextEditingController();

  List<DateTime?> _dates_overtime = [DateTime.now()];
  DateTime _start_overtime = DateTime.now();
  DateTime _end_overtime = DateTime.now();
  TextEditingController overtimeController = TextEditingController();

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
  }

  Future<void> submitAbsent() async {
    // Validate input fields
    if (_time_absent == null ||
        _dates_absent.isEmpty ||
        urlController.text.isEmpty) {
      requestController.showSnackBar(
          context, 'Please fill in all the required fields');
      return;
    }

    loadingDialog(context);

    var jenis = absenType == 'Clock In' ? 'in' : 'out';
    var time = DateFormat('HH:mm:ss').format(_time_absent);
    var date = DateFormat('yyyy-MM-dd').format(_dates_absent[0]!);
    var url = urlController.text;

    var result =
        await requestController.submitAbsent(context, date, time, jenis, url);

    Navigator.of(context).pop();

    if (result['status'] == 200 || result['status'] == 201) {
      setState(() {
        urlController.text = '';
      });
      showCustomDialog(context,
          'Request has been submitted, please check your inbox periodically for confirmation updates');
    } else {
      requestController.showSnackBar(context, 'Server having trouble');
    }
  }

  Future<void> submitOvertime() async {
    // Validate input fields
    if (_start_overtime == null ||
        _end_overtime == null ||
        _dates_overtime.isEmpty ||
        overtimeController.text.isEmpty) {
      requestController.showSnackBar(
          context, 'Please fill in all the required fields');
      return;
    }

    loadingDialog(context);

    var start_time = DateFormat('HH:mm').format(_start_overtime);
    var end_time = DateFormat('HH:mm').format(_end_overtime);
    var date = DateFormat('yyyy-MM-dd').format(_dates_overtime[0]!);
    var reason = overtimeController.text;

    var result = await requestController.submitOvertime(
        context, date, start_time, end_time, reason);

    // Dismiss the loading dialog
    Navigator.of(context).pop();

    if (result['status'] == 200 || result['status'] == 201) {
      setState(() {
        overtimeController.text = '';
      });
      showCustomDialog(context,
          'Request has been submitted, please check your inbox periodically for confirmation updates');
    } else {
      requestController.showSnackBar(context, 'Server having trouble');
    }
  }

  Future<void> submitLeave() async {
    // Validate input fields
    if (_time_leave == null ||
        _dates_leave.isEmpty ||
        reasonController.text.isEmpty ||
        imageFile == null) {
      requestController.showSnackBar(
          context, 'Please fill in all the required fields');
      return;
    }

    loadingDialog(context);

    var jenis = leaveType;
    var time = DateFormat('HH:mm:ss').format(_time_leave);
    var date = DateFormat('yyyy-MM-dd').format(_dates_leave[0]!);
    var reason = reasonController.text;
    var img = imageFile;

    var result = await requestController.submitLeave(
        context, date, time, jenis, reason, img);

    Navigator.of(context).pop();

    if (result == 200 || result == 201) {
      setState(() {
        reasonController.text = '';
        imageFile = null;
      });
      showCustomDialog(context,
          'Request has been submitted, please check your inbox periodically for confirmation updates');
    } else {
      requestController.showSnackBar(context, 'Server having trouble');
    }
  }

  Future<void> _takePicture() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  void showCustomDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void loadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 15),
                Text('Submitting your request...')
              ],
            ),
          ),
        );
      },
    );
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
            title: AppbarTitle(text: "Request Form".tr),
          ),
          body: SafeArea(
            child: Container(
              width: double.maxFinite,
              decoration: AppDecoration.white,
              child: DefaultTabController(
                length: 3,
                child: Column(children: <Widget>[
                  Container(
                    color:
                        ColorConstant.whiteA700, // warna latar belakang tab bar
                    child: TabBar(
                      tabs: [
                        Tab(
                          text: "Absent",
                        ),
                        Tab(
                          text: "Leave",
                        ),
                        Tab(
                          text: "Overtime",
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        children: [
                          absent_tab(),
                          leave_tab(),
                          overtime_tab(),
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

  Widget overtime_tab() {
    return Padding(
      padding: getPadding(right: 10, left: 10),
      child: ListView(
        padding: getPadding(top: 16),
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: getPadding(left: 16, right: 16, bottom: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Date".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOutfitBold20)),
            ),
            Padding(
                padding: getPadding(left: 16, bottom: 16, right: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TimePickerSpinnerPopUp(
                    mode: CupertinoDatePickerMode.date,
                    initTime: DateTime.now(),
                    onChange: (dateTime) {
                      setState(() {
                        _dates_overtime = [dateTime];
                      });
                    },
                  ),
                )),
            Padding(
              padding: getPadding(left: 16, right: 16, bottom: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Time Start".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOutfitBold20)),
            ),
            Padding(
                padding: getPadding(left: 16, bottom: 16, right: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TimePickerSpinnerPopUp(
                    mode: CupertinoDatePickerMode.time,
                    initTime: DateTime.now(),
                    onChange: (dateTime) {
                      setState(() {
                        _start_overtime = dateTime;
                      });
                    },
                  ),
                )),
            Padding(
              padding: getPadding(left: 16, right: 16, bottom: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Time End".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOutfitBold20)),
            ),
            Padding(
                padding: getPadding(left: 16, top: 0, right: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.time,
                      initTime: DateTime.now(),
                      onChange: (dateTime) {
                        setState(() {
                          _end_overtime = dateTime;
                        });
                      },
                    ))),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: getPadding(top: 38),
                      child: Text("Reason".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOutfitBold20))),
            ),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: CustomFloatingEditText(
                  focusNode: FocusNode(),
                  controller: overtimeController,
                  labelText: "Reason".tr,
                  hintText: "Enter reason".tr,
                  margin: getMargin(top: 16),
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter valid number";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: CustomButton(
                  height: getVerticalSize(54),
                  text: "Submit".tr,
                  margin: getMargin(top: 103, bottom: 5),
                  onTap: () {
                    submitOvertime();
                  }),
            )
          ])
        ],
      ),
    );
  }

  Widget leave_tab() {
    return Padding(
      padding: getPadding(right: 10, left: 10),
      child: ListView(
        padding: getPadding(top: 16),
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: getPadding(left: 16, right: 16, bottom: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Date".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOutfitBold20)),
            ),
            Padding(
                padding: getPadding(left: 16, bottom: 16, right: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.time,
                      initTime: DateTime.now(),
                      onChange: (dateTime) {
                        setState(() {
                          _dates_leave = [dateTime];
                        });
                      },
                    ))),
            Padding(
              padding: getPadding(left: 16, right: 16, bottom: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Time".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOutfitBold20)),
            ),
            Padding(
                padding: getPadding(left: 16, top: 0, right: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.time,
                      initTime: DateTime.now(),
                      onChange: (dateTime) {
                        setState(() {
                          _time_leave = dateTime;
                        });
                      },
                    ))),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: getPadding(top: 38),
                      child: Text("Agenda".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOutfitBold20))),
            ),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: _agendaTypeRadio(),
            ),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: getPadding(top: 38),
                      child: Text("Reason".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOutfitBold20))),
            ),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: CustomFloatingEditText(
                  focusNode: FocusNode(),
                  controller: reasonController,
                  labelText: "Reason".tr,
                  hintText: "Enter reason".tr,
                  margin: getMargin(top: 16),
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter valid number";
                    }
                    return null;
                  }),
            ),
            _addPhoto(),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: CustomButton(
                  height: getVerticalSize(54),
                  text: "Submit".tr,
                  margin: getMargin(top: 103, bottom: 5),
                  onTap: () {
                    submitLeave();
                  }),
            )
          ])
        ],
      ),
    );
  }

  Widget _addPhoto() {
    return Center(
      child: Container(
        margin: getMargin(top: 30, left: 20, right: 20),
        decoration: BoxDecoration(
            border: Border.all(color: ColorConstant.gray300),
            borderRadius:
                BorderRadius.all(Radius.circular(getHorizontalSize(10)))),
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                _takePicture();
              },
              child: Column(
                children: [
                  if (imageFile != null)
                    Padding(
                      padding: getPadding(all: 10),
                      child: Image.file(
                        imageFile!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    )
                  else
                    Icon(
                      Icons.photo,
                      size: 100,
                      color: ColorConstant.gray300,
                    ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Take a Picture',
                        style: AppStyle.txtSFProTextRegular16Gray600),
                  ),
                ],
              ),
            ),
            if (imageFile != null)
              Positioned(
                top: getVerticalSize(5),
                right: getVerticalSize(5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      imageFile = null; // Remove the taken image
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.gray200, // Grey background
                    ),
                    child: Icon(
                      Icons.close,
                      size: getFontSize(30),
                      color: ColorConstant.black900, // Close icon color
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget absent_tab() {
    return Padding(
      padding: getPadding(right: 10, left: 10),
      child: ListView(
        padding: getPadding(top: 16),
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: getPadding(left: 16, right: 16, bottom: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Date".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOutfitBold20)),
            ),
            Padding(
                padding: getPadding(left: 16, bottom: 16, right: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.date,
                      initTime: DateTime.now(),
                      onChange: (dateTime) {
                        setState(() {
                          _dates_absent = [dateTime];
                        });
                      },
                    ))),
            Padding(
              padding: getPadding(left: 16, right: 16, bottom: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Time".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOutfitBold20)),
            ),
            Padding(
                padding: getPadding(left: 16, top: 0, right: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.time,
                      initTime: DateTime.now(),
                      onChange: (dateTime) {
                        setState(() {
                          _time_absent = dateTime;
                        });
                      },
                    ))),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: getPadding(top: 38),
                      child: Text("Type".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOutfitBold20))),
            ),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: _absentTypeRadio(),
            ),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: getPadding(top: 38),
                      child: Text("Url".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOutfitBold20))),
            ),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: CustomFloatingEditText(
                  focusNode: FocusNode(),
                  controller: urlController,
                  labelText: "URL".tr,
                  hintText: "Enter url".tr,
                  margin: getMargin(top: 16),
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter valid number";
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: getPadding(left: 16, right: 16),
              child: CustomButton(
                  height: getVerticalSize(54),
                  text: "Submit".tr,
                  margin: getMargin(top: 103, bottom: 5),
                  onTap: () {
                    submitAbsent();
                  }),
            )
          ])
        ],
      ),
    );
  }

  Widget _absentTypeRadio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    absenType = 'Clock In';
                  });
                },
                child: Row(
                  children: [
                    Radio(
                      value: 'Clock In',
                      groupValue: absenType,
                      onChanged: (value) {
                        setState(() {
                          absenType = value.toString();
                        });
                      },
                    ),
                    Text('Clock In', style: AppStyle.txtSFProTextRegular16),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    absenType = 'Clock Out';
                  });
                },
                child: Row(
                  children: [
                    Radio(
                      value: 'Clock Out',
                      groupValue: absenType,
                      onChanged: (value) {
                        setState(() {
                          absenType = value.toString();
                        });
                      },
                    ),
                    Text('Clock Out', style: AppStyle.txtSFProTextRegular16),
                  ],
                ),
              ),
            ),
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
            GestureDetector(
              onTap: () {
                setState(() {
                  leaveType = '1';
                });
              },
              child: Row(
                children: [
                  Radio(
                    value: '1',
                    groupValue: leaveType,
                    onChanged: (value) {
                      setState(() {
                        leaveType = value.toString();
                      });
                    },
                  ),
                  Text('Leave', style: AppStyle.txtSFProTextRegular16),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  leaveType = '2';
                });
              },
              child: Row(
                children: [
                  Radio(
                    value: '2',
                    groupValue: leaveType,
                    onChanged: (value) {
                      setState(() {
                        leaveType = value.toString();
                      });
                    },
                  ),
                  Text('Sick', style: AppStyle.txtSFProTextRegular16),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  leaveType = '3';
                });
              },
              child: Row(
                children: [
                  Radio(
                    value: '3',
                    groupValue: leaveType,
                    onChanged: (value) {
                      setState(() {
                        leaveType = value.toString();
                      });
                    },
                  ),
                  Text('Out of Town Duty',
                      style: AppStyle.txtSFProTextRegular16),
                ],
              ),
            ),
          ],
        ),
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
