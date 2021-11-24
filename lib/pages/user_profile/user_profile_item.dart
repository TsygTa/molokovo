import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:site_molokovo/constants/style.dart';
import 'package:site_molokovo/widgets/custom_text.dart';
import 'package:site_molokovo/widgets/responsive_widget.dart';

class UserProfileItem extends StatefulWidget {
  UserProfileItem({this.label, this.isEditable = false, this.onSubmit, this.regExp, this.initialValue});

  final String? label;
  final String? initialValue;
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
    _textController.text = widget.initialValue ?? '';
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
      width: ResponsiveWidget.isSmallScreen(context) ? context.width : context.width / 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText( text: widget.label,),
                const SizedBox(height: 8,),
                Stack(
                  children: [
                    TextFormField(
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
                      maxLines: 1,
                      style: TextStyle(fontSize: 18, color: Color(darkColor)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(activeColor),)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    widget.isEditable
                    ? Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: TextButton(
                        onPressed: _isEdit ? (_isSaveEnabled ? _onSave : null) : _onChange,
                          child: CustomText(text: _isEdit ? 'save'.tr : 'change'.tr, fontSize: 16, color: Color(activeColor),)),
                    )
                    : SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 100,
            child: _isEdit
                ? Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(0, 26, 0, 0),
                    child: TextButton(
                      onPressed: _onCancel,
                      child: CustomText(text: 'cancel'.tr, fontSize: 16, color: Color(activeColor),)
                    ),
                )
                : SizedBox.shrink()
          ),
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