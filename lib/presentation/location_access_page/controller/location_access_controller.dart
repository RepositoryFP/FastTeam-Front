import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/location_access_page/models/location_access_model.dart';

class LocationAccessController extends GetxController {
  LocationAccessController(this.locationAccessModelObj);

  Rx<LocationAccessModel> locationAccessModelObj;
bool locationSearch = false;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setLocationSearch(bool val) {
    locationSearch = val;
    update();
  }
}
