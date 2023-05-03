import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recyclex/app/app_router.dart';
import 'package:recyclex/presentation/business_logic/cubit/auth/auth_cubit.dart';
import 'package:recyclex/presentation/business_logic/cubit/cach/cach_cubit.dart';

// import 'package:provider/provider.dart';

import '../../../../presentation/resources/color_manager.dart';
import '../../../app/app_injection.dart';
import 'auth_strings.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
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
              UserCredential userCredential =
                  await context.read<AuthCubit>().signUp();
              String uid = userCredential.user!.uid;
              // ignore: use_build_context_synchronously
              sL<CachCubit>().cachUser(uid);

              // ignore: use_build_context_synchronously
              // await context.read<AuthCubit>().setFireStoreNewUserData(uid);
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, RouteNames.homeRoute);
            } catch (e) {
              SnackBar snackBar = SnackBar(content: Text(e.toString()));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(ColorManager.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child:
              //  watch.isWaiting
              //     ? const CircularProgressIndicator(color: ColorManager.white)
              //     :
              const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Text(
              // watch.currentAuthMode == AuthMode.logIn
              // ?
              //   AuthStrings.buttonTextLogIn,:
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
}
