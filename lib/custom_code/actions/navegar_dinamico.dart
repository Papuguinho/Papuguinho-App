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

Future navegarDinamico(
  BuildContext context, // Recebe em qual página está sendo feito o programa
  String nomeRota,
) async // A função será executada de forma assíncrona, ocorre em segundo plano, evita que a página trave
{
  if (nomeRota.isEmpty) // Verifica se o nomeRota está vazia
  {
    return;
  }

  try // Coloca a página, a partir do seu nome, na pilha de execução do programa
  {
    context.pushNamed(nomeRota);
  } catch (e) // Caso o comando acima não seja executado mostrará que aquela página não foi encontado(apenas para o desenvolvedor)
  {
    print("Erro: A rota $nomeRota não foi encontrado!");
  }
}
