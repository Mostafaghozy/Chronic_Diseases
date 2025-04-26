import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSocialButton(
          "Sign in with Google",
          "assets/icons/button/Google.svg",
          () => _launchURL("https://accounts.google.com/signin"),
        ),
        SizedBox(height: 15),
        _buildSocialButton(
          "Sign in with Apple",
          "assets/icons/button/Apple.svg",
          () => _launchURL("https://appleid.apple.com/auth/authorize"),
        ),
        SizedBox(height: 30),
        Text(
          "Haven’t Signed Up Yet?",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'Nunito',
          ),
        ),
        GestureDetector(
          onTap: () {
            print("Create an account");
            //Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SignUp(),
            //   ),
            // );
          },
          child: Text(
            "Create an account",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF518C26),
              fontFamily: 'Nunito',
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(
      String text, String iconPath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Color(0xFFE5E7EB)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 10),
              SvgPicture.asset(iconPath, height: 24, width: 24),
              SizedBox(width: 50),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }
}
