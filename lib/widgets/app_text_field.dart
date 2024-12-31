import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final TextInputType inputType;
  final String? Function(String?)? validator;

  const AppTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isPassword = false,
      this.inputType = TextInputType.text,
      this.validator});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4,
        ),
        ValueListenableBuilder<bool>(
            valueListenable: isPasswordVisible,
            builder: (context, isVisible, child) {
              return TextFormField(
                controller: controller,
                obscureText: isPassword && !isVisible,
                keyboardType: inputType,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    suffixIcon: isPassword
                        ? IconButton(
                            onPressed: () {
                              isPasswordVisible.value = !isVisible;
                            },
                            icon: Icon(isVisible
                                ? Icons.visibility
                                : Icons.visibility_off))
                        : null),
                validator: validator,
              );
            }),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
