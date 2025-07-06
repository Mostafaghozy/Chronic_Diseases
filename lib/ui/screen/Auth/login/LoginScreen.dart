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
import 'package:chronic_diseases/core/user_session.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          // لا تحفظ هنا، الحفظ يتم في cubit بعد جلب اسم المستخدم الحقيقي من السيرفر
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePageView()),
          );
        } else if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
            ),
          ),
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
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Transform.translate(
                  offset: Offset(10, 5),
                  child: Text(
                    "Email Address or Username",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                EmailWidget(
                  hintText: 'Username or email',
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                Transform.translate(
                  offset: Offset(10, 5),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                              builder: (context) => ResetPassword(),
                            ),
                          );
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Color(0xFF99BF80),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoadingLoginState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF99BF80),
                        ),
                      );
                    }
                    return Button(
                      text: "Login",
                      onPressed: () {
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();

                        print('Email: "$email"');
                        print(
                          'Password: "${password.replaceAll(RegExp(r'.'), '*')}"',
                        );
                        print('Email length: ${email.length}');
                        print('Password length: ${password.length}');

                        if (email.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please fill in all fields'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(email)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please enter a valid email address',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        context.read<LoginCubit>().login(email, password);
                      },
                    );
                  },
                ),
                SizedBox(height: 40),
                Center(
                  child: SvgPicture.asset(
                    'assets/icons/OR.svg',
                    width: 290,
                    height: 10,
                  ),
                ),
                SizedBox(height: 20),
                SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
