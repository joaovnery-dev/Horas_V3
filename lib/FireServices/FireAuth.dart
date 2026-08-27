import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return "Erro: E-mail ou senha incorretos.";
        // Dica: Limpar campo de senha e focar nele
      } else if (e.code == 'user-not-found') {
        return "Erro: Nenhum usuário encontrado para este e-mail.";
      } else if (e.code == 'wrong-password') {
        return "Erro: Senha incorreta para este usuário.";
      } else if (e.code == 'invalid-email') {
        return "Erro: O endereço de e-mail não é válido.";
      } else if (e.code == 'user-disabled') {
        return "Erro: Esta conta foi desativada.";
      } else {
        return "Erro desconhecido: ${e.message}";
      }
    } catch (e) {
      // Captura qualquer outra exceção não relacionada ao Firebase Auth
      return "Erro genérico: $e";
    }
  }

  Future<String?> Register(String nome, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _auth.currentUser?.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Erro no registro";
    } catch (e) {
      return "Erro desconhecido: $e";
    }
  }

  Future<String?> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Erro ao enviar e-mail de redefinição de senha";
    } catch (e) {
      return "Erro desconhecido: $e";
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<String?> excluirConta({required String senha}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _auth.currentUser!.email!,
        password: senha,
      );
      await _auth.currentUser!.delete();
      return null;
    } catch (e) {
      return "Erro desconhecido: $e";
    }
  }

  
}
