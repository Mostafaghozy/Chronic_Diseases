import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordWidget extends StatefulWidget {
  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool _isPasswordValid = false;
  bool _doPasswordsMatch = false;
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkPasswordValidity(String password) {
    setState(() {
      _isPasswordValid = password.length >= 8;
      _checkPasswordsMatch();
    });
  }

  void _checkPasswordsMatch() {
    setState(() {
      _doPasswordsMatch =
          _newPasswordController.text == _confirmPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPasswordField(
            hintText: 'New Password',
            prefixIcon: Transform.scale(
              scale: 0.5,
              child: SvgPicture.asset(
                _isPasswordValid && _doPasswordsMatch
                    ? 'assets/icons/signup/green/Lock-GREEN.svg'
                    : 'assets/icons/signup/Lock.svg',
              ),
            ),
            showEyeIcon: true,
            controller: _newPasswordController,
            onChanged: _checkPasswordValidity,
          ),
          SizedBox(height: 20),
          _buildPasswordField(
            hintText: 'Confirm Password',
            prefixIcon: Transform.scale(
              scale: 0.5,
              child: SvgPicture.asset(
                _isPasswordValid && _doPasswordsMatch
                    ? 'assets/icons/signup/green/Lock-GREEN.svg'
                    : 'assets/icons/signup/Lock.svg',
              ),
            ),
            showEyeIcon: true,
            controller: _confirmPasswordController,
            onChanged: (value) {
              _checkPasswordsMatch();
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required String hintText,
    required Widget prefixIcon,
    bool showEyeIcon = false,
    required TextEditingController controller,
    required Function(String) onChanged,
  }) {
    bool _obscureText = true;

    return StatefulBuilder(
      builder: (context, setState) {
        return TextField(
          controller: controller,
          obscureText: _obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText, // النص الذي يظهر داخل الحقل
            hintStyle: TextStyle(
              color: Colors.grey[500], // لون هادئ (رمادي فاتح)
              fontFamily: 'Nunito-SemiBold.ttf', // خط مخصص
              fontSize: 13, // حجم الخط
            ),
            prefixIcon: prefixIcon,
            suffixIcon: showEyeIcon
                ? IconButton(
                    icon: _obscureText
                        ? SvgPicture.asset(
                            'assets/icons/signup/View_alt_fill.svg',
                            width: 24,
                            height: 24,
                            color: Colors.grey,
                          )
                        : SvgPicture.asset(
                            'assets/icons/signup/View_alt_fill.svg',
                            width: 24,
                            height: 24,
                            color: Colors.grey,
                          ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            filled: true,
            fillColor: Color(0xFFE5E7EB),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
        );
      },
    );
  }
}
