import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/profile_screen/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel> profileModelObj = ProfileModel().obs;
bool  isNavigatInProfile = false;

var fullNama= ''.obs;
  var namaDivisi = ''.obs;
  var imgUrl = ''.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setPamentMethodNavigation(bool val) {
    isNavigatInProfile = val;
    update();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fullNama.value = prefs.getString('nama') ?? '';
    
    imgUrl.value = prefs.getString('user-img_url') ?? '';

    print(prefs.getString('nama'));
  }
}
