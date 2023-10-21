import 'package:OptiClassify/splash_screen.dart';
import 'package:OptiClassify/widget/bep.dart';
import 'package:OptiClassify/widget/oto.dart';
import 'package:flutter/material.dart';
import 'package:OptiClassify/widget/process_complete_page.dart'; // Import the new page
import '../classifier/classifier.dart';

import 'home_page.dart';
import 'widget/modem.dart';
import 'widget/plant_recogniser.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomePage.routeName: (context) => const HomePage(),
  PlantRecogniser.routeName: (context) => const PlantRecogniser(),
  Modem.routeName: (context) => const Modem(),
  BEP.routeName: (context) => const BEP(),
  OTO.routeName: (context) => const OTO(),
  ProcessCompletePage.routeName: (context) =>  ProcessCompletePage()

 // if (correctLabelCount == 2) // Conditionally include the page
  //  ProcessCompletePage.routeName: (context) =>  ProcessCompletePage(),
};