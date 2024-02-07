import 'package:Fast_Team/style/color_theme.dart';
import 'package:Fast_Team/widget/refresh_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class ListAbsentPage extends StatefulWidget {
  const ListAbsentPage({super.key});

  @override
  State<ListAbsentPage> createState() => _ListAbsentPageState();
}

class _ListAbsentPageState extends State<ListAbsentPage> {
  List<dynamic>? routeArguments;
  DateTime selectedDate = DateTime.now();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initData();
  }

  initData() async {
    setState(() {
      routeArguments =
          ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
    });
  }

  _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDate = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(selectedDate);
    return Scaffold(
        appBar: AppBar(
          title: Text('Member Division'),
        ),
        body: Container(
          // margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              _calendar(),
              _listMember(),
            ],
          ),
        ));
  }

  Widget _calendar() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 54, 165, 255),
        borderRadius: BorderRadius.circular(20.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CalendarCarousel(
        onDayPressed: (DateTime date, List events) {
          this.setState(() => selectedDate = date);
        },
        locale: 'id_ID',
        prevDaysTextStyle: TextStyle(
          color: ColorsTheme.lightGrey3,
        ),
        daysTextStyle: TextStyle(
          color: ColorsTheme.white,
        ),
        nextDaysTextStyle: TextStyle(
          color: ColorsTheme.lightGrey3,
        ),
        weekendTextStyle: TextStyle(
          color: ColorsTheme.white,
        ),
        weekdayTextStyle: TextStyle(
          color: ColorsTheme.whiteCream,
          fontSize: 15.sp,
        ),
        headerTextStyle: TextStyle(
          color: ColorsTheme.white,
          fontSize: 18.sp,
        ),
        selectedDayTextStyle: TextStyle(
          color: ColorsTheme.primary,
        ),
        todayTextStyle: TextStyle(
          color: ColorsTheme.primary,
        ),
        todayBorderColor: ColorsTheme.white!,
        todayButtonColor: ColorsTheme.white!,
        selectedDayButtonColor: ColorsTheme.semiGreen!,
        iconColor: ColorsTheme.white!,
        thisMonthDayBorderColor: ColorsTheme.whiteCream!,
        weekFormat: false,
        height: 380.w,
        selectedDateTime: selectedDate,
        daysHaveCircularBorder: true,
      ),
    );
  }

  Widget _listMember() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Color(0xFF42A5F5), Color(0xFF1976D2), Color(0xFF0D47A1)],
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight,
        //   ),
        //   borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        // ),
        child: RefreshWidget(
          onRefresh: () => initData(),
          child: ListView.builder(
            itemCount: routeArguments!.length,
            itemBuilder: (context, index) {
              final employee = routeArguments![index];
              return Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.w),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8.w),
                      leading: CachedNetworkImage(
                        imageUrl: employee['image'],
                        imageBuilder: (context, imageProvider) => ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CircleAvatar(
                            radius: 30.r,
                            backgroundImage: imageProvider,
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            employee['nama'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            employee['divisi'],
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    MdiIcons.clockTimeSevenOutline,
                                    size: 18.sp,
                                    color: ColorsTheme.lightGreen,
                                  ),
                                  Text(
                                    '${employee['clock_in']}',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 4.w),
                              Row(
                                children: [
                                  Icon(
                                    MdiIcons.clockTimeFourOutline,
                                    size: 18.sp,
                                    color: ColorsTheme.lightYellow,
                                  ),
                                  Text(
                                    '${employee['clock_out']}',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.w,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
