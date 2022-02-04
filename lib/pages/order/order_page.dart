import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/basket_controller.dart';
import 'package:site_molokovo/pages/order/order_info_widget.dart';
import 'package:site_molokovo/pages/order/order_items_widget.dart';
import 'package:site_molokovo/pages/order/order_payment_widget.dart';
import 'package:site_molokovo/widgets/custom_button.dart';
import 'package:site_molokovo/widgets/footer.dart';
import 'package:site_molokovo/widgets/page_layout.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';
import 'package:site_molokovo/widgets/wrap_widget.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WrapWidget(
              children: [
                OrderInfoWidget(),
                OrderItemsWidget()
              ]
            ),
            const SizedBox(height: 40,),
            OrderPaymentWidget(),
            const SizedBox(height: 20,),
            Center(
              child: GetBuilder<BasketController>(
                builder: (controller) {
                  return SizedBox(
                    width: ResponsiveWidget.isSmallScreen(context) ? context.width : context.width / 3,
                    child: CustomButton(
                      title: 'make_order'.tr + 'summary_2'.tr + controller.total.toString() + ' ' + 'rub'.tr,
                      onPressed: () {
                        //controller.makePayment();
                      },
                    ),
                  );
                }
              ),
            )
          ],
        ), 
        footer: Footer());
  }
}