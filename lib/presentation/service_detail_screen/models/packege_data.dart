import 'package:fastteam_app/presentation/service_detail_screen/models/service_detail_model.dart';

class PackegeData{
  static List<ServiceDetailModel> getPackegeData(){
    return [
      ServiceDetailModel("Gold package","\$55.00",["Express Interior wash","Express exterior wash","Car wash"]),
      ServiceDetailModel("Silver Package","\$35.00",["Express Interior wash","Express exterior wash","Car wash"]),
      ServiceDetailModel("Platinum Package","\$120.00",["Express Interior wash","Express exterior wash","Car wash"]),
    ];
  }
}