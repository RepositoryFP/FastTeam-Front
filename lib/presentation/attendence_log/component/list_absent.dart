import 'package:fastteam_app/core/utils/color_constant.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AbsensiListItem extends StatefulWidget {
  final String dateText;
  final Color dateColor;
  final List<dynamic> jamMasuk;
  final List<dynamic> jamKeluar;
  final int idMasuk;
  final int idKeluar;
  final bool isSunday;

  const AbsensiListItem({
    super.key,
    required this.dateText,
    required this.dateColor,
    required this.jamMasuk,
    required this.jamKeluar,
    required this.idMasuk,
    required this.idKeluar,
    required this.isSunday,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AbsensiListItemState createState() => _AbsensiListItemState();
}

class _AbsensiListItemState extends State<AbsensiListItem> {
  bool isExpanded = false;

  // get jamMasukItem => null;
  @override
  Widget build(BuildContext context) {
    dynamic lastJamKeluar =
        widget.jamKeluar.isNotEmpty ? widget.jamKeluar.last : null;
    return Container(
      color: widget.isSunday ? Colors.grey[200] : Colors.white,
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.dateText,
                  style: TextStyle(
                    fontSize: getFontSize(18),
                    fontWeight: FontWeight.bold,
                    color: widget.dateColor,
                    fontFamily: 'Outfit',
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: getPadding(
                          right: 10), // Jeda 10px di antara kedua teks
                      child: Text(
                        (widget.jamMasuk.isEmpty)
                            ? '--:--'
                            : widget.jamMasuk[0]['jam_absen'],
                        style: TextStyle(
                          fontSize: getFontSize(18),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ),
                    Text(
                      (widget.jamMasuk.isEmpty)
                          ? '--:--'
                          : lastJamKeluar['jam_absen'],
                      style: TextStyle(
                        fontSize: getFontSize(18),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.dateColor,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        isExpanded ? Icons.remove : Icons.add,
                        size: getFontSize(18),
                        color: widget.dateColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: <Widget>[
                  const Divider(), // Divider added here
                  const SizedBox(height: 5),
                  ...widget.jamMasuk.map((jamMasukItem) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/detailAbsensi',
                                arguments: jamMasukItem['id_absen']);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Jam Masuk:',
                                style: TextStyle(
                                  fontSize: getFontSize(16),
                                  color: ColorConstant.green600,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              Text(
                                (jamMasukItem['jam_absen'] == null)
                                    ? '--:--'
                                    : jamMasukItem['jam_absen'],
                                style: TextStyle(
                                  fontSize: getFontSize(16),
                                  color: ColorConstant.green600,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_rounded,
                                size: getFontSize(24),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getVerticalSize(5)),
                        const Divider(), // Divider added here
                      ],
                    );
                  }),
                  SizedBox(height: getVerticalSize(5)),
                  ...widget.jamKeluar.map((jamKeluarItem) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.attendenceDetail,
                                arguments: jamKeluarItem['id_absen']);
                            // Navigator.pushNamed(context, '/detailAbsensi',
                            //     arguments: jamKeluarItem['id_absen']);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Jam Keluar:',
                                style: TextStyle(
                                  fontSize: getFontSize(16),
                                  color: ColorConstant.yellow800,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              Text(
                                (jamKeluarItem['jam_absen'] == null)
                                    ? '--:--'
                                    : jamKeluarItem['jam_absen'],
                                style: TextStyle(
                                  fontSize: getFontSize(16),
                                  color: ColorConstant.yellow800,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Outfit',
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_rounded,
                                size: getFontSize(24),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getVerticalSize(5)),
                        const Divider(), // Divider added here
                      ],
                    );
                  }),
                  SizedBox(height: getVerticalSize(10)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
