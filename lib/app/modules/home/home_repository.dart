import 'package:dio/dio.dart';
import 'package:nasa_pic_of_day/app/modules/home/models/pic_model.dart';

import 'custom_dio/custom_dio.dart';

class HomeRepository {
  final CustomDio _client;

  HomeRepository(this._client);

  Future<PicModel> getPictureOfDay(String day) async {
    try {
      var response = await _client.dio.get(
          "https://api.nasa.gov/planetary/apod?api_key=w42dJezDhZsu7eEBdueADBUSPZqH7fetdplKfGcy&date=$day");
      return PicModel.fromMap(response.data);
    } on DioError catch (e) {
      throw GetPicError(e.response.statusCode);
    }
  }
}

class GetPicError extends Error {
  final int code;
  GetPicError(this.code);
}