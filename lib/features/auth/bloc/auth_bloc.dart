import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()){
    on<AuthCall>((event, emit) async {
      await auth(event, emit);
    });
    on<AuthLogoutCall>((event, emit) async {
      await logout(event, emit);
    });
    on<AuthGoogleCall>((event, emit) async {
      await googleAuth(event, emit);
    });
  }
  Future<void> googleAuth(AuthGoogleCall event,Emitter emit) async {}

  Future<void> logout(AuthLogoutCall event,Emitter emit) async {}

  Future<void> auth(AuthCall event,Emitter emit) async {}


}
