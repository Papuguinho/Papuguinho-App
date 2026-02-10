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

Future<void> deleteUserHistory(String userId) async {
  final firestore = FirebaseFirestore.instance;

  // Referência da subcoleção baseada no ID que você passa do FF
  final historyRef =
      firestore.collection('users').doc(userId).collection('history');

  // Busca os documentos (leitura necessária)
  final snapshot = await historyRef.get();

  if (snapshot.docs.isEmpty) return;

  // Volta para o loop simples que você usava
  // É mais lento, mas é garantido que o FlutterFlow entenda
  for (var doc in snapshot.docs) {
    await doc.reference.delete();
  }

  print("Histórico deletado com sucesso (método sequencial).");
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
