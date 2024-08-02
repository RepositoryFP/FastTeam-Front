import 'package:get/get.dart';import 'reset_password_item_model.dart';/// This class defines the variables used in the [reset_password_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ResetPasswordModel {Rx<List<ResetPasswordItemModel>> resetPasswordItemList = Rx(List.generate(2,(index) => ResetPasswordItemModel()));

 }
