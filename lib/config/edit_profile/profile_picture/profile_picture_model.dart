import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/grid_picture_papuguinho/grid_picture_papuguinho_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'profile_picture_widget.dart' show ProfilePictureWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
