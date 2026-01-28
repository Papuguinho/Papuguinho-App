// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert'; // Necessário para ler o Base64

class ImagemSemPiscar extends StatefulWidget {
  const ImagemSemPiscar({
    Key? key,
    this.width,
    this.height,
    required this.imgBase64,
    this.largura,
    this.altura,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String imgBase64;
  final double? largura; // Sua variável
  final double? altura; // Sua variável

  @override
  _ImagemSemPiscarState createState() => _ImagemSemPiscarState();
}

class _ImagemSemPiscarState extends State<ImagemSemPiscar> {
  @override
  Widget build(BuildContext context) {
    // 1. Limpeza da String (caso venha com ou sem cabeçalho data:image)
    String base64String = widget.imgBase64;
    if (base64String.contains(',')) {
      base64String = base64String.split(',').last;
    }

    // 2. Definição do tamanho: prioriza 'largura' e 'altura' que você criou
    // Se elas estiverem vazias, ele usa o width/height padrão do FlutterFlow
    final double larguraFinal =
        widget.largura ?? widget.width ?? double.infinity;
    final double alturaFinal =
        widget.altura ?? widget.height ?? double.infinity;

    // 3. Decodificação segura
    try {
      return ClipRRect(
        // Arredondamento igual ao do seu design (16px)
        borderRadius: BorderRadius.circular(16),
        child: Image.memory(
          base64Decode(base64String),
          // AQUI ESTÁ A MUDANÇA: Agora usa as variáveis larguraFinal e alturaFinal
          width: larguraFinal,
          height: alturaFinal,
          fit: BoxFit.cover,

          // Isso impede que a imagem pisque ao atualizar
          gaplessPlayback: true,

          errorBuilder: (context, error, stackTrace) {
            return Container(
                width: larguraFinal,
                height: alturaFinal,
                color: Colors.grey[200],
                child: const Icon(Icons.image_not_supported));
          },
        ),
      );
    } catch (e) {
      return Container(
          width: larguraFinal,
          height: alturaFinal,
          color: Colors.red[100],
          child: const Icon(Icons.error));
    }
  }
}
