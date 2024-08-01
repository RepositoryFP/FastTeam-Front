// import '../controller/booking_upcoming_controller.dart';
// import '../models/booking_item_model.dart';
// import 'package:fastteam_app/core/app_export.dart';
// import 'package:fastteam_app/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
//
// // ignore: must_be_immutable
// class BookingItemWidget extends StatefulWidget {
//   BookingItemWidget(
//     this.bookingItemModelObj);
//
//   BookingItemModel bookingItemModelObj;
//
//   VoidCallback? onTapRowrectangle398;
//
//   @override
//   State<BookingItemWidget> createState() => _BookingItemWidgetState();
// }
//
// class _BookingItemWidgetState extends State<BookingItemWidget> {
//   var controller = Get.find<BookingUpcomingController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Get.toNamed(AppRoutes.bookingDetailsScreen);
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Card(
//             clipBehavior: Clip.antiAlias,
//             elevation: 0,
//             margin: EdgeInsets.all(0),
//             color: ColorConstant.gray5001,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadiusStyle.roundedBorder16,
//             ),
//             child: Container(
//               height: getSize(
//                 96,
//               ),
//               width: getSize(
//                 96,
//               ),
//               padding: getPadding(
//                 left: 8,
//                 top: 28,
//                 right: 8,
//                 bottom: 28,
//               ),
//               decoration: AppDecoration.fillGray5001.copyWith(
//                 borderRadius: BorderRadiusStyle.roundedBorder16,
//               ),
//               child: Stack(
//                 children: [
//                   CustomImageView(
//                     imagePath: widget.bookingItemModelObj.image,
//                     height: getVerticalSize(
//                       40,
//                     ),
//                     width: getHorizontalSize(
//                       80,
//                     ),
//                     alignment: Alignment.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: getPadding(
//               left: 16,
//               top: 22,
//               bottom: 20,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.bookingItemModelObj.name!,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.left,
//                   style: AppStyle.txtSubheadline,
//                 ),
//                 Padding(
//                   padding: getPadding(
//                     top: 14,
//                   ),
//                   child: Text(
//                     widget.bookingItemModelObj.price!,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.left,
//                     style: AppStyle.txtBody,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding: getPadding(
//               top: 18,
//               bottom: 17,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.bookingItemModelObj.date!,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.left,
//                   style: AppStyle.txtSFProDisplayRegular14.copyWith(
//                     letterSpacing: getHorizontalSize(
//                       0.14,
//                     ),
//                   ),
//                 ),
//                 CustomButton(
//                   height: getVerticalSize(
//                     34,
//                   ),
//                   width: getHorizontalSize(
//                     100,
//                   ),
//                   text: "lbl_completed".tr,
//                   margin: getMargin(
//                     top: 9,
//                   ),
//                   variant: ButtonVariant.FillLightgreen50,
//                   padding: ButtonPadding.PaddingAll7,
//                   fontStyle: ButtonFontStyle.OutfitSemiBold16,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
