import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class UserAddNewAddressNameField extends StatefulWidget {
  const UserAddNewAddressNameField({super.key});

  @override
  State<UserAddNewAddressNameField> createState() =>
      _UserAddNewAddressNameFieldState();
}

class _UserAddNewAddressNameFieldState
    extends State<UserAddNewAddressNameField> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      title: "user.address_name".tr(),
      hintText: "user.address_name_hint".tr(),
    );
  }
}
