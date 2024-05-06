import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    required this.text,
    super.key,
  });

  final String text;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  bool isVisible = true;
  bool isFirstClick = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (isFirstClick) {
              isFirstClick = false;
            } else {
              isVisible = false;
            }
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isFirstClick
                ? Colors.white
                : Colors.red, // Change color on first click
          ),
        ),
        child: Text(
          widget.text.toUpperCase(),
          style: const TextStyle(
            color: Colors.black26,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
