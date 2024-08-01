import 'dart:async';
import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/core/utils/color_constant.dart';
import 'package:fastteam_app/core/utils/size_utils.dart';
import 'package:fastteam_app/presentation/camera_screen/component/result_screen.dart';
import 'package:fastteam_app/presentation/home_page/controller/home_controller.dart';
import 'package:fastteam_app/presentation/home_page/models/home_model.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  int idUser = 0;
  double lat = 0;
  double long = 0;
  String imgProf = '';
  String kantor = '';
  String aksi = '';
  String shift = '';
  double brightnessValue = 0.5;
  String note = ''; // Tambahkan variabel untuk input note
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  HomeController controller = Get.put(HomeController(HomeModel().obs));

  final CameraDescription camera = const CameraDescription(
    name: '1',
    lensDirection: CameraLensDirection.front,
    sensorOrientation: 270,
  );

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
     controller.getAccountInformation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Map<String, dynamic>? routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (routeArguments != null) {
      idUser = routeArguments['idUser'];
      long = routeArguments['long'];
      lat = routeArguments['lat'];
      imgProf = routeArguments['imgProf'] ?? '';
      aksi = routeArguments['aksi'] ?? '';
      kantor = routeArguments['kantor'] ?? '';
      shift = routeArguments['shift'] ?? '';
    }
    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: SafeArea(
          child: Scaffold(
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
                      onTapArrowleft11();
                    }),
                centerTitle: true,
                title: Column(
                  children: [
                    Text(
                      'Office: $kantor',
                      style: AppStyle.txtSFProTextbold20,
                    ),
                    const SizedBox(
                        height: 8), // Space between "Kantor" and "Masuk"
                    Text(
                      'Shift: $shift',
                      style: AppStyle.txtBody,
                    ),
                  ],
                ),
              ),
              resizeToAvoidBottomInset: true, // Set this to true
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: [
                          Transform.scale(
                            scale: size.aspectRatio * 2.1,
                            child: FutureBuilder<void>(
                              future: _initializeControllerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return CameraPreview(_controller);
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: getPadding(left: 10, right: 10),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: getPadding(left: 10, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.wb_sunny,
                                            color: ColorConstant.indigo800),
                                        Expanded(
                                          // Menggunakan Expanded untuk Slider
                                          child: Slider(
                                            value: brightnessValue,
                                            onChanged: (newValue) {
                                              setState(() {
                                                brightnessValue = newValue;
                                                _controller.setExposureOffset(
                                                    newValue);
                                              });
                                            },
                                            min: -1.0,
                                            max: 1.0,
                                            activeColor: ColorConstant
                                                .indigo800, // Set the color for the active part of the slider
                                            inactiveColor:
                                                ColorConstant.gray200,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: getPadding(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        labelText: 'Note',
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          note = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                        right: 10, left: 10, top: 10),
                                    child: ElevatedButton(
                                      onPressed: cekGambar,
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                ColorConstant.indigo800),
                                        minimumSize: MaterialStateProperty
                                            .all<Size>(Size(double.infinity,
                                                50)), // Menetapkan ukuran minimum tombol
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(
                                                    16)), // Adjust the radius as needed
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Take Picture',
                                        style: AppStyle.txtBodyWhite20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }

  void cekGambar() async {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text("On Process, Please Wait..."),
            ],
          ),
        );
      },
    );

    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      final File imageFile = File(image.path);
      // Kirim file gambar ke Django untuk perbandingan
      var resp = await kirimCekGambar(imageFile);
      var respBody = jsonDecode(resp);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      if (respBody['status'] == true) {
        // _controller.dispose();
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              shift: controller.accountInfo!.shift!,
              imageFile: imageFile,
              resp: respBody,
              aksi: aksi, // Kirim nilai aksi
              kantor: kantor, // Kirim nilai kantor
            ),
          ),
        );
      } else {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Your Face Not Detected, Who Are You?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .primaryColor, // Gunakan warna utama dari tema aplikasi Anda
                    minimumSize: const Size(
                        double.infinity, 50), // Atur lebar tombol ke penuh
                  ),
                  child: Text(
                    'OK',
                    style: TextStyle(color: ColorConstant.whiteA700),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<String> kirimCekGambar(File imageFile) async {
    http.MultipartRequest request = await storeImageAbsent(imageFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      return responseBody;
    } else {
      var responseBody = await response.stream.bytesToString();
      return responseBody;
    }
  }

  Future<http.MultipartRequest> storeImageAbsent(File imageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${BaseServer.serverUrl}/compare-image/'),
    );
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));
    request.fields.addAll({
      'url_prof': imgProf,
      'long': long.toString(),
      'lat': lat.toString(),
      'id_user': idUser.toString(),
      'aksi': aksi,
      'base_64': await imageToBase64(imageFile),
      'note': note,
    });
    request.headers.addAll({
      HttpHeaders.authorizationHeader: 'Bearer $token',
    });
    return request;
  }

  Future<String> imageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  onTapArrowleft11() {
    Get.back();
  }
}
