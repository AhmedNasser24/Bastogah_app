import 'package:flutter/material.dart';

import 'city_field.dart';
import 'governorate_field.dart';

class MerchantAddressField extends StatefulWidget {
  const MerchantAddressField({super.key});

  @override
  State<MerchantAddressField> createState() => _MerchantAddressFieldState();
}

class _MerchantAddressFieldState extends State<MerchantAddressField> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [GovernorateField(), CityField()]);
  }
}
