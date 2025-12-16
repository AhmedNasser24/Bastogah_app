import 'package:easy_localization/easy_localization.dart';

import '../enums/merchant_filter_enums.dart';

class MerchantFilterModel {
  final MerchantFilterEnums filter;
  final String title;
  const MerchantFilterModel({required this.filter, required this.title});
}

List<MerchantFilterModel> merchantFilters = [
  MerchantFilterModel(
    filter: MerchantFilterEnums.pending,
    title: "merchant.filter.pending".tr(),
  ),
  MerchantFilterModel(
    filter: MerchantFilterEnums.inprogress,
    title: "merchant.filter.in_progress".tr(),
  ),
  MerchantFilterModel(
    filter: MerchantFilterEnums.completed,
    title: "merchant.filter.completed".tr(),
  ),
  MerchantFilterModel(
    filter: MerchantFilterEnums.cancelled,
    title: "merchant.filter.cancelled".tr(),
  ),
];
