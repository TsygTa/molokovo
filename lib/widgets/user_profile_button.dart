import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/app_route.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/controllers/app_pages_controllers.dart';
import 'package:site_molokovo/controllers/auth_controller.dart';
import 'package:site_molokovo/models/user.dart';

class UserProfileButton extends StatelessWidget {

  void _onPressed(BuildContext context) {
    AppPagesController pagesController = Get.find<AppPagesController>();
    pagesController.setPage(AppRoute.userProfile);
  }

  @override
  Widget build(BuildContext context) {
    User? user = Get.find<AuthController>().user;
    if(user == null) return Container();
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: IconButton(
        icon: Icon(Icons.face, color: Color(darkColor), size: 30, semanticLabel: user.name,),
        onPressed: () {
          _onPressed(context);
        },
      ),
    );
  }
}