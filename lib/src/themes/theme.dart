import 'package:flutter/material.dart';
import 'package:tugasbesar/src/themes/custome_themes/text_theme.dart';
class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: ''
    brightness: Brightness.light, //
    scaffoldBackgroundColor: Colors.white, //mendefinisikan semua scaffold menjadi warna merah
    textTheme: TTextTheme.lightTextTheme, 
  );
}