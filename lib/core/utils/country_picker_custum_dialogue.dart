import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';


import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_search_view.dart';
import '../phone_field/countries.dart';
import '../phone_field/helpers.dart';

class PickerDialogStyle {
  final Color? backgroundColor;

  final TextStyle? countryCodeStyle;

  final TextStyle? countryNameStyle;

  final Widget? listTileDivider;

  final EdgeInsets? listTilePadding;

  final EdgeInsets? padding;

  final Color? searchFieldCursorColor;

  final InputDecoration? searchFieldInputDecoration;

  final EdgeInsets? searchFieldPadding;

  final double? width;

  PickerDialogStyle({
    this.backgroundColor,
    this.countryCodeStyle,
    this.countryNameStyle,
    this.listTileDivider,
    this.listTilePadding,
    this.padding,
    this.searchFieldCursorColor,
    this.searchFieldInputDecoration,
    this.searchFieldPadding,
    this.width,
  });
}

class CountryPickerDialog extends StatefulWidget {
  final List<Country> countryList;
  final Country selectedCountry;
  final ValueChanged<Country> onCountryChanged;
  final String searchText;
  final List<Country> filteredCountries;
  final PickerDialogStyle? style;

  CountryPickerDialog({
    Key? key,
    required this.searchText,
    required this.countryList,
    required this.onCountryChanged,
    required this.selectedCountry,
    required this.filteredCountries,
    this.style,
  }) : super(key: key);

  @override
  _CountryPickerDialogState createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  late List<Country> _filteredCountries;
  late Country _selectedCountry;

  @override
  void initState() {
    _selectedCountry = widget.selectedCountry;
    _filteredCountries = widget.filteredCountries;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray5001,
      appBar: CustomAppBar(
        height: getVerticalSize(82),
        leadingWidth: 40,
        leading: AppbarImage(
            height: getSize(24),
            width: getSize(24),
            svgPath: ImageConstant.imgArrowleft,
            margin: getMargin(left: 16, top: 29, bottom: 28),
            onTap: () {
              Get.back();
            }),
        centerTitle: true,
        title: AppbarTitle(text: "City selection"),

      ),

      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: getVerticalSize(4),),
            Padding(
              padding: getPadding(left: 16,right: 16),
              child: CustomSearchView(

                onChanged: (value) {
                  _filteredCountries = isNumeric(value)
                      ? widget.countryList
                      .where((country) => country.dialCode.contains(value))
                      .toList()
                      : widget.countryList
                      .where((country) => country.name
                      .toLowerCase()
                      .contains(value.toLowerCase()))
                      .toList();
                  if (this.mounted) setState(() {});
                },
                  focusNode: FocusNode(),
                  autofocus: true,
                  // controller: controller.searchController,
                  hintText: "msg_search_for_your".tr,
                  margin: getMargin(left: 0, top: 20, right: 0),
                  prefix: Container(
                      margin: getMargin(
                          left: 20, top: 11, right: 13, bottom: 11),
                      child: CustomImageView(
                          svgPath: ImageConstant.imgSearch)),
                  prefixConstraints:
                  BoxConstraints(maxHeight: getVerticalSize(46)),
                ),
            ),

            // Padding(
            //   padding: widget.style?.searchFieldPadding ?? EdgeInsets.all(0),
            //   child: TextFormField(
            //     cursorColor: widget.style?.searchFieldCursorColor,
            //     decoration: widget.style?.searchFieldInputDecoration ??
            //         InputDecoration(
            //           disabledBorder: InputBorder.none,
            //           contentPadding: EdgeInsets.zero,
            //           focusedErrorBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(getHorizontalSize(16))),
            //             borderSide: BorderSide(
            //               color: ColorConstant.red,
            //               width: 1,
            //             ),
            //           ),
            //           enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(getHorizontalSize(16))),
            //             borderSide: BorderSide(
            //               color: ColorConstant.gray300,
            //               width: 1,
            //             ),),
            //           hintText:"Phone number",
            //           hintStyle:  TextStyle(
            //             color:ColorConstant.gray600,
            //             fontSize: getFontSize(
            //               17,
            //             ),
            //             fontFamily: 'Outfit',
            //             fontWeight: FontWeight.w400,
            //           ),
            //           prefixIcon: Container(
            //             margin: getMargin(
            //               left: 20,
            //               top: 11,
            //               right: 13,
            //               bottom: 11,
            //             ),
            //             child: CustomImageView(
            //               svgPath: ImageConstant.imgSearch,
            //             ),
            //           ),
            //           prefixIconConstraints: BoxConstraints(
            //             maxHeight: getVerticalSize(
            //               46,
            //             ),
            //           ),
            //
            //           labelText: widget.searchText,
            //         ),
            //     onChanged: (value) {
            //       _filteredCountries = isNumeric(value)
            //           ? widget.countryList
            //           .where((country) => country.dialCode.contains(value))
            //           .toList()
            //           : widget.countryList
            //           .where((country) => country.name
            //           .toLowerCase()
            //           .contains(value.toLowerCase()))
            //           .toList();
            //       if (this.mounted) setState(() {});
            //     },
            //   ),
            // ),
            SizedBox(height: getVerticalSize(20)),
            Expanded(
              child: Container(
                decoration: AppDecoration.white,
                child: ListView.builder(
                  padding: getPadding(left: 16,right: 16),
                  shrinkWrap: true,
                  itemCount: _filteredCountries.length,
                  itemBuilder: (ctx, index) =>

                      GestureDetector(
                        onTap: (){
                          _selectedCountry = _filteredCountries[index];
                          widget.onCountryChanged(_selectedCountry);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: ColorConstant.gray300))
                          ),
                          child: Padding(
                            padding: getPadding(top: 13,bottom: 13),
                            child: Text( _filteredCountries[index].name,style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                16,
                              ),
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                            ),),
                          ),
                        ),
                      ),

                  //     Column(
                  //   children: <Widget>[
                  //
                  //
                  //     ListTile(
                  //
                  //       leading: Image.asset(
                  //         'assets/flags/${_filteredCountries[index].code.toLowerCase()}.png',
                  //         package: 'intl_phone_field',
                  //         width: 32,
                  //       ),
                  //       contentPadding: widget.style?.listTilePadding,
                  //       title: Text(
                  //         _filteredCountries[index].name,
                  //         style: widget.style?.countryNameStyle ??
                  //             TextStyle(fontWeight: FontWeight.w700),
                  //       ),
                  //       trailing: Text(
                  //         '+${_filteredCountries[index].dialCode}',
                  //         style: widget.style?.countryCodeStyle ??
                  //             TextStyle(fontWeight: FontWeight.w700),
                  //       ),
                  //       onTap: () {
                  //         _selectedCountry = _filteredCountries[index];
                  //         widget.onCountryChanged(_selectedCountry);
                  //         Navigator.of(context).pop();
                  //       },
                  //     ),
                  //     widget.style?.listTileDivider ?? Divider(thickness: 1),
                  //   ],
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );






    //   Dialog(
    //   insetPadding: EdgeInsets.symmetric(
    //       vertical: defaultVerticalPadding,
    //       horizontal: mediaWidth > (width + defaultHorizontalPadding * 2)
    //           ? (mediaWidth - width) / 2
    //           : defaultHorizontalPadding),
    //   backgroundColor: widget.style?.backgroundColor,
    //   child: Container(
    //     padding: widget.style?.padding ?? EdgeInsets.all(10),
    //     child: Column(
    //       children: <Widget>[
    //         Padding(
    //           padding: widget.style?.searchFieldPadding ?? EdgeInsets.all(0),
    //           child: TextField(
    //             cursorColor: widget.style?.searchFieldCursorColor,
    //             decoration: widget.style?.searchFieldInputDecoration ??
    //                 InputDecoration(
    //                   suffixIcon: Icon(Icons.search),
    //                   labelText: widget.searchText,
    //                 ),
    //             onChanged: (value) {
    //               _filteredCountries = isNumeric(value)
    //                   ? widget.countryList
    //                       .where((country) => country.dialCode.contains(value))
    //                       .toList()
    //                   : widget.countryList
    //                       .where((country) => country.name
    //                           .toLowerCase()
    //                           .contains(value.toLowerCase()))
    //                       .toList();
    //               if (this.mounted) setState(() {});
    //             },
    //           ),
    //         ),
    //         SizedBox(height: 20),
    //         Expanded(
    //           child: ListView.builder(
    //             shrinkWrap: true,
    //             itemCount: _filteredCountries.length,
    //             itemBuilder: (ctx, index) => Column(
    //               children: <Widget>[
    //                 ListTile(
    //                   leading: Image.asset(
    //                     'assets/flags/${_filteredCountries[index].code.toLowerCase()}.png',
    //                     package: 'intl_phone_field',
    //                     width: 32,
    //                   ),
    //                   contentPadding: widget.style?.listTilePadding,
    //                   title: Text(
    //                     _filteredCountries[index].name,
    //                     style: widget.style?.countryNameStyle ??
    //                         TextStyle(fontWeight: FontWeight.w700),
    //                   ),
    //                   trailing: Text(
    //                     '+${_filteredCountries[index].dialCode}',
    //                     style: widget.style?.countryCodeStyle ??
    //                         TextStyle(fontWeight: FontWeight.w700),
    //                   ),
    //                   onTap: () {
    //                     _selectedCountry = _filteredCountries[index];
    //                     widget.onCountryChanged(_selectedCountry);
    //                     Navigator.of(context).pop();
    //                   },
    //                 ),
    //                 widget.style?.listTileDivider ?? Divider(thickness: 1),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
