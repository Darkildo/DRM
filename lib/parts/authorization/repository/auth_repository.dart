part of "../auth_part.dart";

class AuthRepository implements IAuthRepository {
  void test() {
    AptosAccount.fromPrivateKey("");
  }

  @override
  FutureOr<String?> getPrivateKey() async {
    try {
      final storage = new FlutterSecureStorage();
      return await storage.read(key: Constants.privateKey);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
