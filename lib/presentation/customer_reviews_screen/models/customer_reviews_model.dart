import 'package:fastteam_app/core/app_export.dart';
import 'clientrevies_item_model.dart';

/// This class defines the variables used in the [customer_reviews_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CustomerReviewsModel {
static List<ClientreviesItemModel> getReview(){
 return [
  ClientreviesItemModel(ImageConstant.imgUser1st,"Ralph Edwards","Speed Car Wash is offering a wide range of washing services to the car owners"),
  ClientreviesItemModel(ImageConstant.imgUser2nd,"Ralph Edwards","Speed Car Wash is offering a wide range of washing services to the car owners"),
  ClientreviesItemModel(ImageConstant.imgUser3rd,"Ralph Edwards","Speed Car Wash is offering a wide range of washing services to the car owners"),
  ClientreviesItemModel(ImageConstant.imgUser4th,"Ralph Edwards","Speed Car Wash is offering a wide range of washing services to the car owners"),
  ClientreviesItemModel(ImageConstant.imgUser1st,"Ralph Edwards","Speed Car Wash is offering a wide range of washing services to the car owners"),
  ClientreviesItemModel(ImageConstant.imgUser1st,"Ralph Edwards","Speed Car Wash is offering a wide range of washing services to the car owners"),
  ClientreviesItemModel(ImageConstant.imgUser1st,"Ralph Edwards","Speed Car Wash is offering a wide range of washing services to the car owners"),
 ];
}
}
