import 'package:flutter/material.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/models/product.dart';
import 'package:site_molokovo/widgets/custom_button.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class ProductDetailedWidget extends StatelessWidget {
  ProductDetailedWidget(this.product, this.onAddToBasket);
  final Product product;
  final void Function(Product) onAddToBasket;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.5,
      height: context.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close,size: 30, color: Color(activeColor),)),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(product.imagePath, width: context.width * 0.20, height: context.height * 0.4,
              fit: BoxFit.contain),
              SizedBox(
                width: context.width * 0.29,
                height: context.height * 0.4,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomText(text: product.name, fontSize: 30, fontWeight: FontWeight.bold,),
                      SizedBox(height: 20,),
                      product.shelfLife.isNotEmpty ? CustomText(text: 'shelf_life'.tr + ': ' + product.shelfLife, maxLines: 20,) : SizedBox.shrink(),
                      SizedBox(height: 10,),
                      product.composition.isNotEmpty ? CustomText(text: 'composition'.tr + ': ' + product.composition, maxLines: 100,) : SizedBox.shrink(),
                      SizedBox(height: 10,),
                      product.description.isNotEmpty ? CustomText(text: product.description, maxLines: 100,) : SizedBox.shrink(),
                      SizedBox(height: 10,),
                      CustomText(text: 'weight_volume'.tr + ': ' + product.weight, fontWeight: FontWeight.bold,),
                      SizedBox(height: 10,),
                      CustomText(text: 'price'.tr + ': ' + product.priceToString, fontWeight: FontWeight.bold,),
                      SizedBox(height: 20,),
                      SizedBox(width: context.width * 0.2,child: CustomButton(title: 'add_to_basket'.tr,
                        onPressed: () {
                          onAddToBasket(product);
                        },))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


Future<void> showDetailed(BuildContext context, Product product, Function(Product) onAddToBasket) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          children: <Widget>[
            ProductDetailedWidget(product, onAddToBasket)
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),),
        );
      }
  );
}