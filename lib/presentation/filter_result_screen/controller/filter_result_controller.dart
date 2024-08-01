import 'package:fastteam_app/core/app_export.dart';import 'package:fastteam_app/presentation/filter_result_screen/models/filter_result_model.dart';class FilterResultController extends GetxController {Rx<FilterResultModel> filterResultModelObj = FilterResultModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
 }
