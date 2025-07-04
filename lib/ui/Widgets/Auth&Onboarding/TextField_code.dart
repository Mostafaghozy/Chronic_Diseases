import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPForm extends StatefulWidget {
  final Function(String)? onCodeChanged;
  final Function(String)? onCodeCompleted;

  const OTPForm({super.key, this.onCodeChanged, this.onCodeCompleted});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  late final List<TextEditingController> controllers;
  late final List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (_) => TextEditingController());
    focusNodes = List.generate(6, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: 8,
        alignment: WrapAlignment.center,
        children: List.generate(6, (index) {
          return SizedBox(
            width: 50,
            height: 50,
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (index < 5) {
                    FocusScope.of(context).nextFocus();
                  }
                  if (widget.onCodeChanged != null) {
                    widget.onCodeChanged!(
                      controllers.map((c) => c.text).join(),
                    );
                  }
                  if (controllers.every((c) => c.text.isNotEmpty) &&
                      widget.onCodeCompleted != null) {
                    widget.onCodeCompleted!(
                      controllers.map((c) => c.text).join(),
                    );
                  }
                } else if (index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Colors.black, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: ColorsManger.OnBoarding,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: ColorsManger.OnBoarding,
                    width: 1.5,
                  ),
                ),
                counterText: '',
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          );
        }),
      ),
    );
  }

  // Removed helper methods for pure UI
}
