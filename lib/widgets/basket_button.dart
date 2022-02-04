import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/basket_controller.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class BasketButton extends StatelessWidget {
  BasketButton(this.scaffoldKey);

  final GlobalKey<ScaffoldState>? scaffoldKey;

  void _onPressed() {
    scaffoldKey?.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    if(ResponsiveWidget.isLargeScreen(context)) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            primary: const Color(activeColor),
            onPrimary: const Color(lightColor),
          ),
          onPressed: _onPressed,
          child: GetBuilder<BasketController>(
              builder: (controller) {
                return Row(
                  children: [
                    const Icon(Icons.shopping_cart_outlined),
                    const SizedBox(width: 8,),
                    CustomText(text: 'basket'.tr + ' | ' +
                        controller.productsNumber),
                  ],
                );
              }
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: GetBuilder<BasketController>(
            builder: (controller) {
            return ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(lightColor)),
                elevation: MaterialStateProperty.all(0)
              ),
              onPressed: _onPressed,
              icon: const Icon(Icons.shopping_cart_outlined, color: Color(activeColor), size: 30,),
              label: CustomText(text: controller.productsNumber)
            );
          }
        )
      );
    }
  }
}