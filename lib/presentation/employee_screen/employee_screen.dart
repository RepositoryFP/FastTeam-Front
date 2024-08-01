import 'package:fastteam_app/presentation/employee_screen/controller/employee_controller.dart';
import 'package:fastteam_app/widgets/custom_search_view.dart';
import 'package:flutter/services.dart';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  EmployeeController controller = Get.put(EmployeeController());
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    controller.retrieveEmployeeList();
  }

  Future<void> _launchWhatsapp(String phone) async {
    var whatsappUrl =
        Uri.parse("https://api.whatsapp.com/send?phone=+62$phone");
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }

  Future<void> _launchPhone(String phone) async {
    var phoneUrl = Uri.parse("tel:+62$phone");
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Phone can't open on the device"),
        ),
      );
    }
  }

  Future<void> _launchMail(String email) async {
    var mailUrl = Uri.parse("mailto:$email");
    if (await canLaunchUrl(mailUrl)) {
      await launchUrl(mailUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email client is not installed on the device"),
        ),
      );
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
                  margin: getMargin(left: 16, top: 29, bottom: 28),
                ),
                centerTitle: true,
                title: AppbarTitle(text: "Employee".tr),
              ),
              body: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!controller.isDataLoaded.value) {
                  return Center(child: Text("No data loaded."));
                }

                final employees = controller.filteredEmployees;

                return SafeArea(
                    child: Container(
                  width: double.maxFinite,
                  decoration: AppDecoration.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: getPadding(left: 10, right: 10, bottom: 20),
                        child: CustomSearchView(
                          onChanged: (value) {
                            controller.setSerching(value);
                          },
                          focusNode: FocusNode(),
                          hintText: "Search".tr,
                          margin: getMargin(left: 0, top: 20, right: 0),
                          prefix: Container(
                            margin: getMargin(
                                left: 20, top: 11, right: 13, bottom: 11),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgSearch),
                          ),
                          prefixConstraints:
                              BoxConstraints(maxHeight: getVerticalSize(46)),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: getPadding(top: 16),
                          itemCount:
                              employees.length, // Use filteredEmployees here
                          itemBuilder: (context, index) {
                            final employee =
                                employees[index]; // Get filtered employee
                            return _employee_list(
                                employee.nama.value,
                                employee.image.value,
                                employee.email.value,
                                employee.wa.value);
                          },
                        ),
                      ),
                    ],
                  ),
                ));
              })),
        ));
  }

  Widget _employee_list(name, image, email, wa) {
    return Column(
      children: [
        Container(
          margin: getMargin(top: 15),
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
          ),
          child: Padding(
            padding: getPadding(bottom: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomImageView(
                      url: image,
                      height: getVerticalSize(60),
                      width: getHorizontalSize(60),
                      radius: BorderRadius.circular(getHorizontalSize(60)),
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: getPadding(left: 15, top: 5, right: 5),
                      child: Container(
                        width:
                            getHorizontalSize(150), // Adjust width as necessary
                        child: Text(
                          name,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtOutfitBold20,
                          softWrap: true,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  Container(
                    child: Row(
                      children: [
                        // Text('${datalist['clock_in']}')
                        IconButton(
                          icon: Icon(Icons.phone,
                              size: getFontSize(24),
                              color: ColorConstant.indigo800),
                          onPressed: () {
                            _launchPhone(wa.toString().substring(1));
                          },
                        ),
                        SizedBox(width: getHorizontalSize(5)),
                        IconButton(
                          icon: Icon(Icons.email,
                              size: getFontSize(24),
                              color: ColorConstant.indigo800),
                          onPressed: () {
                            _launchMail(email);
                          },
                        ),
                        SizedBox(width: getHorizontalSize(5)),
                        IconButton(
                          icon: ImageIcon(
                            const AssetImage(
                              'assets/fastteam_image/whatsapp.png',
                            ),
                            color: ColorConstant.green600,
                            size: getFontSize(24),
                          ),
                          onPressed: () {
                            _launchWhatsapp(wa.toString().substring(1));
                          },
                        ),
                      ],
                    ),
                  ),
                ])
              ],
            ),
          ),
        ),
        Divider()
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
