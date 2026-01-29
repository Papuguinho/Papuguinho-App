import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'criar_pasta_widget.dart' show CriarPastaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CriarPastaModel extends FlutterFlowModel<CriarPastaWidget> {
  ///  Local state fields for this component.

  List<Color> paletaCores = [
    Color(4284719792),
    Color(4294835606),
    Color(4294947655),
    Color(4294955484),
    Color(4293322490),
    Color(4289961653),
    Color(4289644239),
    Color(4289781928),
    Color(4294309340),
    Color(4292072403),
    Color(4294957753),
    Color(4294966736)
  ];
  void addToPaletaCores(Color item) => paletaCores.add(item);
  void removeFromPaletaCores(Color item) => paletaCores.remove(item);
  void removeAtIndexFromPaletaCores(int index) => paletaCores.removeAt(index);
  void insertAtIndexInPaletaCores(int index, Color item) =>
      paletaCores.insert(index, item);
  void updatePaletaCoresAtIndex(int index, Function(Color) updateFn) =>
      paletaCores[index] = updateFn(paletaCores[index]);

  Color? corSelecionada;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_imagemPictograma = false;
  FFUploadedFile uploadedLocalFile_imagemPictograma =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - converterParaBase64] action in Button widget.
  String? imagem64;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
