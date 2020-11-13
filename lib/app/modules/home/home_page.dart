import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NASA Picture of Day'),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.calendar_today),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2015, 8),
                lastDate: DateTime.now(),
                confirmText: "Selecionar",
                cancelText: "Cancelar",
                selectableDayPredicate: (DateTime val) {
                  if (val.weekday == DateTime.saturday ||
                      val.weekday == DateTime.sunday) {
                    return false;
                  }
                  return true;
                },
              ).then((day) => controller.call(day));
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }
}
