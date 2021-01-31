import 'package:flutter/material.dart';

import 'package:widgets/src/pages/alert_page.dart';
import 'package:widgets/src/pages/home_page.dart';
import 'package:widgets/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Components App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
