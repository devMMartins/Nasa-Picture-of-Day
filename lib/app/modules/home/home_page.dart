import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

import 'package:rive/rive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  Artboard _riveArtboard;
  RiveAnimationController _controller;
  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/calendar.riv').then(
      (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller = SimpleAnimation('animation'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NASA Picture of Day',
            style: Theme.of(context).textTheme.headline6),
        actions: <Widget>[
          FlatButton(
            child: _riveArtboard == null
                ? Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).accentColor,
                  )
                : Container(
                    width: 50,
                    height: 50,
                    child: Rive(artboard: _riveArtboard),
                  ),
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
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Observer(
            builder: (_) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      controller.model.title != null
                          ? controller.model.title.toUpperCase()
                          : "",
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  controller.model.url != null
                      ? Image.network(controller.model.url)
                      : Text(""),
                  Padding(
                   padding: EdgeInsets.all(10),
                    child: Text(controller.model.copyright != null
                        ? controller.model.copyright
                        : "",
                        style: Theme.of(context).textTheme.headline2,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(controller.model.explanation != null
                        ? controller.model.explanation
                        : "",
                        style: Theme.of(context).textTheme.headline2,),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
