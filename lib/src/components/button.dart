import 'package:caf_sdk/src/settings/colors.dart';
import 'package:flutter/material.dart';

Widget button(String label, void Function() onPressed) {
  return Container(
    height: 50,
    margin: const EdgeInsets.only(top: 20),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
