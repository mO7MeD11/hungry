import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.isPassword = false,
    required this.textController,
    required this.hint,
  });
  final bool isPassword;
  final TextEditingController textController;
  final String hint;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;

  @override
  void initState() {
    isObscure = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'value is required';
        }
        return null;
      },

      controller: widget.textController,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: widget.hint,
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        focusColor: AppColors.kPColor,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: isObscure
                    ? Icon(CupertinoIcons.eye_slash)
                    : Icon(CupertinoIcons.eye),
              )
            : null,
        filled: true,
      ),
      cursorColor: Colors.black,
    );
  }
}
