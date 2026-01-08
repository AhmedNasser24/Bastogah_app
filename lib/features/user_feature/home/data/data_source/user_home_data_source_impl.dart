import 'package:bastogah_app/core/api/api_consumer.dart';
import 'package:bastogah_app/core/api/end_point.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/slider_model.dart';

import 'user_home_data_source.dart';

class UserHomeDataSourceImpl implements UserHomeDataSource {
  final ApiConsumer apiConsumer;

  UserHomeDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<SliderModel>> getSliders() async {
    var dataList = await apiConsumer.get(EndPoint.sliders);
    return SliderModel.fromJsonList(dataList);
  }
}
