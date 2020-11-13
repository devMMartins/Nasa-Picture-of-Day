import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_pic_of_day/app/modules/home/home_repository.dart';

import 'models/pic_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @observable
  PicModel model = PicModel();

  @action
  void call(DateTime day) {
    try {
      repository
          .getPictureOfDay(formatter.format(day))
          .then((value) => model = value);
    } catch (e) {
      print("DEU MERDA!");
      print(e);
    }
  }

  _HomeControllerBase(this.repository);
}
