import 'package:fastteam_app/presentation/home_page/models/member_division_model.dart';
import 'package:fastteam_app/presentation/home_page/models/populer_center_model.dart';
import 'package:fastteam_app/presentation/home_page/models/recommended_model.dart';
import 'package:fastteam_app/presentation/home_page/models/top_rated_model.dart';
import '../../../core/utils/image_constant.dart';
import 'slidergroup_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {
 static List<SlidergroupItemModel> getSlider(){
  return [
   SlidergroupItemModel(ImageConstant.imgSlider1st,"On first cleaning service","25"),
   SlidergroupItemModel(ImageConstant.imgSlider2nd,"On first cleaning service","25"),
   SlidergroupItemModel(ImageConstant.imgSlider3rd,"On first cleaning service","25"),
  ];
 }
 static List<MemberDivisionData> getMemberDivision(){
  return [
   MemberDivisionData(ImageConstant.avatarPict),
   MemberDivisionData(ImageConstant.avatarPict),
   MemberDivisionData(ImageConstant.avatarPict),
   MemberDivisionData(ImageConstant.avatarPict),
   MemberDivisionData(ImageConstant.avatarPict),
  ];
 }


 static List<PopulerCenterData> getPopulerData(){
  return [
   PopulerCenterData(ImageConstant.imgPopularCenter1st,"Ace Car Wash","3.7","5.0"),
   PopulerCenterData(ImageConstant.imgPopularCenter2nd,"Touchless Wash","4.7","5.0"),
   PopulerCenterData(ImageConstant.imgPopularCenter3rd,"A-1 Quick Wash","5.7","5.0"),
   PopulerCenterData(ImageConstant.imgPopularCenter4th,"Fast Finish Car","8.7","5.0"),
   PopulerCenterData(ImageConstant.imgPopularCenter5th,"Extreme Car Wash","6.7","5.0"),
   PopulerCenterData(ImageConstant.imgPopularCenter6th,"Wash & Shine","6.2","5.0"),
   PopulerCenterData(ImageConstant.imgPopularCenter7th,"Ace Car Wash","3.7","5.0"),
   PopulerCenterData(ImageConstant.imgPopularCenter8th,"Touchless Wash","4.7","5.0"),
  ];
 }

 static List<RecommendedCenterData> getRecommendedData(){
  return [
   RecommendedCenterData(ImageConstant.imgRecommended1th,"Car Wash ABC","9.8","5.0"),
   RecommendedCenterData(ImageConstant.imgRecommended2nd,"A Clean Slate","6.5","5.0"),
   RecommendedCenterData(ImageConstant.imgRecommended3rd,"Cashmere Car Wash","3.9","5.0"),
   RecommendedCenterData(ImageConstant.imgRecommended4th,"Diamonds Washes","4.4","5.0"),
   RecommendedCenterData(ImageConstant.imgRecommended5th,"Clear Car Wash","2.5","5.0"),
   RecommendedCenterData(ImageConstant.imgRecommended6th,"Speedy Wash","5.1","5.0"),
   RecommendedCenterData(ImageConstant.imgRecommended7th,"Ace Car Wash","3.7","5.0"),
   RecommendedCenterData(ImageConstant.imgRecommended8th,"Touchless Wash","4.7","5.0"),
  ];
 }

 static List<TopRatedData> getTopRatedData(){
  return [


   TopRatedData(ImageConstant.imgTopRated1st,"Superior Auto Steam","5.1","5.0","150"),
   TopRatedData(ImageConstant.imgTopRated2nd,"NY Car Spa","3.7","5.0","150"),
   TopRatedData(ImageConstant.imgRecommended8th,"Touchless Wash","4.7","5.0","150"),
   TopRatedData(ImageConstant.imgRecommended1th,"Car Wash ABC","9.8","5.0","150"),
   TopRatedData(ImageConstant.imgRecommended2nd,"A Clean Slate","6.5","5.0","150"),
   TopRatedData(ImageConstant.imgRecommended3rd,"Cashmere Car Wash","3.9","5.0","150"),
   TopRatedData(ImageConstant.imgRecommended4th,"Diamonds Washes","4.4","5.0","150"),
   TopRatedData(ImageConstant.imgRecommended5th,"Clear Car Wash","2.5","5.0","150"),
  ];
 }
}
