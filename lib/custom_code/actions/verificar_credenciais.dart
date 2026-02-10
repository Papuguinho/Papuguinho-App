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

// Automatic imports (do not remove)
import '/auth/firebase_auth/auth_util.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future<String> verificarCredenciais(
  String emailDigitado,
  String senhaDigitada,
) async {
  try {
    // Tenta autenticar para validar as credenciais
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailDigitado,
      password: senhaDigitada,
    );
    return "sucesso";
  } on FirebaseAuthException catch (e) {
    // Retorna o código do erro (ex: 'wrong-password' ou 'invalid-email')
    return e.code;
  } catch (e) {
    return "erro-desconhecido";
  }
}
