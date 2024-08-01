import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/home_page/models/list_employee_absent_model.dart';
import 'package:fastteam_app/presentation/home_page/models/member_division_model.dart';
import 'package:fastteam_app/widgets/custom_drop_down.dart';
import 'package:fastteam_app/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

Widget listMemberAbsent(BuildContext context,
    List<MemberDivisionData> memberData, List<EmployeeAbsent> employees) {
  List<SelectionPopupModel> dropdownItemList1 = [
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
  ];

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
          child: CustomDropDown(
            focusNode: FocusNode(),
            autofocus: true,
            icon: Container(
              margin: getMargin(left: 30, right: 16),
              child: CustomImageView(
                svgPath: ImageConstant.imgArrowdown,
              ),
            ),
            hintText: "Filter Divisi".tr,
            margin: getMargin(left: 1, top: 15),
            items: dropdownItemList1,
            onChanged: (value) {
              // Implement the logic for filtering based on division
            },
          ),
        ),
        Padding(
          padding: getPadding(left: 20,  bottom: 10, right: 20),
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
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _listEmployee(String? image, String name, String divisi) {
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
              Icon(Icons.input, color: ColorConstant.gray300),
              SizedBox(width: 8),
              Icon(Icons.output, color: ColorConstant.gray300),
            ],
          ),
        ],
      ),
    ),
  );
}
