part of "../auth_part.dart";

@immutable
sealed class AuthState {}

final class AuthLoadInProgress extends AuthState {}

final class AuthLogged extends AuthState {
  final List<AptosAccount> accounts;
  final int currentIndex;
  AuthLogged({required this.accounts, this.currentIndex = 0});
  AptosAccount get current => accounts.first;



  
}

final class AuthUnLogged extends AuthState {}
