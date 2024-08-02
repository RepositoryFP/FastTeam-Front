import '../controller/sertificate_controller.dart';
import 'package:get/get.dart';

class SertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SertificateController());
  }
}
