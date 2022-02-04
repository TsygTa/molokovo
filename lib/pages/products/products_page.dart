import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/products_controller.dart';
import 'package:site_molokovo/pages/products/product_widget.dart';
import 'package:site_molokovo/widgets/constrained_widget.dart';
import 'package:site_molokovo/widgets/footer.dart';
import 'package:site_molokovo/widgets/page_layout.dart';
import 'package:site_molokovo/widgets/page_title_widget.dart';

class ProductsPage extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
        body: Column(
          children: [
            PageTitleWidget(title: 'our_products'.tr, icon: Icons.fastfood),
            Center(
              child: GetBuilder<ProductsController>(
                builder: (_) {
                  return Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: controller.products.map((product) => ProductWidget(product))
                        .toList(),
                  );
                }
              )),
          ],
        ),
        footer: Footer()
    );
  }
}