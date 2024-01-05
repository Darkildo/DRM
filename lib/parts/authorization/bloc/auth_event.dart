part of "../auth_part.dart";
@immutable
sealed class AuthEvent {}


final class LogAuthEvent extends AuthEvent {}
final class UnLogAuthEvent extends AuthEvent {}
final class ReloadAuthEvent extends AuthEvent {}