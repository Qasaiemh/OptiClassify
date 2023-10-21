import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'routes.dart';
import 'splash_screen.dart';
import 'widget/plant_recogniser.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      title: 'OptiClassify',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'MazzardM',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
