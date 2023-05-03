import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:provider/provider.dart';

import '../../../../business_logic/cubit/auth/auth_cubit.dart';
import '../../resources/color_manager.dart';
import 'auth_strings.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    var read = context.read<AuthCubit>();

    return Container(
      width: 80.w,
      margin: EdgeInsets.all(1.25.h),
      decoration: BoxDecoration(
        color: ColorManager.grey,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        validator: (value) => (value == null || value.length < 8)
            ? AuthStrings.validatorShortPasswordText
            : null,
        onChanged: read.setPassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              // watch.isObsecure = !watch.isObsecure;
            }), //; read.visibleOnOffSwitcher(),
            icon: // watch.isObsecure
                // ? const Icon(Icons.visibility_off)
                // :
                const Icon(Icons.visibility),
            color: ColorManager.darkGrey,
            hoverColor: ColorManager.transparent,
            splashColor: ColorManager.transparent,
          ),
          hintText: AuthStrings.passwordTextFieldHintText,
          hintStyle: const TextStyle(color: ColorManager.darkGrey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorManager.transparent),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        keyboardType: TextInputType.visiblePassword,
        // obscureText: watch.isObsecure,
        // controller: watch.passwordcontroller,
      ),
    );
  }
}
