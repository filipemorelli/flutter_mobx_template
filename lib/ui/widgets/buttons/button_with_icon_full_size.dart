import 'package:flutter/material.dart';

class ButtonWithIconFullSize extends StatelessWidget {
  const ButtonWithIconFullSize({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 36,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
