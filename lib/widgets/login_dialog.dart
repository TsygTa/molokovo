import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginDialog extends StatefulWidget {
  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.height / 3,
      height: context.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'login_dialog_title'.tr, fontSize:   30,),
          SizedBox(height: 20),
          CustomText(text: 'phone_number'.tr, fontSize:   14,),
          TextField(
            controller: _textController,
            inputFormatters: [
              MaskTextInputFormatter(mask: '+7 ### ###-##-##', filter: {'#': RegExp(r'[0-9]')}),
              //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            autocorrect: false,
            onChanged: (text) {
            },
            textAlignVertical: TextAlignVertical.bottom,
            maxLines: 1,
            style: TextStyle(fontSize: 18, color: Color(darkColor)),
            decoration: InputDecoration(
              hintText: '+7 XXX XXX-XX-XX',
              hintStyle: TextStyle(color: Color(darkColor).withOpacity(0.3)),
              isDense: false,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(activeColor),)
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(activeColor),)
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                primary: Color(activeColor),
              ),
              onPressed: _textController.text.isNotEmpty
                  ? null
                  : () {},
              child: CustomText(text: 'send_code'.tr, fontSize: 16, color: Color(lightColor),),
            ),
          ),
          InkWell(
            child: CustomText(text: 'I_agree'.tr, fontSize: 14, color: Color(darkColor),),
            onTap: () => launch('https://www.kgk-global.com/offer'),),
        ],
      ),
    );
  }
}

Future<void> showLoginDialog(BuildContext context) async {

  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          insetPadding: EdgeInsets.all(8),
          children: <Widget>[
            LoginDialog()
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),),
        );
      }
  );
}

