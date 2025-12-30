import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class UserAddNewAddressDetailsField extends StatefulWidget {
  const UserAddNewAddressDetailsField({super.key});

  @override
  State<UserAddNewAddressDetailsField> createState() =>
      _UserAddNewAddressDetailsFieldState();
}

class _UserAddNewAddressDetailsFieldState
    extends State<UserAddNewAddressDetailsField> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      title: "user.address_details".tr(),
      hintText: "user.address_details_hint".tr(),
    );
  }
}
