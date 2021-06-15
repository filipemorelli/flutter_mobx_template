import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.textEditingController,
    required this.validator,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: TextFormField(
        controller: textEditingController,
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
