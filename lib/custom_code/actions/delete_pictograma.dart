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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Future deletePictograma(
  String nomeColecao,
  String docId,
) async {
  // 1. Criamos a referência direta para o documento.
  // Note que removemos o parâmetro idUsuarioAtual, pois a validação
  // deve ser feita pelas Security Rules do Firebase para economizar leituras.
  DocumentReference docRef =
      FirebaseFirestore.instance.collection(nomeColecao).doc(docId);

  try {
    // 2. Manda deletar direto.
    // Se o usuário não for o dono, o Firebase retornará um erro automaticamente
    // baseado nas suas regras de segurança, custando 0 leituras extras no seu código.
    await docRef.delete();
    print("Sucesso: Item $docId deletado da coleção $nomeColecao");
  } catch (e) {
    print("Erro ao deletar: $e");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
