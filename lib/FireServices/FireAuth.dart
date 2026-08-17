import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? get user => _auth.currentUser;
  String? get uid => _auth.currentUser?.uid;

  String? login(String email, String password) {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
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

  String? Register(String nome, String email, String password) {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
      user?.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Erro no registro";
    } catch (e) {
      return "Erro desconhecido: $e";
    }
  }
}
