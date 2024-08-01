import 'package:fastteam_app/core/app_export.dart';

class FilterController extends GetxController {
int currentCategory = 0;
int currentRating = 0;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCategory(int index) {
    currentCategory = index;
    update();
  }

  void setRating(int index) {
    currentRating = index;
    update();
  }
}
