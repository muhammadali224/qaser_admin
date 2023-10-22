import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintTitle;
  final IconData? icon;
  final void Function()? onIconTap;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  final Color? iconColor;

  const InputFormField({
    super.key,
    this.controller,
    required this.hintTitle,
    this.onIconTap,
    this.keyboardType,
    this.validate,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validate,
        style: const TextStyle(color: Colors.black),
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintTitle.tr,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          suffixIcon: IconButton(
            onPressed: onIconTap,
            icon: Icon(
              icon,
              color: iconColor ?? Colors.red,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 1.2),
          ),
        ),
      ),
    );
  }
}