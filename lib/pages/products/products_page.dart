import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/products_controller.dart';
import 'package:site_molokovo/pages/products/product_widget.dart';
import 'package:site_molokovo/widgets/constrained_widget.dart';
import 'package:site_molokovo/widgets/footer.dart';

class ProductsPage extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.antiAlias,
      children: [
        const SizedBox(height: 40,),
        ConstrainedWidget(
          Center(
            child: GetBuilder<ProductsController>(
              builder: (_) {
                return Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 5,
                  runSpacing: 20,
                  children: controller.products.map((product) => ProductWidget(product, (product) {
                    controller.onAddToBasket(product);
                  }))
                      .toList(),
                );
              }
            ),
          )
        ),
        const SizedBox(height: 40,),
        Footer()
      ],
    );
  }
}