import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String text;
  final double opacity;
  final double size;
  final Function action;

  Result({Key? key, opacity, required this.text, required this.action, size})
      : opacity = opacity ?? 1.0,
        size = size ?? 25,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => action(),
        child: Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
          child: FittedBox(
              child: AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 150),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 150),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: size),
                    ),
                  ))),
        ));
  }
}
