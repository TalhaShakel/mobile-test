import 'package:flutter/material.dart';


class TextWidgets
{
  static heading1(String text, Color color)
  {
    return  Text(
      text,
      style: TextStyle(
        fontSize: 36,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

}