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
import 'dart:io' show Platform, isAndroid;
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> speakText(String text) async {
  if (text.trim().isEmpty) return;

  final FlutterTts flutterTts = FlutterTts();

  double speechRate = 0.5;

  if (kIsWeb) {
    speechRate = 1.0;
  } else if (Platform.isAndroid) {
    speechRate = 0.45;
  }

  await flutterTts.stop();
  await flutterTts.setLanguage("pt-BR");
  await flutterTts.setSpeechRate(speechRate);
  await flutterTts.setVolume(1.0);
  await flutterTts.setPitch(1.0);

  await flutterTts.speak(text);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
