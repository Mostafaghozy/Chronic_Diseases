import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/Button_widget.dart';
import '../../Widgets/Password_Widget.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),

      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Center(
              child: SvgPicture.asset(
                'assets/icons/signup/reset/secure icon-2.svg',
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Create a new password',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Nunito-SemiBold.ttf',
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Please choose a password that hasn\'t been \nused before. Must be at least 8 characters.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 20),
            PasswordWidget(),
            const SizedBox(height: 10),
            CustomButton(
              text: 'Reset password',
              onPressed: () {
                //functions
              },
            ),
          ],
        ),
      ),
    );
  }
}
