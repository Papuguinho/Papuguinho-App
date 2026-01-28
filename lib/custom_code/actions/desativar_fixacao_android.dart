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

import 'dart:io';
import 'package:flutter_lock_task/flutter_lock_task.dart';

Future desativarFixacaoAndroid() async {
  if (Platform.isAndroid) {
    try {
      // Libera a tela
      await FlutterLockTask().stopLockTask();
    } catch (e) {
      print('Erro ao soltar a tela: $e');
    }
  }
}
