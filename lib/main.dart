import 'package:flutter/material.dart';
import 'package:pray_timesz/network/dio_qibla.dart';
import 'package:pray_timesz/screens/times.dart';
import 'dart:io';

import 'package:pray_timesz/network/dio_helper.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new PostHttpOverrides();
  DioHelper.init();
  DioQibla.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Times(),
    );
  }
}
