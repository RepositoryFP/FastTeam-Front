import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/location_with_select_one_screen/models/location_with_select_one_model.dart';

class LocationWithSelectOneController extends GetxController {
  Rx<LocationWithSelectOneModel> locationWithSelectOneModelObj =
      LocationWithSelectOneModel().obs;
bool isNavigate = false;
  @override
  void onReady() {
    super.onReady();
  }


  void setDetailNavigationIsHome(bool val) {
    isNavigate = val;
    update();
  }
}
