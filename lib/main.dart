import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'providers/chapter_provider.dart';
import 'views/chapter_info_view.dart';
import 'views/contextual_map_view.dart';
import 'views/landing_view.dart';
import 'services/db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  if (Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    await DBService.initializeDB();
  } else {
    if (isFirstTime) {
      await DBService.initializeDB();
      await prefs.setBool('isFirstTime', false);
    }
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ChapterProvider(),
        child: MaterialApp(
          theme: ThemeData(
              fontFamily: "Arial",
              colorScheme: const ColorScheme.light(
                  surface: Color.fromARGB(246, 246, 248, 218),
                  surfaceContainerHighest: Color.fromARGB(235, 242, 242, 235),
                  primary: Color.fromARGB(106, 130, 175, 218),
                  primaryFixed: Color.fromARGB(149, 10, 100, 142),
                  secondary: Color.fromARGB(153, 20, 46, 50),
                  tertiary: Color.fromARGB(255, 27, 59, 73),
                  onPrimaryFixedVariant: Color.fromARGB(100, 120, 170, 200),
                  onPrimary: Color.fromARGB(255, 7, 8, 8),
                  onSecondary: Color.fromARGB(255, 195, 203, 203),
                  onSurface: Color.fromARGB(255, 7, 8, 8)),
              useMaterial3: true),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const LandingView(),
            '/chapter_info': (BuildContext context) => const ChapterInfo(),
            '/contextual_map': (BuildContext context) => const ContextualMap()
          },
        ));
  }
}
