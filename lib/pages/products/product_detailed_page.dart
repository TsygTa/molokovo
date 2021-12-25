import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/models/product.dart';
import 'package:site_molokovo/widgets/custom_button.dart';
import 'package:site_molokovo/widgets/custom_image.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class ProductDetailedPage extends StatelessWidget {
  const ProductDetailedPage(this.product, this.onAddToBasket, {Key? key}) : super(key: key);
  final Product product;
  final void Function(Product) onAddToBasket;

  @override
  Widget build(BuildContext context) {
    double width = context.width * 0.5;
    double height = context.height * 0.5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomImage(imagePath: product.imagePath, width: width * 0.5, height: height),
        SizedBox(
          width: width * 0.5,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close,size: 30, color: Color(activeColor),),
                      splashRadius: 15,),
                  ],
                ),
                CustomText(text: product.name, fontSize: 30, fontWeight: FontWeight.bold,),
                const SizedBox(height: 20,),
                product.shelfLife.isNotEmpty ? CustomText(text: 'shelf_life'.tr + ': ' + product.shelfLife, maxLines: 20,) : SizedBox.shrink(),
                const SizedBox(height: 10,),
                product.composition.isNotEmpty ? CustomText(text: 'composition'.tr + ': ' + product.composition, maxLines: 100,) : SizedBox.shrink(),
                const SizedBox(height: 10,),
                product.description.isNotEmpty ? CustomText(text: product.description, maxLines: 100,) : SizedBox.shrink(),
                const SizedBox(height: 10,),
                CustomText(text: 'weight_volume'.tr + ': ' + product.weight, fontWeight: FontWeight.bold,),
                const SizedBox(height: 10,),
                CustomText(text: 'price'.tr + ': ' + product.priceToString, fontWeight: FontWeight.bold,),
                const SizedBox(height: 20,),
                SizedBox(width: width * 0.5,child: CustomButton(title: 'add_to_basket'.tr,
                  onPressed: () {
                    onAddToBasket(product);
                  },))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
