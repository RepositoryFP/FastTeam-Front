import '../controller/booking_upcoming_controller.dart';
import 'package:get/get.dart';

class BookingUpcomingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingUpcomingController());
  }
}
