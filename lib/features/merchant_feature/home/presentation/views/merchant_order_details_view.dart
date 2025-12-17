import 'package:flutter/material.dart';

class MerchantOrderDetailsView extends StatelessWidget {
  const MerchantOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),
      body: const Center(
        child: Text('Details of the selected order will be shown here.'),
      ),
    );
  }
}
