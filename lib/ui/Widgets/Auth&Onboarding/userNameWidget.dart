import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsernameTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? iconPath;
  final bool showArrowIcon;
  final VoidCallback? onArrowPressed; //  معاملة جديدة للضغط على الأيقونة

  const UsernameTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.iconPath,
    this.showArrowIcon = false,
    this.onArrowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ?? 'Enter your username',
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 16,
          fontFamily: 'Nunito',
        ),
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: iconPath != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  iconPath!,
                  width: 24,
                  height: 24,
                ),
              )
            : null,
        suffixIcon: showArrowIcon
            ? GestureDetector(
                //  جعل الأيقونة قابلة للنقر
                onTap: onArrowPressed, //  تنفيذ الدالة عند الضغط
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
    );
  }
}
