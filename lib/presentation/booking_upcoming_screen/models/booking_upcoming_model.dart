import 'package:fastteam_app/core/app_export.dart';
import 'booking_item_model.dart';

/// This class defines the variables used in the [booking_upcoming_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BookingUpcomingModel {
  // Rx<List<BookingItemModel>> bookingItemList =
  //     Rx(List.generate(3, (index) => BookingItemModel()));

  static List<BookingItemModel> getBookingDAta(){
    return [
      BookingItemModel(ImageConstant.imgBooking1st,"Superior Auto Steam","\$80.00","25-02-2022","Completed"),
      BookingItemModel(ImageConstant.imgBooking2nd,"Ace car wash","\120.00","25-02-2022","Pending"),
      BookingItemModel(ImageConstant.imgBooking3rd,"NY Car Spa","\$60.00","25-02-2022","Cancelled"),
    ];
  }
}
