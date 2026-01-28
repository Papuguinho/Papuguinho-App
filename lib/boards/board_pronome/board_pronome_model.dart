import '/components/board_pictogramas/board_pictogramas_widget.dart';
import '/components/cabecalho/cabecalho_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'board_pronome_widget.dart' show BoardPronomeWidget;
import 'package:flutter/material.dart';

class BoardPronomeModel extends FlutterFlowModel<BoardPronomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Cabecalho component.
  late CabecalhoModel cabecalhoModel;
  // Model for boardPictogramas component.
  late BoardPictogramasModel boardPictogramasModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    cabecalhoModel = createModel(context, () => CabecalhoModel());
    boardPictogramasModel = createModel(context, () => BoardPictogramasModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    cabecalhoModel.dispose();
    boardPictogramasModel.dispose();
    navbarModel.dispose();
  }
}
