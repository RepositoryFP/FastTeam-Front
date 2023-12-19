import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:Fast_Team/user/controllerApi.dart';
import 'package:image_compare/image_compare.dart';
// import 'package:image/image.dart';

// A screen that allows users to take a picture using a given camera.
class KameraPage extends StatefulWidget {
  @override
  KameraPageState createState() => KameraPageState();
}

class KameraPageState extends State<KameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final CameraDescription camera = CameraDescription(
      name: '1',
      lensDirection: CameraLensDirection.front,
      sensorOrientation: 270);
  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ambil fotomu kawan')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: ElevatedButton(onPressed: cekGambar, child: Text('Lanjutkan')),
      ),
    );
  }

  void cekGambar() async {
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Attempt to take a picture and get the file `image`
      // where it was saved.
      final image = await _controller.takePicture();

      if (!mounted) return;
      // var gmbrCamera = Uri.parse(
      //     'https://cdns.klimg.com/merdeka.com/i/w/news/2021/01/29/1268594/content_images/670x335/20210129015332-2-mempesona-ini-10-gambar-kucing-anggora-dengan-mata-berbeda-warna-002-zaki.jpg');
      // var gmbrCamera = File(image.path);
      var gmbrProfileString =
          'https://sys.fastprint.co.id/absensi/assets/img/profile_user/fotoku2.jpg';
      var gmbrProfile = Uri.parse(
          'https://miro.medium.com/v2/resize:fit:278/format:webp/1*QNes2bmoXzTHSYQt1SgOZg.jpeg');
      var gmbrCamera = Uri.parse(
          'https://miro.medium.com/v2/resize:fit:278/format:webp/1*QNes2bmoXzTHSYQt1SgOZg.jpeg');

      var getDiff = await compareImages(
          src1: gmbrCamera,
          src2: gmbrProfile,
          algorithm: ChiSquareDistanceHistogram());
      var getDiff0 = await compareImages(
          src1: gmbrCamera,
          src2: gmbrProfile,
          algorithm: IMED(blurRatio: 0.001));

      var getDiff1 = await compareImages(
          src1: gmbrCamera,
          src2: gmbrProfile,
          algorithm: IntersectionHistogram());

      var getDiff2 = await compareImages(src1: gmbrCamera, src2: gmbrProfile);
      var getDiff3 = await compareImages(
          src1: gmbrCamera,
          src2: gmbrProfile,
          algorithm: EuclideanColorDistance());
      var getDiff4 = await compareImages(
          src1: gmbrCamera, src2: gmbrProfile, algorithm: MedianHash());

      print('ChiSquareDistanceHistogram : ${100 - (getDiff * 100)}');
      print('IMED : ${100 - (getDiff0 * 100)}');
      print('IntersectionHistogram : ${100 - (getDiff1 * 100)}');
      print('JustCompare : ${100 - (getDiff2 * 100)}');
      print('EuclideanColorDistance : ${100 - (getDiff3 * 100)}');
      print('MedianHash : ${100 - (getDiff4 * 100)}');

      var hasilDiff1 =
          'ChiSquareDistanceHistogram : ${100 - (getDiff * 100)}\n IMED : ${100 - (getDiff0 * 100)}\n IntersectionHistogram : ${100 - (getDiff1 * 100)}\n JustCompare : ${100 - (getDiff2 * 100)}\n EuclideanColorDistance : ${100 - (getDiff3 * 100)}\n MedianHash : ${100 - (getDiff4 * 100)}';

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
              // Pass the automatically generated path to
              // the DisplayPictureScreen widget.
              imagePath: image.path,
              gmbrCompare: gmbrProfileString,
              hasilDiff: hasilDiff1),
        ),
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String gmbrCompare;
  final hasilDiff;
  const DisplayPictureScreen(
      {super.key,
      required this.imagePath,
      required this.gmbrCompare,
      required this.hasilDiff});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Image.file(File(imagePath)),
                Image.network(gmbrCompare),
                Text(hasilDiff)
              ],
            ),
          )
        ],
      ),
    );
  }
}
