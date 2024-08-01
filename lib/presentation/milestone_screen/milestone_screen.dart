import 'package:fastteam_app/core/utils/color_constant.dart';
import 'package:fastteam_app/core/utils/image_constant.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/presentation/milestone_screen/controller/milestone_controller.dart';
import 'package:fastteam_app/routes/app_routes.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MilestoneScreen extends StatefulWidget {
  const MilestoneScreen({super.key});

  @override
  State<MilestoneScreen> createState() => _MilestoneScreenState();
}

class _MilestoneScreenState extends State<MilestoneScreen> {
  MilestoneController controller = Get.put(MilestoneController());

  @override
  void initState() {
    super.initState();
    controller.retrieveJobHistory();
  }

  // initData() async {
  //   milestoneController = Get.put(MilestoneController());
  //   var result = await milestoneController!.retrieveJobHistory();

  //   setState(() {
  //     arrayData = result['details'];
  //     isLoading = false;
  //   });
  // }

  List<Color> colors = [Colors.purple, Colors.red, Colors.yellow, Colors.green];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Theme.of(context);
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
          title: AppbarTitle(text: "Milestone".tr),
        ),
        body: Padding(
          padding: getPadding(top: 0, bottom: 0),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            return controller.arrayData.isEmpty
                ? _noNotifications()
                : ListView.builder(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.arrayData.length,
                    itemBuilder: (context, index) {
                      DateTime dateTime = DateTime.parse(
                          controller.arrayData[index]['start_date'].toString());
                      DateFormat formatter = DateFormat('dd MMMM yyyy');
                      String formattedMonthYear = formatter.format(dateTime);
                      Color color = colors[index % colors.length];
                      return Column(
                        children: [
                          (index % 2 == 0)
                              ? _leftMilestone(
                                  (index == controller.arrayData.length - 1)
                                      ? true
                                      : false,
                                  (index == 0) ? true : false,
                                  formattedMonthYear,
                                  controller.arrayData[index]['pegawai']
                                      ['nama_lengkap'],
                                  controller.arrayData[index]['title'],
                                  controller.arrayData[index]['job_level']
                                      ['name'],
                                  controller.arrayData[index]['position']
                                      ['name'],
                                  controller.arrayData[index]['salary'],
                                  color)
                              : _rightMilestone(
                                  (index == controller.arrayData.length)
                                      ? true
                                      : false,
                                  formattedMonthYear,
                                  controller.arrayData[index]['pegawai']
                                      ['nama_lengkap'],
                                  controller.arrayData[index]['title'],
                                  controller.arrayData[index]['job_level']
                                      ['name'],
                                  controller.arrayData[index]['position']
                                      ['name'],
                                  controller.arrayData[index]['salary'],
                                  color),
                        ],
                      );
                    });
          }),
        ),
      ),
    );
  }

  Widget _rightMilestone(
      last, date, name, title, job, position, salary, Color colors) {
    return Column(
      children: [
        SizedBox(
          height: getVerticalSize(180),
          child: TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.9,
            beforeLineStyle: LineStyle(
              color: colors,
              thickness: 6,
            ),
            isLast: last,
            startChild: Container(
                margin: getMargin(top: 10, bottom: 10, left: 10, right: 5),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                  borderRadius:
                      BorderRadius.all(Radius.circular(getHorizontalSize(10))),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: getPadding(left: 5, right: 5, top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          date,
                        ),
                      ),
                      SizedBox(height: getVerticalSize(5)),
                      Text(
                        name != null ? name : '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        title ?? 'Judul Tidak Ada',
                      ),
                      SizedBox(height: getVerticalSize(10)),
                      Row(children: [
                        Column(
                          children: [
                            const Icon(Icons.work),
                            SizedBox(height: getVerticalSize(2)),
                            Icon(MdiIcons.sitemap),
                            SizedBox(height: getVerticalSize(2)),
                            Icon(MdiIcons.cashMultiple),
                          ],
                        ),
                        SizedBox(
                          width: getHorizontalSize(5),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(job),
                            SizedBox(height: getVerticalSize(5)),
                            Text(position),
                            SizedBox(height: getVerticalSize(5)),
                            Text(salary),
                          ],
                        ),
                      ]),
                    ],
                  ),
                )),
            indicatorStyle: IndicatorStyle(
              width: getHorizontalSize(20),
              color: colors,
            ),
          ),
        ),
        (!last)
            ? TimelineDivider(
                begin: 0.1,
                end: 0.9,
                thickness: 6,
                color: colors,
              )
            : Container(),
      ],
    );
  }

  Widget _leftMilestone(
      last, first, date, name, title, job, position, salary, Color colors) {
    return Column(
      children: [
        SizedBox(
          height: getVerticalSize(220),
          child: TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: first,
            isLast: last,
            indicatorStyle: IndicatorStyle(
              width: getHorizontalSize(20),
              color: colors,
            ),
            endChild: Container(
                margin: getMargin(top: 10, bottom: 10, right: 10, left: 5),
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
                  borderRadius:
                      BorderRadius.all(Radius.circular(getHorizontalSize(10))),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: getPadding(left: 5, right: 5, top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          date,
                        ),
                      ),
                      SizedBox(height: getVerticalSize(5)),
                      Text(
                        name != null ? name : '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        title ?? 'Judul Tidak Ada',
                      ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Row(children: [
                        Column(
                          children: [
                            const Icon(Icons.work),
                            SizedBox(height: getVerticalSize(2)),
                            Icon(MdiIcons.sitemap),
                            SizedBox(height: getVerticalSize(2)),
                            Icon(MdiIcons.cashMultiple),
                          ],
                        ),
                        SizedBox(
                          width: getHorizontalSize(5),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(job),
                            SizedBox(height: getVerticalSize(5)),
                            Text(position),
                            SizedBox(height: getVerticalSize(5)),
                            Text(salary),
                          ],
                        ),
                      ]),
                    ],
                  ),
                )),
            beforeLineStyle: LineStyle(
              color: colors,
              thickness: 6,
            ),
          ),
        ),
        (!last)
            ? TimelineDivider(
                begin: 0.1,
                end: 0.9,
                thickness: 6,
                color: colors,
              )
            : Container(),
      ],
    );
  }

  Widget _noNotifications() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
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
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            'There is no data',
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }

  onTapArrowleft11() {
    Get.toNamed(AppRoutes.homeContainerScreen);
  }
}
