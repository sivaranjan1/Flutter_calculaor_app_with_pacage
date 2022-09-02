import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final color;
  final Textcolor;
  final name;
  final ontapped;

  Buttons({this.color, this.Textcolor, this.name, this.ontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                name,
                style: TextStyle(color: Textcolor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
