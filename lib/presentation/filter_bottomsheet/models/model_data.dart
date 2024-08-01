import 'filter_model.dart';

class ModelData{
  static List<FilterModel> getCategory(){
    return [
      FilterModel("Car wash"),
      FilterModel("Detailing"),
      FilterModel("Interior Cleaning"),
      FilterModel("Exterior washing"),
    ];
  }

  static List<RatingModel> getRating(){
    return [
      RatingModel("5.0"),
      RatingModel("4.0"),
      RatingModel("3.0"),
      RatingModel("2.0"),
    ];
  }
}