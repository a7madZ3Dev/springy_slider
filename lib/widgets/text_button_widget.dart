import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final bool isOnLight;
  const TextButtonWidget({
    Key? key,
    required this.text,
    required this.isOnLight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: isOnLight ? Theme.of(context).primaryColor : Colors.white),
      ),
    );
  }
}
