import 'package:bastogah_app/features/user_feature/home/data/model/slider_model.dart';

import '../model/merchant_category_model.dart';
import '../model/user_merchant_model.dart';
import '../model/user_product_model.dart';
import '../params/user_merchant_param.dart';
import '../params/user_product_param.dart';

abstract class UserHomeDataSource {
  Future<List<SliderModel>> getSliders();
  Future<List<MerchantCategoryModel>> getMerchantCategories();
  Future<List<UserMerchantModel>> getMerchants({
    required UserMerchantParam userMerchantParam,
  });
  Future<List<UserProductModel>> getProducts({
    required UserProductParam userProductParam,
  });
}
