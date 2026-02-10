import '/backend/schema/structs/index.dart';
import '/components/comp_pastas/button_pastas/button_pastas_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'board_pastas_widget.dart' show BoardPastasWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BoardPastasModel extends FlutterFlowModel<BoardPastasWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for buttonPastas dynamic component.
  late FlutterFlowDynamicModels<ButtonPastasModel> buttonPastasModels;

  @override
  void initState(BuildContext context) {
    buttonPastasModels = FlutterFlowDynamicModels(() => ButtonPastasModel());
  }

  @override
  void dispose() {
    buttonPastasModels.dispose();
  }
}
