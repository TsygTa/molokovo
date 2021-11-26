import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/models/product.dart';
import 'package:site_molokovo/pages/products/product_detailed_widget.dart';
import 'package:site_molokovo/widgets/custom_button.dart';
import 'package:site_molokovo/widgets/custom_image.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget(this.product, this.onAddToBasket);
  final Product product;
  final void Function(Product) onAddToBasket;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDetailed(context, widget.product, widget.onAddToBasket);
      },
      borderRadius: BorderRadius.circular(10),
      hoverColor: Color(activeColor).withOpacity(0.3),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Color(activeColor),
            width: 0.5,
          ),
        ),
        color: Color(lightColor),
        child: Container(
          width: ResponsiveWidget.isSmallScreen(context) ? context.width : 250,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(imagePath: widget.product.imagePath, width: 200, height: 200),
              SizedBox(height: 20,),
              CustomText(text: widget.product.name, fontWeight: FontWeight.bold,),
              SizedBox(height: 20,),
              CustomText(text: 'weight_volume'.tr + ': ' + widget.product.weight,),
              SizedBox(height: 20,),
              CustomText(text: 'price'.tr + ': ' + widget.product.priceToString,),
              SizedBox(height: 20,),
              CustomButton(title: 'add_to_basket'.tr, onPressed: () {
                widget.onAddToBasket(widget.product);
              },)
            ],
          ),
        ),
      ),
    );
  }
}