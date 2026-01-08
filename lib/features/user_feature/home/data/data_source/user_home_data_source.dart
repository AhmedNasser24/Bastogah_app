import 'package:bastogah_app/features/user_feature/home/data/model/slider_model.dart';

abstract class UserHomeDataSource {
  Future<List<SliderModel>> getSliders();
}
