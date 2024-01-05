part of "../auth_part.dart";

abstract class IAuthRepository {
  FutureOr<String?> getPrivateKey();
}
