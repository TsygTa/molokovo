import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/basket_controller.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class BasketButton extends GetView<BasketController> {
  BasketButton(this.key);

  final GlobalKey<ScaffoldState>? key;

  void _onPressed() {
    //key?.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    if(ResponsiveWidget.isLargeScreen(context)) {
      return ElevatedButton(
        key: Key('basketBigButton'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          primary: Color(activeColor),
          onPrimary: Color(lightColor),
        ),
        onPressed: _onPressed,
        child: GetBuilder<BasketController>(
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart_outlined),
                    SizedBox(width: 8,),
                    CustomText(text: 'basket'.tr + ' | ' +
                        controller.productsCounter.toStringAsFixed(0)),
                  ],
                ),
              );
            }
        ),
      );
    } else {
      return Padding(
        key: Key('basketButton'),
        padding: const EdgeInsets.only(right: 20),
        child: IconButton(
          icon: Icon(Icons.shopping_cart_outlined, color: Color(activeColor), size: 30,),
          onPressed: _onPressed,
        ),
      );
    }
  }
}