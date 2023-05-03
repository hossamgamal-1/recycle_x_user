import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cach_state.dart';

class CachCubit extends Cubit<CachState> {
  CachCubit(this.preferences) : super(CachInitialState());
  final SharedPreferences preferences;
  void cachUser(String uid) {
    preferences.setString('uid', uid);
  }

  bool isUser() {
    String? uid = preferences.getString('uid');
    return uid != null;
  }
}
