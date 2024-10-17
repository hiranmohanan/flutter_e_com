part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthCall extends AuthEvent {}

class AuthLogoutCall extends AuthEvent {}

class AuthGoogleCall extends AuthEvent {}
