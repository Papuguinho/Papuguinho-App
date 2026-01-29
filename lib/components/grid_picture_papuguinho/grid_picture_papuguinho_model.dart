import '/backend/schema/structs/index.dart';
import '/components/picture_papuguinho/picture_papuguinho_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'grid_picture_papuguinho_widget.dart' show GridPicturePapuguinhoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GridPicturePapuguinhoModel
    extends FlutterFlowModel<GridPicturePapuguinhoWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for PicturePapuguinho dynamic component.
  late FlutterFlowDynamicModels<PicturePapuguinhoModel> picturePapuguinhoModels;

  @override
  void initState(BuildContext context) {
    picturePapuguinhoModels =
        FlutterFlowDynamicModels(() => PicturePapuguinhoModel());
  }

  @override
  void dispose() {
    picturePapuguinhoModels.dispose();
  }
}
