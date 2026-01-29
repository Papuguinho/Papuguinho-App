import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'calendario_widget.dart' show CalendarioWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalendarioModel extends FlutterFlowModel<CalendarioWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Custom Action - removeTimeFromDateTime] action in Button widget.
  DateTime? dataSemTime;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
