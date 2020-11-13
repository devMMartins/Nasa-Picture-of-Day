import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromARGB(255, 11, 61, 145),
        accentColor: Color.fromARGB(255, 252, 61, 33),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 25, color: Colors.white70),
          headline4: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          headline2: TextStyle(fontSize: 18, color: Colors.black)
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
