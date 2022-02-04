import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/product_details_controller.dart';
import 'package:site_molokovo/pages/products/product_info_widget.dart';
import 'package:site_molokovo/widgets/constrained_widget.dart';
import 'package:site_molokovo/widgets/footer.dart';
import 'package:site_molokovo/widgets/page_layout.dart';
import 'package:site_molokovo/widgets/page_title_widget.dart';

class ProductDetailsPage extends GetView<ProductDetailsController> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      body: Column(
        children: [
          PageTitleWidget(title: controller.product?.name ?? '',),
          ProductInfoWidget(),
        ],
      ),
      footer: Footer(),
    );
  }
}
