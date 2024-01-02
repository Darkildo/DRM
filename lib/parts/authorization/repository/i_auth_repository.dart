part of "../auth_part.dart";

abstract class IAuthRepository {
  void test();
  FutureOr<String?> getPrivateKey();
}
