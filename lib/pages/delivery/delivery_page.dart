import 'package:flutter/material.dart';
import 'package:site_molokovo/pages/delivery/delivery_info_widget.dart';
import 'package:site_molokovo/widgets/footer.dart';
import 'package:site_molokovo/widgets/page_layout.dart';


class DeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(body: DeliveryInfoWidget(), footer: Footer());
  }
}