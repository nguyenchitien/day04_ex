import 'package:day04_ex/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final systemTheme = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Color(0xFF373A36),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        canvasColor: Colors.black,
      ),
      home: App(),
    );
  }
}
