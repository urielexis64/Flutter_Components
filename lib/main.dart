import 'package:flutter/material.dart';

import 'package:widgets/src/pages/avatar_page.dart';
import 'package:widgets/src/pages/alert_page.dart';
import 'package:widgets/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      home: HomePage(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        "home": (BuildContext context) => HomePage(),
        "alert": (BuildContext context) => AlertPage(),
        "avatar": (BuildContext context) => AvatarPage(),
      },
    );
  }
}
