import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:study/router.dart';

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
    return MaterialApp.router(routerConfig: router);
  }
}

Future<void> initLinks() async {
  final initUri = await applinks.getInitialLink();

  if (initUri != null) {}
}

Future<void> listenLinks() async {
  log('Started to listen');
  applinks.uriLinkStream.listen((uri) {
    log('Got link : ${uri.path}  Got params : ${uri.queryParameters}');
  });
}
