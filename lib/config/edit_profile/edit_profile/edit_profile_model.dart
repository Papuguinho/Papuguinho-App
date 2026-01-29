import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/config/edit_profile/profile_picture/profile_picture_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode1;
  TextEditingController? fullNameTextController1;
  String? Function(BuildContext, String?)? fullNameTextController1Validator;
  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode;
  TextEditingController? dateOfBirthTextController;
  late MaskTextInputFormatter dateOfBirthMask;
  String? Function(BuildContext, String?)? dateOfBirthTextControllerValidator;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode2;
  TextEditingController? fullNameTextController2;
  String? Function(BuildContext, String?)? fullNameTextController2Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for genero widget.
  FormFieldController<List<String>>? generoValueController;
  String? get generoValue => generoValueController?.value?.firstOrNull;
  set generoValue(String? val) =>
      generoValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullNameFocusNode1?.dispose();
    fullNameTextController1?.dispose();

    dateOfBirthFocusNode?.dispose();
    dateOfBirthTextController?.dispose();

    fullNameFocusNode2?.dispose();
    fullNameTextController2?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
