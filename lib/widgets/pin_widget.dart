import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:site_molokovo/constants/style.dart';

import 'custom_text.dart';

class PinWidget extends StatefulWidget {
  PinWidget({ this.isWrongCode = false,
    required this.onComplete});
  final void Function(String value) onComplete;
  bool isWrongCode;

  @override
  State<PinWidget> createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {

  static const int _length = 4;
  final List<TextEditingController> _pinControllers = [];

  @override
  void initState() {
    for(int i = 0 ; i < _length; i++) {
      _pinControllers.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void dispose() {
    _pinControllers.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 50,
          child: ListView.separated(
            clipBehavior: Clip.antiAlias,
            scrollDirection: Axis.horizontal,
            itemCount: _length,
            itemBuilder: (context, index) {
              return _buildItem(context,index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10,);
            },),
        ),
        widget.isWrongCode
        ? CustomText(text: 'auth_failed'.tr, color: Colors.red,)
        : SizedBox.shrink(),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        autofocus: true,
        controller: _pinControllers[index],
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'\b[0-9]\b')),
        ],
        autocorrect: false,
        onChanged: (text) {
          _onChanged(context, index);
        },
        textAlignVertical: TextAlignVertical.bottom,
        maxLines: 1,
        style: TextStyle(fontSize: 18, color: widget.isWrongCode ? Colors.red : Color(darkColor)),
        decoration: InputDecoration(
          isDense: false,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(activeColor),)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void _onChanged(BuildContext context, int index) {
    if(_pinControllers.where((element) => element.text.isNotEmpty).length == _length) {
      String result = _pinControllers.map((e) => e.text).join();
      widget.onComplete(result);
    } else {
      if(widget.isWrongCode) {
        setState(() {
          widget.isWrongCode = false;
        });
      }
      FocusScope.of(context).nextFocus();
    }
  }
}