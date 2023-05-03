import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recyclex/app/app_router.dart';

import '../business_logic/cubit/auth/auth_cubit.dart';
import '../resources/color_manager.dart';
import '../widgets/auth/auth_button.dart';
import '../widgets/auth/email_text_field.dart';
import '../widgets/auth/password_text_field.dart';
import '../widgets/auth/welcome_text.dart';

class AuthSignUpScreen extends StatelessWidget {
  const AuthSignUpScreen({Key? key}) : super(key: key);

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
                          children: const [
                            EmailTextField(),
                            PasswordTextField(),
                            PasswordTextField(),
                            AuthButton(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                InkWell(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, RouteNames.authLogInRoute),
                    child: const Text(
                      'سجل دخول حساب حالي',
                      style: TextStyle(color: ColorManager.mainColor),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
