import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/controllers/basket_controller.dart';
import 'package:site_molokovo/models/basket_item.dart';
import 'package:site_molokovo/widgets/custom_text.dart';


class BasketItemWidget extends StatelessWidget {
  BasketItemWidget({required this.item, required this.onAdd, required this.onRemove});
  final BasketItem item;
  final void Function() onAdd;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(item.product.imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.fitWidth),
            const SizedBox(width: 10),
            CustomText(text: item.product.name),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: item.totalToString, fontWeight: FontWeight.bold,),
            _buildCounter(item.quantity)
          ],
        )
      ],
    );
  }

  Widget _buildCounter(int quantity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: onRemove, icon: Icon(Icons.remove, size: 20,)),
        CustomText(text: quantity.toString(), fontSize: 20,),
        IconButton(onPressed: onAdd, icon: Icon(Icons.add, size: 20,)),
      ],
    );
  }
}