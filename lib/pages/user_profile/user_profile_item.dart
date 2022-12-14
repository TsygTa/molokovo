import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class UserProfileItem extends StatefulWidget {
  const UserProfileItem({this.label, this.isEditable = false, this.onSubmit, this.regExp, this.initialValue, this.maxLines = 1});

  final String? label;
  final String? initialValue;
  final bool isEditable;
  final void Function(String)? onSubmit;
  final RegExp? regExp;
  final int maxLines;

  @override
  State<UserProfileItem> createState() => _UserProfileItemState();
}

class _UserProfileItemState extends State<UserProfileItem> {

  final TextEditingController _textController = TextEditingController();
  bool _isEdit = false;
  bool _isSaveEnabled = false;

  late String _oldValue;

  @override
  void initState() {
    _textController.text = widget.initialValue ?? '';
    _oldValue = _textController.text;
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double width = ResponsiveWidget.isSmallScreen(context) || ResponsiveWidget.isMediumScreen(context) ? context.width : context.width / 3;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              enabled: _isEdit,
              controller: _textController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                bool isValid = value != null && value.isNotEmpty;
                if(isValid && widget.regExp != null) {
                  isValid = widget.regExp!.hasMatch(value);
                }
                if (isValid != _isSaveEnabled) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    setState(() {
                      _isSaveEnabled = isValid;
                    });
                  });
                }
              },
              autocorrect: false,
              textAlignVertical: TextAlignVertical.bottom,
              maxLines: widget.maxLines,
              style: const TextStyle(fontSize: 14, color: Color(darkColor)),
              decoration: InputDecoration(
                label: CustomText(text: widget.label, fontSize: 14,),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(activeColor),)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          widget.isEditable
              ? IconButton(
                  onPressed: _isEdit ? (_isSaveEnabled ? _onSave : null) : _onChange,
                  icon: Icon(_isEdit ? Icons.save_outlined : Icons.edit, color: Color(activeColor), size: 30,),
                  splashRadius: 30,
                )
              : const SizedBox(width: 40,),
          _isEdit
            ? IconButton(
                onPressed: _onCancel,
                icon: const Icon(Icons.cancel_outlined, color: Color(activeColor), size: 30,),
                splashRadius: 30,
              )
            : const SizedBox(width: 40,),
        ],
      ),
    );
  }

  void _onChange() {
    setState(() {
      _isEdit = true;
    });
  }

  void _onSave() {
    setState(() {
      _isEdit = false;
      _isSaveEnabled = false;
    });
    if(widget.onSubmit != null) {
      _oldValue = _textController.text;
      widget.onSubmit!(_textController.text);
    }
  }

  void _onCancel() {
    _textController.text = _oldValue;
    setState(() {
      _isEdit = false;
    });
  }
}