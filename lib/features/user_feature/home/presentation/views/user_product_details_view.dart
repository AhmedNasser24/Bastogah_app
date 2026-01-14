import 'package:bastogah_app/core/local_storage_data/local_storage_data.dart';
import 'package:bastogah_app/core/widgets/custom_text_form_field.dart';
import 'package:bastogah_app/core/widgets/custom_toast/custom_toastification.dart';
import 'package:bastogah_app/features/user_feature/cart/data/model/cart_model.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/user_product_model.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/widgets/user_product_details_sliver_app_bar.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_style.dart';
import '../../../../../core/theme/app_icons.dart';
import '../../../../merchant_feature/products/presentation/widgets/custom_check_box.dart';

class UserProductDetailsView extends StatelessWidget {
  const UserProductDetailsView({super.key, required this.product, this.cart});
  final UserProductModel product;
  final CartModel? cart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  UserProductDetailsSliverAppBar(
                    image: product.images?.first ?? "",
                  ),
                  const SliverGap(24),
                  const SliverToBoxAdapter(child: TopRateTextWidget()),
                  const SliverGap(24),
                  SliverToBoxAdapter(
                    child: ProductDetailsSection(product: product),
                  ),
                  const SliverGap(24),
                  const SliverToBoxAdapter(child: MoreOptionsSection()),
                  const SliverGap(24),
                  const SliverToBoxAdapter(child: RemovedGradientSection()),
                  const SliverGap(24),
                  SliverToBoxAdapter(child: SpecialNoteSection(cart: cart)),
                  const SliverGap(20),
                ],
              ),
            ),
            ProductQuantitySection(product: product, cart: cart),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

class ProductQuantitySection extends StatefulWidget {
  const ProductQuantitySection({super.key, this.cart, required this.product});
  final CartModel? cart;
  final UserProductModel product;

  @override
  State<ProductQuantitySection> createState() => _ProductQuantitySectionState();
}

class _ProductQuantitySectionState extends State<ProductQuantitySection> {
  late int quantity;
  @override
  void initState() {
    if (widget.cart != null) {
      quantity = widget.cart!.quantity;
    } else {
      quantity = 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              Text(
                "user.quantity".tr(),
                style: AppFontStyle.semibold18Primary(context),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
                icon: const Icon(Icons.add, color: AppColors.primary),
              ),
              Text(
                quantity.toString(),
                style: AppFontStyle.semibold18black1A(context),
              ),
              IconButton(
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
                icon: const Icon(Icons.remove),
                color: AppColors.grey,
              ),
            ],
          ),
          const Gap(8),
          addToCartButton(context),
        ],
      ),
    );
  }

  Widget addToCartButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.cart != null) {
          widget.cart!.quantity = quantity;
          LocalStorageData.addToCart(widget.cart!);
          CustomToastification.showSuccessToast(
            message: "product_update_in_cart".tr(),
          );
        } else {
          LocalStorageData.addToCart(
            CartModel(userProduct: widget.product, quantity: quantity),
          );
          CustomToastification.showSuccessToast(
            message: "product_added_to_cart".tr(),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF6800), Color(0xFFFD9900)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.iconsCart32White),
            const Gap(6),
            Text(
              "user.add_to_cart".tr(),
              style: AppFontStyle.bold16White(context),
            ),
            const Spacer(),
            Text(
              "merchant.currency".tr(
                args: ["${widget.product.price! * quantity}"],
              ),
              style: AppFontStyle.semibold16White(context),
            ),
          ],
        ),
      ),
    );
  }
}

class TopRateTextWidget extends StatelessWidget {
  const TopRateTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppIcons.iconsStar),
                const Gap(4),
                Text(
                  "merchant.top_rated".tr(),
                  style: AppFontStyle.regular14Primary(context),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key, required this.product});
  final UserProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            product.name ?? "--",
            style: AppFontStyle.semibold18black1A(context),
          ),
          Text(product.desc ?? "--", style: AppFontStyle.medium16Grey(context)),
          Text(
            "merchant.currency".tr(
              args: [product.finalPrice?.toString() ?? "--"],
            ),
            textDirection: TextDirection.rtl,
            style: AppFontStyle.semibold18black1A(context),
          ),
        ],
      ),
    );
  }
}

class MoreOptionsSection extends StatelessWidget {
  const MoreOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            "merchant.more_options".tr(),
            style: AppFontStyle.semibold18black1A(context),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  const CustomCheckBox(),
                  const Gap(8),
                  Text("صلصة", style: AppFontStyle.regular14black4B(context)),
                  Text(
                    " +${"merchant.currency".tr(args: ["500"])}",
                    style: AppFontStyle.regular14grey(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RemovedGradientSection extends StatelessWidget {
  const RemovedGradientSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            "merchant.remove_ingredients".tr(),
            style: AppFontStyle.semibold18black1A(context),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  const CustomCheckBox(),
                  const Gap(8),
                  Text("مشروم", style: AppFontStyle.regular14black4B(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialNoteSection extends StatelessWidget {
  const SpecialNoteSection({super.key, this.cart});
  final CartModel? cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            "user.special_note".tr(),
            style: AppFontStyle.semibold18black1A(context),
          ),
          Text(
            "user.special_note_title".tr(),
            style: AppFontStyle.regular14grey(context),
          ),
          CustomTextFormField(
            hintText: "user.special_note_hint".tr(),
            maxLines: 4,
            controller: TextEditingController(text: cart?.specialNote),
            onChanged: (value) {
              cart?.specialNote = value;
            },
          ),
        ],
      ),
    );
  }
}
