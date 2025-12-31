import 'package:flutter/material.dart';

import '../widgets/user_offer_details_app_bar.dart';
import '../widgets/user_offer_details_store_item.dart';

class UserOffersDetailsView extends StatelessWidget {
  const UserOffersDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const UserOfferDetailsAppBar(),

            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                maxCrossAxisExtent: 600,
                mainAxisExtent: 290,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: UserOfferDetailsStoreItem(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
