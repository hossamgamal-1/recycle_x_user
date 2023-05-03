// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// import '../../../app/app_router.dart';
// import '../../../business_logic/auth_provider.dart';
// import '../../../business_logic/home_page_provider.dart';
// import '../../resources/string_manager.dart';
// import '../../resources/values_manager.dart';

// class AuthFormContent extends StatelessWidget {
//   const AuthFormContent({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     AuthProvider watch = context.watch<AuthProvider>();
//     AuthProvider read = context.read<AuthProvider>();
//     return Padding(
//       padding: EdgeInsets.only(bottom: AppPadding.p1.h),
//       child: Form(
//         key: watch.formKey,
//         child: Column(
//           children: [
//             TextFormField(
//               decoration:
//                   const InputDecoration(hintText: StringManager.emailHintText),
//               validator: (email) {
//                 if (email == null || !email.contains('@')) {
//                   return StringManager.emailValidator;
//                 }
//                 return null;
//               },
//               onChanged: read.emailFieldOnChanged,
//               controller: watch.emailController,
//             ),
//             SizedBox(height: AppSize.s1_5.h),
//             TextFormField(
//               decoration:
//                   const InputDecoration(hintText: StringManager.passwordHint),
//               obscureText: true,
//               validator: (password) {
//                 if (password == null || password.length < 6) {
//                   return StringManager.passwordValidator;
//                 }
//                 return null;
//               },
//               onChanged: read.passwordFieldOnChanged,
//               controller: watch.passwordController,
//               onSaved: (_) {
//                 if (read.authUser()) {
//                   Navigator.pushReplacementNamed(context, RouteNames.homeRoute);
//                   context.read<HomePageProvider>().logInScreenDisable();
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text(StringManager.authSnackBar),
//                       duration: Duration(seconds: 2),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
