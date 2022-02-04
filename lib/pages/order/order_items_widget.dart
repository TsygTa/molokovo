import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/basket_controller.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/page_title_widget.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class OrderItemsWidget extends GetView<BasketController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasketController>(
      builder: (_) {
        return SizedBox(
          width: ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isMediumScreen(context) ? context.width : context.width / 4,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitleWidget(title: 'order_items'.tr, fontSize: 28, isBorder: false,),
                Container(
                  height: context.height * 0.3,
                  child: ListView(
                    children: controller.items.map((item) =>
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(text: item.product.name),
                                item.quantity > 1
                                  ? CustomText(text:  item.quantity.toString() + ' x ' + item.product.price.toString())
                                  : CustomText(text:  item.product.price.toString()),
                            ],
                          ),
                        )).toList(),
                  ),
                ),
                const Divider(thickness: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(text: 'order_total'.tr, fontSize: 20),
                    CustomText(text: controller.total + ' ' + 'rub'.tr, fontSize: 20),
                  ],
                ),
              ]
          ),
        );
      }
    );
  }
}