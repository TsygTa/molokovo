import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/basket_controller.dart';
import 'package:site_molokovo/widgets/basket/basket_item_widget.dart';
import 'package:site_molokovo/widgets/custom_button.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class BasketForm extends GetView<BasketController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasketController>(
        builder: (_) {
          if (controller.basketIsEmpty) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.close, size: 30, color: Color(activeColor),),
                      splashRadius: 15,),
                  ),
                  SizedBox(
                    height: context.height * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined, size: 60,
                          color: Color(activeColor),),
                        CustomText(text: 'empty_basket'.tr, fontSize: 24,),
                        CustomButton(
                          title: 'back_to_menu'.tr,
                          onPressed: () => controller.gotoProducts(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.close, size: 30, color: Color(activeColor),),
                        splashRadius: 15,),
                ),
                const SizedBox(height: 20,),
                CustomText(text: 'summary_1'.tr + controller.productsNumber + 'summary_2'.tr + controller.total + ' ' + 'rub'.tr,
                  fontSize: 20, ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                    child: ListView.separated(
                      itemCount: controller.items.length,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 2,
                        );
                      },
                      itemBuilder: (context, index) {
                        return BasketItemWidget(
                          item: controller.items[index],
                          onAdd: () =>
                              controller.addProduct(
                                  controller.items[index].product),
                          onRemove: () =>
                              controller.deleteProduct(
                                  controller.items[index].product),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'order_total'.tr, fontSize: 20, ),
                      CustomText(text: controller.total + ' ' + 'rub'.tr, fontSize: 20, ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 10, 30, 50),
                  child: CustomButton(
                    title: 'make_order'.tr,
                    onPressed: () => controller.makeOrder(),
                  ),
                ),
              ],
            );
          }
        });
  }
}