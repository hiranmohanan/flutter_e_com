import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_com/service/firebase_service.dart';



part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()){
    on<AuthCall> (auth);
    on<AuthLogoutCall> (logout);
    on<AuthGoogleCall> (googleAuth);
  }
  Future<void> googleAuth(AuthGoogleCall event,Emitter emit) async {
    try{
      emit(AuthLoading());
      final authResponce=await FireAuthService().signInWithGoogle();
      if(authResponce is UserCredential){
        emit(AuthSuccess());
        debugPrint("-------------user ${authResponce.user}");
      }
      else if(authResponce is Exception){
        emit(AuthError(error: "Exception occured"));
      }
      else{
        emit(AuthError(error: "Faild To Login"));
      }

    }catch(e){
      emit(AuthError(error:  e.toString()));
    }
  }

  Future<void> logout(AuthLogoutCall event,Emitter emit) async {
    try{
      
      await FireAuthService().logout();
     emit(AuthLogout());

    }catch(e){
      emit(AuthError(error:  e.toString()));
    }
  }

  Future<void> auth(AuthCall event,Emitter emit) async {}


}
