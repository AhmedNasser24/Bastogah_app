import 'package:bastogah_app/features/user_feature/home/data/model/slider_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';

abstract class UserHomeRepo {
  Future<Either<Failure, List<SliderModel>>> getSliders();
}
