import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:chronic_diseases/models/confirmationCode/cubit.dart';
import 'package:chronic_diseases/models/confirmationCode/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPForm extends StatelessWidget {
  final Function(String)? onCodeChanged;
  final Function(String)? onCodeCompleted;

  const OTPForm({
    super.key,
    this.onCodeChanged,
    this.onCodeCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers =
        List.generate(4, (_) => TextEditingController());
    final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return SizedBox(
            width: 64,
            height: 64,
            child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              builder: (context, state) {
                return TextField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      if (index < 3) {
                        FocusScope.of(context).nextFocus();
                      }

                      // Update current code in cubit
                      context
                          .read<ResetPasswordCubit>()
                          .updateCodeAtIndex(index, value);

                      // Notify about code change
                      if (onCodeChanged != null) {
                        onCodeChanged!(_getCurrentCode(controllers));
                      }

                      // Check if all fields are filled
                      if (_isAllFieldsFilled(controllers) &&
                          onCodeCompleted != null) {
                        onCodeCompleted!(_getCurrentCode(controllers));
                      }
                    } else if (index > 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: _isAllFieldsFilled(controllers)
                            ? ColorsManger.green
                            : Colors.grey,
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
                );
              },
            ),
          );
        }),
      ),
    );
  }

  String _getCurrentCode(List<TextEditingController> controllers) {
    return controllers.map((c) => c.text).join();
  }

  bool _isAllFieldsFilled(List<TextEditingController> controllers) {
    return controllers.every((c) => c.text.isNotEmpty);
  }
}
