import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final double maginTextToBox;
  final String? hint;
  final bool obscuretext;
  final bool isShowTitle;
  final TextEditingController? controller;

  const CustomFormField({
    super.key,
    required this.title,
    this.maginTextToBox = 8,
    this.hint,
    this.obscuretext = false,
    this.controller,
    this.isShowTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        SizedBox(
          height: maginTextToBox,
        ),
        TextFormField(
          obscureText: obscuretext,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}
