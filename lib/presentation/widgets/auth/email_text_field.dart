import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:provider/provider.dart';

import '../../../presentation/business_logic/cubit/auth/auth_cubit.dart';
import '../../resources/color_manager.dart';
import 'auth_strings.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

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
        validator: (value) => (value == null || !value.contains('@'))
            ? AuthStrings.validatorEmptyEmailText
            : null,
        onChanged: read.setEmailAddress,
        decoration: InputDecoration(
          hintText: AuthStrings.emailTextFieldHintText,
          hintStyle: const TextStyle(color: ColorManager.darkGrey),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: ColorManager.transparent)),
          filled: true,
          fillColor: Colors.transparent,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
