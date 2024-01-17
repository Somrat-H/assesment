import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void errorShow(String text, context){
  ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(text.toString()),
            duration: const Duration(milliseconds: 1500),
            width: 280.0, // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0, // Inner padding for SnackBar content.
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
}
