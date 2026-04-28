import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:study/login_screen.dart';

final applinks = AppLinks();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await listenLinks();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}
