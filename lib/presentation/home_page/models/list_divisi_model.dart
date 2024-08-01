import 'package:get/get.dart';
import 'package:fastteam_app/data/models/selectionPopupModel/selection_popup_model.dart';

class ListDivisiModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "All",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "IT",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Sales",
    )
  ]);
}
