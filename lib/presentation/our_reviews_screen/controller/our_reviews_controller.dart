import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/our_reviews_screen/models/our_reviews_model.dart';
import 'package:flutter/material.dart';

class OurReviewsController extends GetxController {
  TextEditingController englishtextController = TextEditingController();

  Rx<OurReviewsModel> ourReviewsModelObj = OurReviewsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    englishtextController.dispose();
  }
}
