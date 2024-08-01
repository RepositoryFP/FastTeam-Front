import 'package:flutter/services.dart';

import '../../widgets/app_bar/custum_bottom_bar_controller.dart';
import '../booking_details_screen/booking_details_screen.dart';
import 'models/booking_item_model.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'models/booking_upcoming_model.dart';


class BookingUpcomingScreen extends StatefulWidget {
  const BookingUpcomingScreen({Key? key}) : super(key: key);

  @override
  State<BookingUpcomingScreen> createState() => _BookingUpcomingScreenState();
}

class _BookingUpcomingScreenState extends State<BookingUpcomingScreen> {
  List<BookingItemModel> booking = BookingUpcomingModel.getBookingDAta();
  CustomBottomBarController custumBottom = Get.put(CustomBottomBarController());
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.gray5001,
          appBar: CustomAppBar(
              height: getVerticalSize(81),
              leadingWidth: 40,
              leading: AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 16, top: 29, bottom: 28),
                  onTap: () {
                    custumBottom.getIndex(0);
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_my_booking".tr),
              styleType: Style.bgFillWhiteA700),
          body: Container(
              margin: getMargin(top: 8),
              padding: getPadding(all: 16),
              decoration: AppDecoration.white,
              child: Container(
                child: ListView.builder(
                    shrinkWrap: false,
                    primary: true,
                    itemCount: booking.length,
                    itemBuilder: (context, index) {
                      BookingItemModel model = booking[index];
                      return Padding(padding: getPadding(top: 8,bottom: 8),child: BookingItemWidget(model));
                    }),
              )),
        ));
  }

  onTapRowrectangle398() {
    Get.toNamed(AppRoutes.bookingDetailsScreen);
  }

  onTapArrowleft15() {
    Get.back();
  }

  Widget BookingItemWidget(BookingItemModel model) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    return GestureDetector(
      onTap: () {

        Get.to(BookingDetailsScreen(model: model));
      },
      child: Container(
        color: ColorConstant.whiteA700,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: getSize(
                    96,
                  ),
                  width: getSize(
                    96,
                  ),
                  padding: getPadding(
                    left: 8,
                    top: 0,
                    right: 8,
                    bottom: 0,
                  ),
                  decoration: AppDecoration.fillGray5001.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                  ),
                  child: Stack(
                    children: [
                      CustomImageView(
                        imagePath: model.image,
                        height: getVerticalSize(
                          40,
                        ),
                        width: getHorizontalSize(
                          80,
                        ),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getHorizontalSize(16),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      model.name!,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSubheadline,
                    ),
                    Padding(
                      padding: getPadding(
                        top: 14,
                      ),
                      child: Text(
                        model.price!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtBody,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: getPadding(top: 17, bottom: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.date!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFProDisplayRegular14.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.14,
                      ),
                    ),
                  ),
                  SizedBox(height: getVerticalSize(7),),
                  Container(
                    height: getVerticalSize(
                      34,
                    ),
                    width: getHorizontalSize(
                      100,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(37),
                        ),
                        color: model.status!.toLowerCase() == "completed"
                            ? ColorConstant.lightGreen50
                            : model.status!.toLowerCase() == "cancelled"
                            ? ColorConstant.red50
                            : ColorConstant.yellow50),
                    child: Center(
                      child: Text(
                        model.status!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: model.status!.toLowerCase() == "completed"
                            ? AppStyle.txtBodyGreen600.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.14,
                          ),
                        )
                            : model.status!.toLowerCase() == "cancelled"
                            ? AppStyle.txtBodyRed.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.14,
                          ),
                        )
                            : AppStyle.txtBodyYellow600.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}















