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

import 'dart:io'; // Para verificar se é Android
import 'package:flutter_lock_task/flutter_lock_task.dart'; // A biblioteca que instalamos

Future ativarFixacaoAndroid() async {
  // Só executa se for Android, para não dar erro no iPhone ou Web
  if (Platform.isAndroid) {
    try {
      // Inicia o modo de fixação
      await FlutterLockTask().startLockTask();
    } catch (e) {
      print('Erro ao tentar fixar a tela: $e');
    }
  }
}
