import 'package:fastteam_app/presentation/home_page/models/account_model.dart';
import 'package:fastteam_app/presentation/location_map_screen/controller/location_map_controller.dart';
import 'package:fastteam_app/presentation/map_screen/controller/map_controller.dart';
import 'package:fastteam_app/presentation/map_screen/model/map_model.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_image.dart';
import 'package:fastteam_app/widgets/app_bar/appbar_title.dart';
import 'package:fastteam_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import '../location_with_select_one_screen/location_with_select_one_screen.dart';
import 'package:fastteam_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

// ignore_for_file: must_be_immutable

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var idUser;
  var imgProf;
  var kantor;
  var aksi;
  var shift;

  double lat = 0;
  double long = 0;

  late final MapController _mapController; // Changed to final

  double _latitude = 0;
  double _longitude = 0;
  bool gpsIsActive = true;
  bool isMockedGps = false;

  MapScreenController controller = Get.put(MapScreenController());
  LocationMapController locationMapController =
      Get.put(LocationMapController());

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    _mapController = MapController(); // Initialize _mapController here
    initConstructor();
    loadSharedPreferences();
    _loadLocation();
    _getCurrentLocation();
  }

  void initConstructor() {
    idUser = 0.obs;
    imgProf = ''.obs;
    kantor = ''.obs;
    aksi = ''.obs;
    shift = ''.obs;
  }

  Future<void> loadSharedPreferences() async {
    var result = await controller.retriveAccountInformation();
    AccountInformationModel accountModel =
        AccountInformationModel.fromJson(result['details']['data']);
    setState(() {
      idUser = accountModel.id;
      imgProf = accountModel.imgProfUrl;
      kantor = accountModel.cabang;
      shift = accountModel.shift;
    });
  }

  Future<void> _loadLocation() async {
    UserCoordinate coordinate = await retriveCoordinateUser();
    if (coordinate.latitude != null && coordinate.longitude != null) {
      setState(() {
        _latitude = coordinate.latitude!;
        _longitude = coordinate.longitude!;
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (isLocationServiceEnabled) {
      Position position = await Geolocator.getCurrentPosition();

      double latitude = position.latitude;
      double longitude = position.longitude;

      await controller.storeCoordinateUser(latitude, longitude);

      setState(() {
        _latitude = latitude;
        _longitude = longitude;
        gpsIsActive = true;
        isMockedGps = position.isMocked;
      });

      if (isMockedGps) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'You in mode developer. Please turn off your mode developer and click refresh button to absent.'),
            backgroundColor: Colors.red,
          ),
        );
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _mapController.move(LatLng(latitude, longitude), 18.0);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'GPS Not Active!, Please turn on your gps and click refresh button.'),
          backgroundColor: Colors.red,
        ),
      );

      setState(() {
        gpsIsActive = false;
      });
    }
  }

  void _reloadMap() {
    _loadLocation();
    _getCurrentLocation();
  }

  cek_lokasi() {
    
    print('GPS Active: $gpsIsActive, Mocked GPS: $isMockedGps');
    print('idUser: $idUser, Longitude: $_longitude, Latitude: $_latitude');
    print('imgProf: $imgProf, aksi: $aksi, kantor: $kantor, shift: $shift');

    if (gpsIsActive && !isMockedGps) {
      final imgProfParts = imgProf?.split('/') ?? [];
      final imgProfLastPart = imgProfParts.isNotEmpty ? imgProfParts.last : '';

      // More logging to ensure values are what you expect
      print('imgProfParts: $imgProfParts');
      print('imgProfLastPart: $imgProfLastPart');

      if (idUser != null) {
        print({
          'idUser': idUser,
          'long': _longitude,
          'lat': _latitude,
          'imgProf': imgProfLastPart,
          'aksi': aksi,
          'kantor': kantor,
          'shift': shift,
        });

        Get.offAndToNamed(AppRoutes.camera, arguments: {
          'idUser': idUser,
          'long': _longitude,
          'lat': _latitude,
          'imgProf': imgProfLastPart,
          'aksi': aksi ?? 'N/A',
          'kantor': kantor ?? 'N/A',
          'shift': shift ?? 'N/A',
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Required data is missing or uninitialized.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('close'),
                ),
              ],
            );
          },
        );
      }
    } else if (isMockedGps) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: const Text(
                'You are in developer mode, please turn off developer mode to continue absent.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('close'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('GPS not active'),
            content: const Text(
                'Unable to clock in, please activate navigation and click refresh button to continue absent.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    aksi = ModalRoute.of(context)!.settings.arguments as String;
   
    return GetBuilder<LocationMapController>(
      init: LocationMapController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgBackground),
                    fit: BoxFit.fill)),
            height: double.infinity,
            width: double.maxFinite,
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
                  title: AppbarTitle(
                    text: aksi == 'in' ? 'Clock In' : 'Clock Out',
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        _reloadMap();
                      },
                    ),
                  ],
                ),
                body: SafeArea(
                  child: Stack(
                    children: [
                      FlutterMap(
                        mapController: _mapController,
                        options: MapOptions(
                          center: LatLng(_latitude, _longitude),
                          zoom: 0.0,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                width: 50.0,
                                height: 50.0,
                                point: LatLng(_latitude, _longitude),
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                      '$imgProf'), // Menggunakan imgProf dari SharedPreferences
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        left: 20,
                        child: Center(
                          child: SizedBox(
                            width: getHorizontalSize(
                                450), // Ubah lebar sesuai kebutuhan
                            height: getVerticalSize(
                                60), // Ubah tinggi sesuai kebutuhan
                            child: ElevatedButton(
                              onPressed: cek_lokasi,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorConstant.indigo800),
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(200,
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
                                'Clock $aksi',
                                style: AppStyle.txtBodyWhite20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTapBtnLocation(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.zero,
          content: LocationWithSelectOneScreen(),
        );
      },
    );
  }

  void onTapArrowleft11() {
    Get.back();
  }
}
