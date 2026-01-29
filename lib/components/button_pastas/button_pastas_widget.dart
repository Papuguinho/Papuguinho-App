import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_pastas_model.dart';
export 'button_pastas_model.dart';

class ButtonPastasWidget extends StatefulWidget {
  const ButtonPastasWidget({
    super.key,
    required this.texto,
    required this.img,
    required this.cor,
    required this.destino,
    required this.uid,
  });

  final String? texto;
  final String? img;
  final Color? cor;
  final String? destino;
  final String? uid;

  @override
  State<ButtonPastasWidget> createState() => _ButtonPastasWidgetState();
}

class _ButtonPastasWidgetState extends State<ButtonPastasWidget> {
  late ButtonPastasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonPastasModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: widget!.cor,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('BUTTON_PASTAS_COMP_Stack_zh4f5sum_ON_TAP');
            logFirebaseEvent('Stack_custom_action');
            await actions.navegarDinamico(
              context,
              widget!.destino!,
            );
          },
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Text(
                  valueOrDefault<String>(
                    functions.convertToUpperCase(widget!.texto),
                    'palavra',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Colors.black,
                        fontSize: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return (MediaQuery.sizeOf(context).width * 0.035);
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return (MediaQuery.sizeOf(context).width * 0.035);
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return (MediaQuery.sizeOf(context).width * 0.025);
                          } else {
                            return (MediaQuery.sizeOf(context).width <
                                    MediaQuery.sizeOf(context).height
                                ? (MediaQuery.sizeOf(context).width * 0.025)
                                : (MediaQuery.sizeOf(context).width * 0.019));
                          }
                        }(),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Stack(
                children: [
                  if (functions.textoContem(widget!.img, 'http') == true)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          '${widget!.img}',
                          width: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return (MediaQuery.sizeOf(context).width * 0.2);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return (MediaQuery.sizeOf(context).width * 0.2);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return (MediaQuery.sizeOf(context).width * 0.14);
                            } else {
                              return (MediaQuery.sizeOf(context).width <
                                      MediaQuery.sizeOf(context).height
                                  ? (MediaQuery.sizeOf(context).width * 0.16)
                                  : (MediaQuery.sizeOf(context).width * 0.1));
                            }
                          }(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  if (functions.textoContem(widget!.img, 'http') == false)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.memory(
                          functions
                                  .converterBase64ParaBytes(widget!.img)
                                  ?.bytes ??
                              Uint8List.fromList([]),
                          width: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return (MediaQuery.sizeOf(context).width * 0.2);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return (MediaQuery.sizeOf(context).width * 0.2);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return (MediaQuery.sizeOf(context).width * 0.14);
                            } else {
                              return (MediaQuery.sizeOf(context).width <
                                      MediaQuery.sizeOf(context).height
                                  ? (MediaQuery.sizeOf(context).width * 0.16)
                                  : (MediaQuery.sizeOf(context).width * 0.1));
                            }
                          }(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
