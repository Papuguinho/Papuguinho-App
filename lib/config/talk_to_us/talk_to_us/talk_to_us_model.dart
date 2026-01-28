import '/flutter_flow/flutter_flow_util.dart';
import 'talk_to_us_widget.dart' show TalkToUsWidget;
import 'package:flutter/material.dart';

class TalkToUsModel extends FlutterFlowModel<TalkToUsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailBody widget.
  FocusNode? emailBodyFocusNode;
  TextEditingController? emailBodyTextController;
  String? Function(BuildContext, String?)? emailBodyTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailBodyFocusNode?.dispose();
    emailBodyTextController?.dispose();
  }
}
