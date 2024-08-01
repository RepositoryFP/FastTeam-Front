import 'package:fastteam_app/core/app_export.dart';

import 'my_vehicle_model.dart';

class MyVehicleData{
  static List<MyVehicleModel> getMyVehicle(){
    return [
      MyVehicleModel(ImageConstant.imgMyVehicle1st,"Maruti Swift"),
      MyVehicleModel(ImageConstant.imgMyVehicle2nd,"Hyundai Aura"),
    ];
  }
}