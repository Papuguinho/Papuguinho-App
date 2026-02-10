import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? filtrodepesquisa(
  String textodigitado,
  String mensagem,
) {
  return mensagem.contains(textodigitado);
}

String? convertToUpperCase(String? texto) {
  if (texto == null) {
    return null; // Se o texto for nulo, retorna nulo.
  }

  // Retorna a string convertida para maiúsculas.
  return texto.toUpperCase();
}

bool textoContem(
  String? textoBase,
  String textoBusca,
) {
  if (textoBase == null) {
    return false;
  }
  return textoBase.contains(textoBusca);
}

FFUploadedFile? converterBase64ParaBytes(String? base64String) {
  if (base64String == null || base64String.isEmpty) {
    return null;
  }

  try {
    // Limpeza de segurança (remove "data:image..." se houver)
    String stringPura = base64String;
    if (base64String.contains(',')) {
      stringPura = base64String.split(',').last;
    }

    // Decodifica para bytes
    final bytes = base64Decode(stringPura);

    // Cria e retorna o objeto FFUploadedFile
    // Damos um nome fictício pois ele foi gerado na memória
    return FFUploadedFile(
      bytes: bytes,
      name: 'imagem_gerada.png',
    );
  } catch (e) {
    return null;
  }
}

List<BotaoPictogramasStruct>? filtrarPictogramas(
  List<BotaoPictogramasStruct>? listaOriginal,
  bool? modoEdicao,
) {
  // 1. Criação de uma lista segura.
  // Se 'listaOriginal' for nula, usamos uma lista vazia '[]' como padrão.
  // Isso elimina o erro de tentar filtrar algo nulo.
  final List<BotaoPictogramasStruct> listaSegura = listaOriginal ?? [];

  // 2. Tratamento do modo de edição.
  // Se 'modoEdicao' for nulo, consideramos como 'false'.
  bool editando = modoEdicao ?? false;

  // 3. Lógica do Filtro
  if (editando == true) {
    // Se estiver editando, retorna tudo (incluindo ocultos)
    return listaSegura;
  } else {
    // Se NÃO estiver editando, retorna apenas os que tem ativo == true
    // O 'item.ativo ?? true' garante que se o campo ativo for nulo, ele aparece por segurança
    return listaSegura.where((item) => item.ativo == true).toList();
  }
}

DocumentReference? getHistoricoRef(String? userUID) {
  if (userUID == null || userUID.isEmpty) {
    return null;
  }
  // Caminho: users/{id}/history/registro
  // Usamos 'registro' como ID fixo para ter apenas um doc por user
  return FirebaseFirestore.instance.doc('users/$userUID/history/registro');
}
