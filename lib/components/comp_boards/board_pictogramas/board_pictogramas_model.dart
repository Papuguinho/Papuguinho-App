import '/backend/schema/structs/index.dart';
import '/components/comp_boards/button_pictograma/button_pictograma_widget.dart';
import '/config/customization/criar_pictograma/criar_pictograma_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'board_pictogramas_widget.dart' show BoardPictogramasWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BoardPictogramasModel extends FlutterFlowModel<BoardPictogramasWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for buttonPictograma dynamic component.
  late FlutterFlowDynamicModels<ButtonPictogramaModel> buttonPictogramaModels;

  @override
  void initState(BuildContext context) {
    buttonPictogramaModels =
        FlutterFlowDynamicModels(() => ButtonPictogramaModel());
  }

  @override
  void dispose() {
    buttonPictogramaModels.dispose();
  }
}
