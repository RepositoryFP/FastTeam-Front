import 'package:fastteam_app/core/app_export.dart';import 'package:fastteam_app/presentation/customer_reviews_screen/models/customer_reviews_model.dart';class CustomerReviewsController extends GetxController {Rx<CustomerReviewsModel> customerReviewsModelObj = CustomerReviewsModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
