import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String emailAddress = '';
  String password = '';

  setEmailAddress(String? emailAddress) {
    this.emailAddress = emailAddress ?? '';
    print(this.emailAddress);
    emit(FormChangeState());
  }

  setPassword(String? password) {
    this.password = password ?? '';
    print(this.password);

    emit(FormChangeState());
  }

  Future<UserCredential> signUp() async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress, password: password);
  }
}
