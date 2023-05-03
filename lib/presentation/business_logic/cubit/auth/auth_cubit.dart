// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  //TODO: validation using formkey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String _emailAddress = '';
  String _password = '';

  setEmailAddress(String? emailAddress) {
    _emailAddress = emailAddress ?? '';
    emit(FormChangeState());
  }

  setPassword(String? password) {
    _password = password ?? '';
    emit(FormChangeState());
  }

  Future<UserCredential> signUp() async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailAddress,
      password: _password,
    );
  }

  Future<UserCredential> logIn() async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _emailAddress, password: _password);
  }

  Future<void> setFireStoreNewUserData(String uid) async {
    // var snapShots =
    //     await FirebaseFirestore.instance.collection('your_auth_uid').get();
    // print(snapShots.docs[0].data());
  }
}
