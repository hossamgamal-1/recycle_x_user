import 'package:flutter/material.dart';

import '../widgets/auth/password_text_field.dart';

class FinishAuthScreen extends StatelessWidget {
  const FinishAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: const [
        PasswordTextField(),
        PasswordTextField(),
        PasswordTextField(),
      ]),
    );
  }
}
