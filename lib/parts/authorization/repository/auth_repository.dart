part of "../auth_part.dart";

final class AuthRepository implements IAuthRepository {
  const AuthRepository();
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
