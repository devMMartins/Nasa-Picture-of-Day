import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:nasa_pic_of_day/app/app_widget.dart';
import 'package:nasa_pic_of_day/app/modules/home/custom_dio/custom_dio.dart';
import 'package:nasa_pic_of_day/app/modules/home/home_module.dart';
import 'package:nasa_pic_of_day/app/modules/home/home_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => CustomDio(Modular.get<Dio>())),
        Bind((i) => HomeRepository(Modular.get<CustomDio>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
