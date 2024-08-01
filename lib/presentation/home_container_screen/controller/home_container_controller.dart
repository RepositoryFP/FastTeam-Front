import 'package:fastteam_app/core/app_export.dart';import 'package:fastteam_app/presentation/home_container_screen/models/home_container_model.dart';class HomeContainerController extends GetxController {Rx<HomeContainerModel> homeContainerModelObj = HomeContainerModel().obs;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
@override void onInit() {
  super.onInit();
  }
 }
