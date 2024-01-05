part of "../auth_part.dart";

@immutable
sealed class AuthState {}

final class AuthLoadInProgress extends AuthState {}

final class AuthLogged extends AuthState {}

final class AuthUnLogged extends AuthState {}