import 'package:fastteam_app/core/app_export.dart';

class Onboarding1Controller extends GetxController {
  // Rx<Onboarding1Model> onboarding1ModelObj = Onboarding1Model().obs;

  Rx<int> silderIndex = 0.obs;
  int currentPage = 0;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void setCurrentPage(int value) {
    currentPage = value;
    update();
  }
}
