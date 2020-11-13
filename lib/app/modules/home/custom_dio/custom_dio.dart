import 'package:dio/dio.dart';

import 'interceptors.dart';

class CustomDio {
  final Dio dio;

  CustomDio(this.dio){
    dio.interceptors.add(CustomInterceptors());
    dio.options.connectTimeout = 5000;
  }

}