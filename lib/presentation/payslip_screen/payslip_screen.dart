
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/presentation/home_page/controller/home_controller.dart';
import 'package:fastteam_app/presentation/home_page/models/home_model.dart';
import 'package:fastteam_app/presentation/payslip_screen/controller/payslip_controller.dart';
import 'package:fastteam_app/presentation/payslip_screen/widget/month_picker.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_refresh_widget.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class payslipScreen extends StatefulWidget {
  const payslipScreen({super.key});

  @override
  State<payslipScreen> createState() => _payslipScreenState();
}

class _payslipScreenState extends State<payslipScreen> {
  double? progressDownload;

  var nama;
  var divisi;
  var imgUrl;
  DateTime _selectedDate = DateTime.now();
  bool showSalary = false;
  

  HomeController homeController = Get.put(HomeController(HomeModel().obs));
  PayslipController controller = Get.put(PayslipController());

  @override
  void initState() {
    super.initState();
    homeController.getAccountInformation();
    controller.payrolData(_selectedDate);
  }

  Future refreshItem() async {
      setState(() {
        controller.payrolData(_selectedDate);
        showSalary = false;
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
          controller.payrolData(date);
          showSalary = false;
        });
      }
    });
  }

  Future<void> download() async {
   
    var result = await controller.retriveLinkDownloadPayslip();
    Map<String, dynamic> jsonData = result['details'];
    var url = Uri.parse(jsonData['message']);
    if (!await launchUrl(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Download Failed"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMM().format(_selectedDate);

    return SafeArea(
      child: Scaffold(
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
            title: AppbarTitle(text: "My Payslip".tr),
          ),
          body: RefreshWidget(
              onRefresh: refreshItem,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    monthPicker(formattedDate, () => _selectMonth(context)),
                    _cardInfo(context),
                    SizedBox(height: getVerticalSize(20)),
                    (!controller.emptyData)
                        ? Expanded(
                            child: Container(
                              margin: getMargin(right: 10, left: 10),
                              child: ListView(
                                children: [
                                  _salarySlipCard(context),
                                  SizedBox(
                                    height: getVerticalSize(10),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        download().then((_) {
                                          print('Payslip is downloaded !');
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue[900],
                                        splashFactory: InkSplash.splashFactory,
                                      ),
                                      child: const Text(
                                        'Download Salary Slip',
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          )
                    :
                    _noData()
                  ],
                );
              }))),
    );
  }

  Widget _noData() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Center(
            child: Container(
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
              decoration: BoxDecoration(
                color: Colors.blue[100], // Adjust color as needed
                borderRadius: BorderRadius.circular(
                    100), // Half the height for an oval shape
              ),
              child: const Center(
                child: Icon(
                  Icons.update,
                  size: 100.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Center(
            child: Text(
              'There is no data',
              style: TextStyle(
                fontSize: 18,
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
        initiallyExpanded: true,
        title: const Text("Salary Slip"),
        shape: Border.all(color: Colors.transparent),
        children: [
          Container(
            color: ColorConstant.whiteA700,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: getMargin(right: 15, left: 15, top: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Basic Salary",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 10),
                            child: Text(
                              "Allowance",
                              style: AppStyle.txtSFProDisplayRegular16
                            ),
                          ),
                          if (controller.detail_payroll.isEmpty)
                            const Text("")
                          else if (controller.detail_payroll
                              .where((item) => item["type"] == "allowance")
                              .isEmpty)
                            const Text(
                              "-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          else
                            ...controller.detail_payroll
                                .where((item) => item["type"] == "allowance")
                                .map((item) {
                              String jenis = item["jenis"];
                              jenis = jenis
                                  .split(' ')
                                  .map((word) =>
                                      word.substring(0, 1).toUpperCase() +
                                      word.substring(1))
                                  .join(' ');
                              return Text(
                                "$jenis",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }).toList(),
                          Padding(
                            padding: getPadding(top: 10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Deductions",
                                style: AppStyle.txtSFProDisplayRegular16,
                              ),
                            ),
                          ),
                          if (controller.detail_payroll.isEmpty) // Cek apakah data kosong
                            const Text(
                                "") // Jika kosong, kembalikan Text kosong
                          else if (controller.detail_payroll
                              .where((item) => item["type"] == "deduction")
                              .isEmpty)
                            const Text(
                              "-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          else
                            ...controller.detail_payroll
                                .where((item) => item["type"] == "deduction")
                                .map((item) {
                              String jenis = item["jenis"];
                              jenis = jenis
                                  .split(' ')
                                  .map((word) =>
                                      word.substring(0, 1).toUpperCase() +
                                      word.substring(1))
                                  .join(' ');
                              return Text(
                                "$jenis",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }).toList(),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Rp. ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(""),
                              if (controller.detail_payroll
                                  .isEmpty) // Cek apakah data kosong
                                const Text(
                                    "") // Jika kosong, kembalikan Text kosong
                              else if (controller.detail_payroll
                                  .where((item) => item["type"] == "allowance")
                                  .isEmpty)
                                const Text(
                                  "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              else
                                ...controller.detail_payroll
                                    .where(
                                        (item) => item["type"] == "allowance")
                                    .map((item) {
                                  return const Text(
                                    "Rp. ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }),
                              const Text(""),
                              if (controller.detail_payroll
                                  .isEmpty) // Cek apakah data kosong
                                const Text(
                                    "") // Jika kosong, kembalikan Text kosong
                              else if (controller.detail_payroll
                                  .where((item) => item["type"] == "deduction")
                                  .isEmpty)
                                const Text(
                                  "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              else
                                ...controller.detail_payroll
                                    .where(
                                        (item) => item["type"] == "deduction")
                                    .map((item) {
                                  return const Text(
                                    "Rp. ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                controller.formatCurrency(controller.basic_salary),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(""),
                              if (controller.detail_payroll
                                  .isEmpty) // Cek apakah data kosong
                                const Text(
                                    "") // Jika kosong, kembalikan Text kosong
                              else if (controller.detail_payroll
                                  .where((item) => item["type"] == "allowance")
                                  .isEmpty)
                                const Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              else
                                ...controller.detail_payroll
                                    .where(
                                        (item) => item["type"] == "allowance")
                                    .map((item) {
                                  double amount = item["amount"];
                                  String formattedAmount = 
                                  controller.formatCurrency(amount);
                                  return Text(
                                    formattedAmount,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList(),
                              const Text(""),
                              if (controller.detail_payroll
                                  .isEmpty) // Cek apakah data kosong
                                const Text(
                                    "") // Jika kosong, kembalikan Text kosong
                              else if (controller.detail_payroll
                                  .where((item) => item["type"] == "deduction")
                                  .isEmpty)
                                const Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              else
                                ...controller.detail_payroll
                                    .where(
                                        (item) => item["type"] == "deduction")
                                    .map((item) {
                                  double amount = item["amount"].toDouble();
                                  String formattedAmount = 
                                  controller.formatCurrency(amount);
                                  return Text(
                                    formattedAmount,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: getVerticalSize(10)),
                  const Divider(),
                  SizedBox(height: getVerticalSize(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Basic Salary",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Total Allowance",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Total Deduction",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rp. ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Rp. ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Rp. ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                
                                controller.formatCurrency(controller.basic_salary),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                
                                controller.formatCurrency(controller.allowance),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                
                                controller.formatCurrency(controller.deduction),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: getPadding(left: 15, right: 15),
            height: getVerticalSize(40),
            color: ColorConstant.whiteA700,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Take Home Pay",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    
                    "Rp ${controller.formatCurrency(controller.net_salary)}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  Widget _cardInfo(BuildContext context) {
    nama = homeController.accountInfo!.fullName;
    divisi = homeController.accountInfo!.posisiPekerjaan;

    imgUrl = homeController.accountInfo!.imgProfUrl;
    return Container(
      margin: getMargin(left: 10, right: 10),
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF42A5F5), Color(0xFF1976D2), Color(0xFF0D47A1)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(getHorizontalSize(15)),
          ),
          padding: getPadding(all: 16),
          child: Column(children: [
            Container(
              margin: getMargin(bottom: 10),
              child: Row(
                children: [
                  CustomImageView(
                      url: imgUrl,
                      height: getSize(80),
                      width: getSize(80),
                      radius: BorderRadius.circular(getHorizontalSize(60)),
                      alignment: Alignment.center),
                  SizedBox(
                    width: getVerticalSize(10),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$nama",
                          style: AppStyle.txtBodyWhite20,
                        ),
                        SizedBox(
                          height: getVerticalSize(2),
                        ),
                        Text(
                          "$divisi",
                          style: AppStyle.txtSFProTextRegular13,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: getVerticalSize(1), color: ColorConstant.whiteA700),
            SizedBox(
              height: getVerticalSize(5),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  showSalary = !showSalary;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Basic Salary",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorConstant.whiteA700,
                        ),
                      ),
                      Text(
                        (showSalary)
                            ? "Rp ${controller.formatCurrency(controller.basic_salary)}"
                            : "********",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: ColorConstant.whiteA700,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Icon(
                      showSalary ? Icons.visibility : Icons.visibility_off,
                      color: ColorConstant.whiteA700,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  onTapArrowleft11() {
    Get.toNamed(AppRoutes.homeContainerScreen);
  }
}
