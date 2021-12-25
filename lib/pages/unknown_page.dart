import 'package:flutter/material.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CustomText(text: '404!', fontSize: 20,),
      ),
    );
  }
}