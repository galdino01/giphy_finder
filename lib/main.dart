import 'package:flutter/material.dart';
import 'package:giphy_finder/ui/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
