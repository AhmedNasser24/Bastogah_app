import 'package:bastogah_app/features/user_feature/home/data/model/slider_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/model/merchant_category_model.dart';
import '../../data/model/user_merchant_model.dart';
import '../../data/model/user_product_model.dart';
import '../../data/params/user_merchant_param.dart';
import '../../data/params/user_product_param.dart';

abstract class UserHomeRepo {
  Future<Either<Failure, List<SliderModel>>> getSliders();
  Future<Either<Failure, List<MerchantCategoryModel>>> getMerchantCategories();
  Future<Either<Failure, List<UserMerchantModel>>> getMerchants({
    required UserMerchantParam userMerchantParam,
  });
  Future<Either<Failure, List<UserProductModel>>> getProducts({
    required UserProductParam userProductParam,
  });
}
