import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

import '../../../../presentation/resources/color_manager.dart';
// import '../../business_logic/email_password_auth_controller.dart';
import 'auth_strings.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // EmailPasswordAuthController watch =
    // context.watch<EmailPasswordAuthController>();

    return RichText(
      text: const TextSpan(
          text: // watch.currentAuthMode == AuthMode.logIn
              // ? AuthStrings.welcomeTextSignIn
              // :
              AuthStrings.welcomeTextSignUp,
          style: TextStyle(
            letterSpacing: 2,
            color: ColorManager.black,
            fontFamily: 'Poppings',
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          children: [
            TextSpan(
              text: '''\n    أكمل''',
              style: TextStyle(
                color: ColorManager.black,
                fontSize: 32,
                fontWeight: FontWeight.w500,
                fontFamily: 'Quicksand',
              ),
            ),
          ]),
    );
  }
}
