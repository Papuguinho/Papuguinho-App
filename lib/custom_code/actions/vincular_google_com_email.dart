// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<String?> vincularGoogleComEmail() async {
  try {
    // 1. Inicia o fluxo de login do Google com ClientID e Scopes necessários
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      clientId: kIsWeb
          ? '111295109266-jdu98n4fk2k6vpg8ofsgbo9shi52g2bm.apps.googleusercontent.com'
          : null,
      scopes: <String>['email', 'profile'],
    ).signIn();

    if (googleUser == null) return 'CANCELADO';

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // 2. Cria a credencial do Google para o Firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // 3. Pega o usuário logado atualmente (E-mail/Senha)
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // 4. Une a conta Google ao E-mail atual
      await user.linkWithCredential(credential);
      return 'SUCESSO';
    } else {
      return 'ERRO: Nenhum usuário logado para vincular.';
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'credential-already-in-use') {
      return 'Este Google já está em uso em outra conta.';
    }
    return 'Erro Firebase: ${e.message}';
  } catch (e) {
    return 'Erro desconhecido: $e';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
