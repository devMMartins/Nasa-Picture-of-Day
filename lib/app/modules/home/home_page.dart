import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_pic_of_day/app/modules/home/models/pic_model.dart';
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
      body: SingleChildScrollView(
        child: Observer(builder: (_) {
          return Column(
            children: <Widget>[
              Text(
                  controller.model.title != null ? controller.model.title : ""),
              controller.model.url != null
                  ? Image.network(controller.model.url)
                  : Text(""),
              Text(controller.model.copyright != null
                  ? controller.model.copyright
                  : ""),
              Text(controller.model.explanation != null
                  ? controller.model.explanation
                  : ""),
            ],
          );
        }),
      ),
    );
  }
}
