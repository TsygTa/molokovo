import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/products_controller.dart';
import 'package:site_molokovo/models/product.dart';
import 'package:site_molokovo/routes/app_pages.dart';
import 'package:site_molokovo/widgets/custom_button.dart';
import 'package:site_molokovo/widgets/custom_image.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class ProductWidget extends GetView<ProductsController> {
  const ProductWidget(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.rootDelegate
            .toNamed(Routes.productDetails(product.id));
      },
      borderRadius: BorderRadius.circular(10),
      hoverColor: const Color(activeColor).withOpacity(0.3),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Color(activeColor),
            width: 0.5,
          ),
        ),
        color: const Color(lightColor),
        child: Container(
          width: productWidgetWidth,
          height: productWidgetHeight,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(imagePath: product.imagePath, width: 200, height: 200),
              const SizedBox(height: 20,),
              CustomText(text: product.name, fontWeight: FontWeight.bold,),
              const SizedBox(height: 20,),
              CustomText(text: 'weight_volume'.tr + ': ' + product.weight,),
              const SizedBox(height: 20,),
              CustomText(text: 'price'.tr + ': ' + product.priceToString,),
              const SizedBox(height: 20,),
              CustomButton(title: 'add_to_basket'.tr, onPressed: () {
                controller.onAddToBasket(product);
              },)
            ],
          ),
        ),
      ),
    );
  }
}