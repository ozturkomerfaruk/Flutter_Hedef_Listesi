import 'package:flutter/material.dart';
import 'package:hedef_listesi/screens/HomePage.dart';
import 'package:hedef_listesi/screens/splash_home.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'modals/color_theme_data.dart';
import 'modals/items_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemData().createPrefObject();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemData>(
        create: (BuildContext context) => ItemData()),
    ChangeNotifierProvider<ColorThemeData>(
        create: (context) => ColorThemeData())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ItemData, ColorThemeData>(
        builder: (BuildContext context, itemData, colorData, Widget child) {
      itemData.loadItemsFromSharedPref();
      colorData.loadThemeFromSharedPref();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: colorData.selectedThemeData,
        home: SplashHome(),
      );
    });
  }
}

