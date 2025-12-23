import 'package:easy_localization/easy_localization.dart';

import '../enums/merchant_filter_enums.dart';

class MerchantFilterModel {
  final MerchantFilterEnum filter;
  final String title;
  const MerchantFilterModel({required this.filter, required this.title});
}

List<MerchantFilterModel> merchantOrderFilters = [
  MerchantFilterModel(
    filter: MerchantFilterEnum.pending,
    title: "merchant.filter.pending".tr(),
  ),
  MerchantFilterModel(
    filter: MerchantFilterEnum.waitingDriver,
    title: "merchant.filter.waiting_for_driver".tr(),
  ),
  MerchantFilterModel(
    filter: MerchantFilterEnum.inprogress,
    title: "merchant.filter.in_progress".tr(),
  ),
  MerchantFilterModel(
    filter: MerchantFilterEnum.completed,
    title: "merchant.filter.completed".tr(),
  ),
  MerchantFilterModel(
    filter: MerchantFilterEnum.cancelled,
    title: "merchant.filter.cancelled".tr(),
  ),
];
