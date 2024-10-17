part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthError extends AuthState{
  final String error;
  AuthError({required this.error});
}

class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState{}

class AuthLogout extends AuthState{}
