import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        margin: const EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            text.tr,
            style: const TextStyle(fontFamily: 'bold', color: Colors.white),
          ),
        ),
      ),
    );
  }
}
