import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;

  Rx<Country> selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('505').obs;

  @override
  void onReady() {
    super.onReady();
  }

}
