import '/components/button_pictograma/button_pictograma_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'board_pictogramas_widget.dart' show BoardPictogramasWidget;
import 'package:flutter/material.dart';

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
