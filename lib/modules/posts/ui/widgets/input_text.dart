import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'type the text to you post',
          border: OutlineInputBorder(),
        ),
        maxLines: 3,
        validator: validator,
      ),
    );
  }
}
