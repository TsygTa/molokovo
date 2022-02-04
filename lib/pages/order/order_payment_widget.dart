import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/basket_controller.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class OrderPaymentWidget extends GetView<BasketController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasketController>(
      builder: (_) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'payment_type'.tr, fontSize: 28),
              const SizedBox(height: 20,),
              Column(
                children: [
                  RadioListTile<PaymentType>(
                    title: CustomText(text: 'by_cart_on_site'.tr),
                    value: PaymentType.byCartOnSite,
                    activeColor: Color(activeColor),
                    groupValue: controller.paymentType,
                    onChanged: (value) {
                      if(value != null) {
                        controller.setPaymentType(value);
                      }
                    }
                  ),
                  RadioListTile<PaymentType>(
                      title: CustomText(text: 'by_cash_to_courier'.tr),
                      value: PaymentType.byCashToCourier,
                      activeColor: Color(activeColor),
                      groupValue: controller.paymentType,
                      onChanged: (value) {
                        if(value != null) {
                          controller.setPaymentType(value);
                        }
                      }
                  )
                ],
              ),
            ]
        );
      }
    );
  }

}