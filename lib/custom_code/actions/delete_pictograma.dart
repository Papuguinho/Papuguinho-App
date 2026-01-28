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

import 'package:cloud_firestore/cloud_firestore.dart';

Future deletePictograma(
  String nomeColecao,
  String docId,
  String idUsuarioAtual,
) async {
  // 1. Criamos a referência do documento montando o caminho com as Strings
  DocumentReference docRef =
      FirebaseFirestore.instance.collection(nomeColecao).doc(docId);

  // 2. Buscamos o documento para validar o dono
  DocumentSnapshot snapshot = await docRef.get();

  if (snapshot.exists) {
    final data = snapshot.data() as Map<String, dynamic>;

    // 3. Verificamos se o dono_uid é igual ao usuário atual
    if (data['dono_uid'] == idUsuarioAtual) {
      await docRef.delete();
      print("Sucesso: Item $docId deletado da coleção $nomeColecao");
    } else {
      print("Erro: Usuário não tem permissão para deletar.");
    }
  } else {
    print("Erro: Documento não encontrado.");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
