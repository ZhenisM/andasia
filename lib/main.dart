import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:andasia/router/router.dart';
import 'package:andasia/theme/theme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    theme: darkTheme,
    initialRoute: '/',
    routes: routes,
  ));
}

