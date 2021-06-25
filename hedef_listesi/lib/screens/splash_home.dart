import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'HomePage.dart';

class SplashHome extends StatefulWidget {
  @override
  _SplashHomeState createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'Hedef Listesi',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            color: Colors.green.shade700),
      ),
      image: Image.asset('assets/splash_image.png'),
      loadingText: Text('Yükleniyor...'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: () => print("hey"),
      loaderColor: Colors.green,
    );
  }
}
