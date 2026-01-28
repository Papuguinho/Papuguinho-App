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

import 'dart:convert';

Future<String> converterParaBase64(FFUploadedFile? arquivoImagem) async {
  // Verifica se o arquivo existe e tem bytes
  if (arquivoImagem == null || arquivoImagem.bytes == null) {
    return '';
  }

  // Converte os bytes da imagem em uma String Base64
  String base64String = base64Encode(arquivoImagem.bytes!);

  return base64String;
}
