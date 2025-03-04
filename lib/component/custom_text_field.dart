import 'package:flutter/material.dart';
import 'package:flutter_codefactory_practice/const/const.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool expand;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  const CustomTextField({
    super.key,
    required this.label,
    this.expand = false,
    required this.onSaved,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: primatyColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (!expand) renderTextFormField(),
        if (expand)
          Expanded(
            child: renderTextFormField(),
          ),
      ],
    );
  }

  renderTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
      onSaved: onSaved,
      validator: validator,
      maxLines: expand ? null : 1,
      minLines: expand ? null : 1,
      expands: expand,
      cursorColor: Colors.grey,
    );
  }
}
