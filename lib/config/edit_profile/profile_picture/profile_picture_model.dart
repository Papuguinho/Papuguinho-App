import '/components/grid_picture_papuguinho/grid_picture_papuguinho_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_picture_widget.dart' show ProfilePictureWidget;
import 'package:flutter/material.dart';

class ProfilePictureModel extends FlutterFlowModel<ProfilePictureWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for gridPicturePapuguinho component.
  late GridPicturePapuguinhoModel gridPicturePapuguinhoModel;

  @override
  void initState(BuildContext context) {
    gridPicturePapuguinhoModel =
        createModel(context, () => GridPicturePapuguinhoModel());
  }

  @override
  void dispose() {
    gridPicturePapuguinhoModel.dispose();
  }
}
