import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'merchant_add_new_order_city_field.dart';
import 'merchant_add_new_order_region_field.dart';

class MerchantAddressField extends StatefulWidget {
  const MerchantAddressField({super.key});

  @override
  State<MerchantAddressField> createState() => _MerchantAddressFieldState();
}

class _MerchantAddressFieldState extends State<MerchantAddressField> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MerchantAddNewOrderRegionField(),
        Gap(12),
        MerchantAddNewOrderCityField(),
      ],
    );
  }
}
