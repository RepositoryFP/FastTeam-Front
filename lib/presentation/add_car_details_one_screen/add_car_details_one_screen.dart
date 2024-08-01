import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'controller/add_car_details_one_controller.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:fastteam_app/widgets/custom_button.dart';
import 'package:fastteam_app/widgets/custom_drop_down.dart';
import 'package:fastteam_app/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore_for_file: must_be_immutable

class AddCarDetailsOneScreen extends StatefulWidget {
  const AddCarDetailsOneScreen({Key? key}) : super(key: key);

  @override
  State<AddCarDetailsOneScreen> createState() => _AddCarDetailsOneScreenState();
}

class _AddCarDetailsOneScreenState extends State<AddCarDetailsOneScreen> {
  List<XFile>? _image = [];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AddCarDetailsOneController controller = Get.put(AddCarDetailsOneController());
  final ImagePicker picker = ImagePicker();

  ///image method
  //  getImage(ImgSource source) async {
  //   var image =  await ImagePicker.pickImage(
  //       enableCloseButton: true,
  //       closeIcon: Icon(
  //         Icons.close,
  //         color: Colors.red,
  //         size: 12,
  //       ),
  //       context: context,
  //       source: source,
  //       barrierDismissible: true,
  //       cameraIcon: Icon(
  //         Icons.camera_alt,
  //         color: Colors.red,
  //       ),
  //       //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
  //       cameraText: Text(
  //         "From Camera",
  //         style: TextStyle(color: Colors.red),
  //       ),
  //       galleryText: Text(
  //         "From Gallery",
  //         style: TextStyle(color: Colors.blue),
  //       ));
  //   setState(() {
  //     image == null ? SizedBox() : _image.add(image);
  //   });
  // }
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor:ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray5001,
            appBar: CustomAppBar(
              height: getVerticalSize(81),
              leadingWidth: 40,
              leading: AppbarImage(
                  height: getSize(24),
                  width: getSize(24),
                  svgPath: ImageConstant.imgArrowleft,
                  margin: getMargin(left: 16, top: 29, bottom: 28),
                  onTap: () {
                    onTapArrowleft9();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_add_car_details".tr),
            ),
            body: SafeArea(
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      child: Container(
                          width: double.maxFinite,
                          margin: getMargin(top: 20),
                          padding: getPadding(all: 15),
                          decoration: AppDecoration.white,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("lbl_add_car_details".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtOutfitBold20),
                                CustomDropDown(
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    icon: Container(
                                        margin: getMargin(left: 30, right: 16),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgArrowdown)),
                                    hintText: "lbl_company_name".tr,
                                    margin: getMargin(left: 1, top: 15),
                                    items: controller.addCarDetailsOneModelObj
                                        .value.dropdownItemList.value,
                                    onChanged: (value) {
                                      controller.onSelected(value);
                                    }),
                                CustomDropDown(
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    icon: Container(
                                        margin: getMargin(left: 30, right: 16),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgArrowdown)),
                                    hintText: "lbl_model_name".tr,
                                    margin: getMargin(left: 1, top: 16),
                                    items: controller.addCarDetailsOneModelObj
                                        .value.dropdownItemList1.value,
                                    onChanged: (value) {
                                      controller.onSelected1(value);
                                    }),
                                CustomFloatingEditText(
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    controller:
                                        controller.vehiclenumberController,
                                    labelText: "lbl_vehicle_number".tr,
                                    hintText: "msg_enter_vehicle_number".tr,
                                    margin: getMargin(top: 16),
                                    textInputType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter valid number";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: getVerticalSize(34),
                                ),
                                GridView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: _image!.length + 1,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: getVerticalSize(83),
                                          crossAxisCount: 4,
                                          mainAxisSpacing: getHorizontalSize(20),
                                          crossAxisSpacing:
                                              getHorizontalSize(16)),
                                  itemBuilder: (context, index) {
                                    return Container(
                                        decoration:
                                            AppDecoration.fillGray200ImgBg,
                                        child: index == 0
                                            ? GestureDetector(
                                                onTap: () async {
                                                  // getImage(
                                                  //     ImgSource
                                                  //         .Gallery);

                                                  // picker
                                                  //     .pickImage(
                                                  //         source:
                                                  //             ImageSource.gallery)
                                                  //     .then((value) => (value) {
                                                  //           setState(() {
                                                  //             _image!.add(value);
                                                  //           });
                                                  //         });
                                                  XFile? file = await picker.pickImage(source: ImageSource.gallery);
                                                setState(() {
                                                  _image!.add(file!);
                                                });

                                                  print("sdsdsds=============${_image}");
                                                  // showDialog(
                                                  //   barrierDismissible: false,
                                                  //   context: context,
                                                  //   builder: (context) {
                                                  //     return AlertDialog(
                                                  //         insetPadding:
                                                  //             EdgeInsets.all(16),
                                                  //         shape: RoundedRectangleBorder(
                                                  //             borderRadius:
                                                  //                 BorderRadius.circular(
                                                  //                     20)),
                                                  //         contentPadding:
                                                  //             EdgeInsets.zero,
                                                  //         content: Container(
                                                  //             width: getHorizontalSize(
                                                  //                 396),
                                                  //             padding: getPadding(
                                                  //                 left: 0,
                                                  //                 top: 0,
                                                  //                 right: 0,
                                                  //                 bottom: 38),
                                                  //             decoration: AppDecoration
                                                  //                 .white
                                                  //                 .copyWith(
                                                  //                     borderRadius:
                                                  //                         BorderRadiusStyle
                                                  //                             .roundedBorder16),
                                                  //             child: Column(
                                                  //               mainAxisSize:
                                                  //                   MainAxisSize.min,
                                                  //               mainAxisAlignment:
                                                  //                   MainAxisAlignment
                                                  //                       .center,
                                                  //               children: [
                                                  //                 Align(
                                                  //                   alignment: Alignment.topRight,
                                                  //                   child: CustomImageView(
                                                  //                     onTap: (){Get.back();},
                                                  //                     margin: getMargin(top: 20,right: 16),
                                                  //                     height: getVerticalSize(20),
                                                  //                     width: getHorizontalSize(20),
                                                  //                     svgPath: ImageConstant.imgClose,
                                                  //                   ),
                                                  //                 ),
                                                  //                 Text(
                                                  //                   "Upload photos".tr,
                                                  //                   overflow:
                                                  //                       TextOverflow
                                                  //                           .ellipsis,
                                                  //                   textAlign:
                                                  //                       TextAlign.left,
                                                  //                   style: AppStyle
                                                  //                       .txtHeadline,
                                                  //                 ),
                                                  //                 Padding(
                                                  //                   padding: getPadding(
                                                  //                     left: 30,
                                                  //                     top: 28,
                                                  //                     right: 30,
                                                  //                     bottom: 2,
                                                  //                   ),
                                                  //                   child: Row(
                                                  //                     children: [
                                                  //                       Expanded(
                                                  //                         child:
                                                  //                             CustomButton(
                                                  //                           height:
                                                  //                               getVerticalSize(
                                                  //                             46,
                                                  //                           ),
                                                  //                           text:
                                                  //                               "camera",
                                                  //                           margin:
                                                  //                               getMargin(
                                                  //                             right: 10,
                                                  //                           ),
                                                  //                           onTap: () {
                                                  //                             getImage(
                                                  //                                 ImgSource
                                                  //                                     .Camera);
                                                  //                             Get.back();
                                                  //                           },
                                                  //                           variant:
                                                  //                               ButtonVariant
                                                  //                                   .OutlineIndigo800,
                                                  //                           shape: ButtonShape
                                                  //                               .RoundedBorder8,
                                                  //                           padding:
                                                  //                               ButtonPadding
                                                  //                                   .PaddingAll11,
                                                  //                           fontStyle:
                                                  //                               ButtonFontStyle
                                                  //                                   .OutfitBold18Indigo800,
                                                  //                         ),
                                                  //                       ),
                                                  //                       SizedBox(
                                                  //                         width:
                                                  //                             getHorizontalSize(
                                                  //                                 10),
                                                  //                       ),
                                                  //                       Expanded(
                                                  //                         child:
                                                  //                             CustomButton(
                                                  //                           onTap: () {
                                                  //                             getImage(
                                                  //                                 ImgSource
                                                  //                                     .Gallery);
                                                  //                             Get.back();
                                                  //                           },
                                                  //                           height:
                                                  //                               getVerticalSize(
                                                  //                             46,
                                                  //                           ),
                                                  //                           text:
                                                  //                               "Gallry",
                                                  //                           margin:
                                                  //                               getMargin(
                                                  //                             left: 10,
                                                  //                           ),
                                                  //                           shape: ButtonShape
                                                  //                               .RoundedBorder8,
                                                  //                           padding:
                                                  //                               ButtonPadding
                                                  //                                   .PaddingAll11,
                                                  //                           fontStyle:
                                                  //                               ButtonFontStyle
                                                  //                                   .SFProDisplayBold18,
                                                  //                         ),
                                                  //                       ),
                                                  //                     ],
                                                  //                   ),
                                                  //                 ),
                                                  //               ],
                                                  //             )));
                                                  //   },
                                                  // );
                                                },
                                                child: Padding(
                                                  padding: getPadding(
                                                      top: 17, bottom: 17),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgCameraIcon,
                                                      ),
                                                      Text("Upload Photo",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: AppStyle
                                                              .txtOutfitRegular12Black900)
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Stack(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: FileImage(File(
                                                                _image![index - 1].path)),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    8))),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          _image!.removeAt(
                                                              index - 1);
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: getMargin(
                                                            top: 5, right: 4),
                                                        height:
                                                            getVerticalSize(12),
                                                        width:
                                                            getHorizontalSize(12),
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: ColorConstant
                                                                .whiteA700),
                                                        child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgClose,
                                                          margin:
                                                              getMargin(all: 1),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ));
                                  },
                                ),

                                // _image != null ? Image.file(File(_image[0].path)) : Container(),
                                Spacer(),
                                CustomButton(
                                    height: getVerticalSize(54),
                                    text: "lbl_save".tr,
                                    margin: getMargin(bottom: 23),
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.addCarOpenInProfile
                                            ? Get.back()
                                            : onTapSave();
                                      }
                                    })
                              ])))),
            )),
      ),
    );
  }

  onTapSave() {
    Get.toNamed(
      AppRoutes.bookAWashScreen,
    );
  }

  onTapArrowleft9() {
    Get.back();
  }
}
