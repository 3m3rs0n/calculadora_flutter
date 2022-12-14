import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function action;
  final double width;

  NumberButton(
      {Key? key, color, required this.text, required this.action, width})
      : color = color ?? const Color(0xff333333),
        width = width ?? 65.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var bstyle = TextButton.styleFrom(
        backgroundColor: color,
        primary: Colors.white,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))));

    return Container(
      margin: const EdgeInsets.all(4),
      child: TextButton(
        style: bstyle,
        child: Container(
          width: width,
          height: 50,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
        onPressed: () => action(),
      ),
    );
  }
}
