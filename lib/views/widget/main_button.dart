import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({Key? key, required this.onTap, required this.text})
      : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
        ),
        child: Text(text),
      ),
    );
  }
}
