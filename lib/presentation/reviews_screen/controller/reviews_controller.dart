import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/reviews_screen/models/reviews_model.dart';

class ReviewsController extends GetxController {
  Rx<ReviewsModel> reviewsModelObj = ReviewsModel().obs;
int currentReviewId = 1;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setCurrentReviewId(int i) {
    currentReviewId = i;
    update();
  }
}
