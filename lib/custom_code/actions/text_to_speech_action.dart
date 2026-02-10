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

import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> textToSpeechAction(List<String> lista) async {
  FlutterTts flutterTts = FlutterTts();

  double speechRate = 1.0;

  if (kIsWeb) {
    speechRate = 1.0;
  } else if (Platform.isAndroid) {
    speechRate = 0.45;
  }

  await flutterTts.setLanguage('pt-BR');
  await flutterTts.setPitch(1.0);
  await flutterTts.setSpeechRate(speechRate);

  for (String texto in lista) {
    if (texto.trim().isEmpty) continue;

    Completer<void> completer = Completer<void>();

    flutterTts.setCompletionHandler(() {
      if (!completer.isCompleted) {
        completer.complete();
      }
    });

    await flutterTts.speak(texto);
    await completer.future;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
