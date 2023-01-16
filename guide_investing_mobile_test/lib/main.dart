import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:load/load.dart';
import 'core/di/di.dart';
import 'modules/presentation/view/investing_variation_active_screen.dart';


void main() {
  initializeDi(GetIt.instance);
  runApp(LoadingProvider(
    themeData: LoadingThemeData(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guide investing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InvestingVariationActiveScreen(),
    );
  }
}
