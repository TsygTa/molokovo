import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/product_details_controller.dart';
import 'package:site_molokovo/controllers/products_controller.dart';
import 'package:site_molokovo/models/product.dart';
import 'package:site_molokovo/widgets/custom_button.dart';
import 'package:site_molokovo/widgets/custom_image.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/wrap_widget.dart';

class ProductInfoWidget extends GetView<ProductDetailsController> {
  final ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    if(controller.product == null) return Container();
    Product product = controller.product!;
    double width = ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isMediumScreen(context) ? context.width : Get.width / 3.5;
    double height = context.height / 1.7;
    return WrapWidget(
      children: [
        CustomImage(imagePath: product.imagePath, width: width, height: height),
        SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  children: [
                    const SizedBox(height: 10,),
                    product.description.isNotEmpty ? CustomText(text: product.description,) : SizedBox.shrink(),
                    const SizedBox(height: 10,),
                    product.composition.isNotEmpty ? CustomText(text: 'composition'.tr + ': ' + product.composition,) : SizedBox.shrink(),
                    const SizedBox(height: 10,),
                    product.shelfLife.isNotEmpty ? CustomText(text: 'shelf_life'.tr + ': ' + product.shelfLife,) : SizedBox.shrink(),
                    const SizedBox(height: 10,),
                    CustomText(text: 'weight_volume'.tr + ': ' + product.weight, fontWeight: FontWeight.bold,),
                    const SizedBox(height: 10,),
                    CustomText(text: 'price'.tr + ': ' + product.priceToString, fontWeight: FontWeight.bold,),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(width: width * 0.5,child: CustomButton(title: 'add_to_basket'.tr,
                onPressed: () {
                  _productsController.onAddToBasket(product);
                },))
            ],
          ),
        ),
      ],
    );
  }
}