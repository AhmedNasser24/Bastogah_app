import 'package:flutter/material.dart';

import 'merchant_add_new_order_city_field.dart';
import 'merchant_add_new_order_governorate_field.dart';

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
        MerchantAddNewOrderGovernorateField(),
        MerchantAddNewOrderCityField(),
      ],
    );
  }
}
