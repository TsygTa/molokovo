import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';

class UserProfileItem extends StatefulWidget {
  UserProfileItem({this.label, this.isEditable = false, this.onSubmit, this.regExp});

  final String? label;
  final bool isEditable;
  final void Function(String)? onSubmit;
  final RegExp? regExp;

  @override
  State<UserProfileItem> createState() => _UserProfileItemState();
}

class _UserProfileItemState extends State<UserProfileItem> {

  final TextEditingController _textController = TextEditingController();
  bool _isEdit = false;
  bool _isSaveEnabled = false;

  @override
  void initState() {
    _isSaveEnabled = widget.regExp == null;
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          enabled: widget.isEditable,
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
          maxLines: 1,
          style: TextStyle(fontSize: 18, color: Color(darkColor)),
          decoration: InputDecoration(
            label: CustomText( text: widget.label, fontSize: 12,),
            suffix: widget.isEditable
                ? TextButton(
                    onPressed: _isEdit ? (_isSaveEnabled ? _onSave : null) : _onChange,
                    child: CustomText(text: _isEdit ? 'save'.tr : 'change'.tr, fontSize: 12, color: Color(activeColor),))
                : null,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(activeColor),)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        _isEdit
        ? TextButton(
            onPressed: _onCancel,
            child: CustomText(text: 'cancel'.tr, fontSize: 12, color: Color(activeColor),))
            : SizedBox.shrink()
      ],
    );
  }

  void _onChange() {
    setState(() {
      _isEdit = true;
    });
  }

  void _onSave() {
    if(widget.onSubmit != null) {
      widget.onSubmit!(_textController.text);
    }
  }

  void _onCancel() {
    _textController.text = '';
    setState(() {
      _isEdit = false;
    });
  }
}