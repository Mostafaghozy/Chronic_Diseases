import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsCircleCheckbox extends StatefulWidget {
  final ValueChanged<bool>? onChanged; // 👈 معاملة جديدة لتتبع تغيير الحالة

  const TermsCircleCheckbox({
    super.key,
    this.onChanged,
  });

  @override
  _TermsCircleCheckboxState createState() => _TermsCircleCheckboxState();
}

class _TermsCircleCheckboxState extends State<TermsCircleCheckbox> {
  bool isChecked = false;

  void _openLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
              if (widget.onChanged != null) {
                widget.onChanged!(isChecked); // 👈 إرسال الحالة الجديدة
              }
            });
          },
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey[400]!,
                width: 1,
              ),
            ),
            child: isChecked
                ? Center(
                    child: Icon(
                      Icons.check,
                      size: 22,
                      color: Color(0xFF518C26),
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'By signing up, you agree to our ',
              style: TextStyle(color: Colors.black, fontSize: 14),
              children: [
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                      color: Color(0xFF518C26), fontWeight: FontWeight.w300),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _openLink('https://example.com/terms');
                    },
                ),
                TextSpan(
                  text: ' and ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: TextStyle(
                      color: Color(0xFF518C26), fontWeight: FontWeight.w300),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _openLink('https://example.com/privacy');
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
