abstract class LoginRepository {
  Future<String?> loginEmail(String email, String password);

  Future<String?> loginFace();

  Future<String?> loginGoogle();
}
