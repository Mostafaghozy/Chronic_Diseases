import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailWidget extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Function(String email, bool isValid)? onChanged;

  const EmailWidget({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
  });

  @override
  _EmailWidgetState createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  bool _isEmailValid = false;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _emailController.dispose();
    }
    super.dispose();
  }

  void _checkEmailValidity(String email) {
    setState(() {
      _isEmailValid =
          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(email);
    });
    widget.onChanged?.call(email, _isEmailValid);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        controller: _emailController,
        onChanged: _checkEmailValidity,
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'Enter your email',
          hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
          filled: true,
          fillColor: Colors.grey[200],
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              _isEmailValid
                  ? 'assets/icons/signup/green/Message-GREEN.svg'
                  : 'assets/icons/signup/Message.svg',
              width: 20,
              height: 20,
            ),
          ),
          suffixIcon: _isEmailValid
              ? Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    'assets/icons/signup/green/Done_round.svg',
                    width: 18,
                    height: 18,
                    color: Colors.green,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }
}
