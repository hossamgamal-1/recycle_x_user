import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/app_injection.dart';
import '../../app/app_router.dart';
import '../business_logic/cubit/auth/auth_cubit.dart';
import '../business_logic/cubit/cach/cach_cubit.dart';
import '../resources/color_manager.dart';
import '../widgets/auth/auth_strings.dart';
import '../widgets/auth/email_text_field.dart';
import '../widgets/auth/password_text_field.dart';
import '../widgets/auth/welcome_text.dart';

class AuthLogInScreen extends StatelessWidget {
  const AuthLogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  child: const WelcomeText(),
                ),
                BlocProvider(
                  create: (context) => AuthCubit(),
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      var read = context.read<AuthCubit>();
                      return Form(
                        key: read.formKey,
                        child: Column(
                          children: [
                            const EmailTextField(),
                            const PasswordTextField(),
                            logInButton(context),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, RouteNames.authSignUpRoute),
                  child: const Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(color: ColorManager.mainColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget logInButton(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(1.25.h),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(210, 0, 251, 255),
          Color.fromARGB(210, 92, 62, 241),
          Color.fromARGB(210, 251, 0, 255),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(50),
    ),
    child: BlocProvider(
      create: (context) => sL<CachCubit>(),
      child: TextButton(
        onPressed: () async {
          try {
            await context.read<AuthCubit>().logIn();

            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, RouteNames.homeRoute);
          } catch (e) {
            SnackBar snackBar = SnackBar(content: Text(e.toString()));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorManager.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Text(
            AuthStrings.buttonTextSignUp,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 18,
              color: ColorManager.white,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    ),
  );
}
