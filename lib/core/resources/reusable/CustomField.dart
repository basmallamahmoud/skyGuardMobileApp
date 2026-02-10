import 'package:flutter/material.dart';

import 'package:skyguardmobileapp/core/resources/reusable/AssetsManager.dart';

class CustomField extends StatefulWidget {
  final String title;
  final String icon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomField({
    super.key,
    required this.icon,
    required this.title,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? !isVisible : false,

      decoration: InputDecoration(
        hintText: widget.title,

        /// prefix icon
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child:  Image.asset(
            widget.icon,
            height: 22,
            width: 22,
          ),
        ),

        /// password eye icon
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: Image.asset(
            AssetsManager.visible,
            height: 22,
            width: 22,
          ),
        )
            : null,

        /// borders
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        contentPadding:
        const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
    );
  }
}