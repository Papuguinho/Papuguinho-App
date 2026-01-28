import '/components/picture_papuguinho/picture_papuguinho_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'grid_picture_papuguinho_widget.dart' show GridPicturePapuguinhoWidget;
import 'package:flutter/material.dart';

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
