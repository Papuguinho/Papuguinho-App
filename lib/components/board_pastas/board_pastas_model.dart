import '/components/button_pastas/button_pastas_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'board_pastas_widget.dart' show BoardPastasWidget;
import 'package:flutter/material.dart';

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
