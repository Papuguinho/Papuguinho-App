import '/components/comp_boards/board_pictogramas/board_pictogramas_widget.dart';
import '/components/comp_boards/cabecalho/cabecalho_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'board_hospital_widget.dart' show BoardHospitalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BoardHospitalModel extends FlutterFlowModel<BoardHospitalWidget> {
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
