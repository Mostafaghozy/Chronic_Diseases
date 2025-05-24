import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Password_Widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/SocialButton_widget.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/emailWidget.dart';

import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/DoneResetPassword.dart';
import 'package:chronic_diseases/ui/screen/Auth/ResetPassword/resetPassword.dart';
import 'package:chronic_diseases/ui/screen/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chronic_diseases/models/Login/state.dart';
import 'package:chronic_diseases/models/Login/cubit.dart';

class Loginscreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          // Navigate to home screen or next screen after successful login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Doneresetpassword()),
          );
        } else if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed. Please check your credentials.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('LOGIN',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito')),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/mediva login top-right.svg'),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Transform.translate(
                  offset: Offset(10, 5),
                  child: Text("Email Address or Username",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20,
                ),
                EmailWidget(
                  hintText: 'Username or email',
                  controller: _emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                Transform.translate(
                  offset: Offset(10, 5),
                  child: Text("Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20,
                ),
                PasswordWidget(
                  showConfirmPassword: false,
                  controller: _passwordController,
                ),
                Transform.translate(
                  offset: Offset(0, -30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Resetpassword(),
                            ),
                          );
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                              color: Color(0xFF99BF80),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Button(
                  text: "Login",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePageView(),
                      ),
                    );
                  },
                ),
                // BlocBuilder<LoginCubit, LoginState>(
                //   builder: (context, state) {
                //     return Button(
                //       text: 'Login',
                //       isLoading: state is LoadingLoginState,
                //       onPressed: () {
                //         if (_emailController.text.isNotEmpty &&
                //             _passwordController.text.isNotEmpty) {
                //           context.read<LoginCubit>().login(
                //                 _emailController.text,
                //                 _passwordController.text,
                //               );
                //         } else {
                //           ScaffoldMessenger.of(context).showSnackBar(
                //             SnackBar(
                //               content: Text('Please fill all fields'),
                //               backgroundColor: Colors.red,
                //             ),
                //           );
                //         }
                //       },
                //     );
                //   },
                // ),
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: SvgPicture.asset(
                  'assets/icons/OR.svg',
                  width: 290,
                  height: 10,
                )),
                SizedBox(
                  height: 20,
                ),
                SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
