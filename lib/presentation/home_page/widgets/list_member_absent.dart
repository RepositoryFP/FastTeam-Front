import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/home_page/controller/home_controller.dart';
import 'package:fastteam_app/presentation/home_page/models/home_model.dart';
import 'package:fastteam_app/presentation/home_page/models/list_employee_absent_model.dart';
import 'package:fastteam_app/presentation/home_page/models/member_division_model.dart';
import 'package:fastteam_app/widgets/custom_drop_down.dart';
import 'package:fastteam_app/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

Widget listMemberAbsent(
    BuildContext context,
    List<MemberDivisionData> memberData,
    List<EmployeeAbsent> employees,
    Function(String) onSelected,
    int initialValue) {
  HomeController controller = Get.put(HomeController(HomeModel().obs));
  List<SelectionPopupModel> dropdownItemList1 = [
    SelectionPopupModel(
      id: 0,
      title: "All",
      isSelected: true,
    ),
    ...controller.departments.map((division) => SelectionPopupModel(
          id: division.id,
          title: division.name,
        )),
  ];

  String selectedValue = dropdownItemList1
    .firstWhere((element) => element.id == initialValue)
    .id.toString();

  return Container(
    width: double.maxFinite,
    decoration: AppDecoration.white,
    child: Column(
      children: [
        Padding(
          padding: getPadding(left: 20, right: 20, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "List Absent",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtHeadline,
              ),
            ],
          ),
        ),
        Padding(
          padding: getPadding(left: 20, bottom: 10, right: 20),
          child: Container(
            margin: getMargin(top: 20),
            padding: getPadding(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getHorizontalSize(8)),
              border: Border.all(color: ColorConstant.gray300),
            ),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return DropdownButton<String>(
                  isExpanded: true,
                  value: selectedValue,
                  items: dropdownItemList1.map((SelectionPopupModel item) {
                    
                    return DropdownMenuItem<String>(
                      value: item.id.toString(),
                      child: Text(
                        item.title,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!; // Update selectedValue
                    });
                    onSelected(
                        newValue!); // Panggil onSelected dengan nilai baru
                  },
                );
              },
            ),
          ),
        ),
        Padding(
          padding: getPadding(left: 20, bottom: 10, right: 20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: getPadding(top: 0),
            itemCount: employees.length,
            itemBuilder: (context, index) {
              final employee = employees[index];
              return _listEmployee(
                employee.image,
                employee.nama,
                employee.divisi,
                employee.clockIn,
                employee.clockOut,
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _listEmployee(String? image, String name, String divisi, int clock_in, int clock_out){
  return Container(
    margin: getMargin(top: 15),
    decoration: BoxDecoration(
      color: ColorConstant.whiteA700,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: ColorConstant.gray300),
    ),
    child: Padding(
      padding: getPadding(top: 10, bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomImageView(
                url: image,
                height: getVerticalSize(60),
                width: getHorizontalSize(60),
                radius: BorderRadius.circular(getHorizontalSize(60)),
                alignment: Alignment.center,
              ),
              SizedBox(width: 10), // Add some space between the image and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                    width: getHorizontalSize(200),
                    child: Text(
                      name,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSubheadline,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, bottom: 5, right: 5),
                    child: Text(
                      divisi,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtOutfitRegular12Black900,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.input, color: clock_in == 1 ? ColorConstant.green600 : ColorConstant.gray300),
              SizedBox(width: 8),
              Icon(Icons.output, color: clock_out == 1 ? ColorConstant.green600 : ColorConstant.gray300),
            ],
          ),
        ],
      ),
    ),
  );
}
