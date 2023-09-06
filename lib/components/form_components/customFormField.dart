import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  late final String textFormTitle;
  late final IconData fieldIcon;
  late final String hint;
  Function updateFormValueToState;
  CustomFormField(this.textFormTitle, this.fieldIcon, this.hint,
      this.updateFormValueToState,
      {super.key});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(widget.fieldIcon),
        hintText: widget.hint,
        labelText: widget.textFormTitle,
      ),
      onSaved: (value) {
        widget.updateFormValueToState(int.parse(value!));
      },
    );
  }
}
