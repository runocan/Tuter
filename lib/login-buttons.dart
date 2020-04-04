import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton(
    {this.text, this.padding = 120.0});

  final String text;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.symmetric(horizontal: padding),
      fillColor: Colors.black,
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      shape: const StadiumBorder(),
      onPressed: () => null,
    );
  }
}