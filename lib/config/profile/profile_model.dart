import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/config/change_passaword/change_password/change_password_widget.dart';
import '/config/customization/personalizao/personalizao_widget.dart';
import '/config/edit_profile/edit_profile/edit_profile_widget.dart';
import '/config/history/auth_history/auth_history_widget.dart';
import '/config/kid_mode/active_kid_mode/active_kid_mode_widget.dart';
import '/config/linked_google/success_google/success_google_widget.dart';
import '/config/talk_to_us/talk_to_us/talk_to_us_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - vincularGoogleComEmail] action in Container widget.
  String? statusVinculo;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
