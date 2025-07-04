import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordWidget extends StatefulWidget {
  final bool showConfirmPassword;
  final TextEditingController? controller;
  final Function(String, String)? onPasswordsChanged;

  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;

  final String? passwordLabel;
  final String? confirmPasswordLabel;

  // Add these parameters to control validation visuals externally
  final bool? isPasswordValid;
  final bool? doPasswordsMatch;

  const PasswordWidget({
    super.key,
    this.showConfirmPassword = true,
    this.controller,
    this.onPasswordsChanged,
    this.passwordController,
    this.confirmPasswordController,
    this.passwordLabel,
    this.confirmPasswordLabel,
    this.isPasswordValid,
    this.doPasswordsMatch,
  });

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _passwordController =
        widget.passwordController ??
        widget.controller ??
        TextEditingController();
    _confirmPasswordController =
        widget.confirmPasswordController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.passwordController == null && widget.controller == null) {
      _passwordController.dispose();
    }
    if (widget.confirmPasswordController == null) {
      _confirmPasswordController.dispose();
    }
    super.dispose();
  }

  void _notifyPasswordChange() {
    if (widget.onPasswordsChanged != null) {
      widget.onPasswordsChanged!(
        _passwordController.text,
        _confirmPasswordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPasswordValid = widget.isPasswordValid ?? false;
    final doPasswordsMatch = widget.doPasswordsMatch ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ====== Password Label ======
          if (widget.passwordLabel != null) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.passwordLabel!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],

          // ====== Password Field ======
          _buildPasswordField(
            hintText: widget.showConfirmPassword ? 'New Password' : 'Password',
            prefixIcon: Transform.scale(
              scale: 0.5,
              child: SvgPicture.asset(
                isPasswordValid
                    ? 'assets/icons/signup/green/Lock-GREEN.svg'
                    : 'assets/icons/signup/Lock.svg',
              ),
            ),
            controller: _passwordController,
            onChanged: (value) {
              _notifyPasswordChange();
            },
            isObscure: _obscureNewPassword,
            toggleObscure: () {
              setState(() {
                _obscureNewPassword = !_obscureNewPassword;
              });
            },
          ),

          if (widget.showConfirmPassword) ...[
            const SizedBox(height: 15),

            // ====== Confirm Password Label ======
            if (widget.confirmPasswordLabel != null) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.confirmPasswordLabel!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],

            // ====== Confirm Password Field ======
            _buildPasswordField(
              hintText: 'Confirm Password',
              prefixIcon: Transform.scale(
                scale: 0.5,
                child: SvgPicture.asset(
                  doPasswordsMatch
                      ? 'assets/icons/signup/green/Lock-GREEN.svg'
                      : 'assets/icons/signup/Lock.svg',
                ),
              ),
              controller: _confirmPasswordController,
              onChanged: (value) {
                _notifyPasswordChange();
              },
              isObscure: _obscureConfirmPassword,
              toggleObscure: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
          ],
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required String hintText,
    required Widget prefixIcon,
    required TextEditingController controller,
    required Function(String) onChanged,
    required bool isObscure,
    required VoidCallback toggleObscure,
  }) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontFamily: 'Nunito-SemiBold.ttf',
          fontSize: 13,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/signup/View_alt_fill.svg',
            width: 24,
            height: 24,
            color: Colors.grey,
          ),
          onPressed: toggleObscure,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
      ),
    );
  }
}
