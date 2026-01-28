import '/components/board_pastas/board_pastas_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pastas_widget.dart' show PastasWidget;
import 'package:flutter/material.dart';

class PastasModel extends FlutterFlowModel<PastasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for boardPastas component.
  late BoardPastasModel boardPastasModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    boardPastasModel = createModel(context, () => BoardPastasModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    boardPastasModel.dispose();
    navbarModel.dispose();
  }
}
