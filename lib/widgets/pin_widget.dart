import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:site_molokovo/constants/style.dart';

class PinWidget extends StatelessWidget {
  PinWidget({ this.pinColor = const Color(darkColor), this.onComplete});
  final Color pinColor;
  final void Function (String value)? onComplete;

  static const int length = 4;
  final List<TextEditingController> _pinControllers = List<TextEditingController>.filled(length, TextEditingController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: length,
        itemBuilder: (context, index) {
          return _buildItem(context,index);
        });
  }

  Widget _buildItem(BuildContext context, int index) {
    return SizedBox(
      width: 40,
      height: 40,
      child: TextField(
        controller: _pinControllers[index],
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'd{1}')),
        ],
        autocorrect: false,
        onChanged: (text) {
          _onChanged(context, index);
        },
        textAlignVertical: TextAlignVertical.bottom,
        maxLines: 1,
        style: TextStyle(fontSize: 18, color: pinColor),
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
    if(_pinControllers.where((element) => element.text.isNotEmpty).length == length) {
      String result = '';
      _pinControllers.forEach((element) {
        result += element.text;
      });
      if(onComplete != null) onComplete!(result);
    } else {
      FocusScope.of(context).nextFocus();
    }
  }
}