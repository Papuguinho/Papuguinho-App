import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_pictograma_model.dart';
export 'button_pictograma_model.dart';

class ButtonPictogramaWidget extends StatefulWidget {
  const ButtonPictogramaWidget({
    super.key,
    required this.texto,
    this.cor,
    required this.img,
    bool? ativo,
    required this.index,
    this.donoUid,
    this.idPictograma,
  }) : this.ativo = ativo ?? true;

  final String? texto;
  final Color? cor;
  final String? img;
  final bool ativo;
  final int? index;
  final String? donoUid;
  final DocumentReference? idPictograma;

  @override
  State<ButtonPictogramaWidget> createState() => _ButtonPictogramaWidgetState();
}

class _ButtonPictogramaWidgetState extends State<ButtonPictogramaWidget> {
  late ButtonPictogramaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonPictogramaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible: (widget.ativo == true) || (FFAppState().modoEdicao == true),
      child: Opacity(
        opacity: () {
          if ((FFAppState()
                      .listaBoardGeral
                      .elementAtOrNull(widget.index!)
                      ?.ativo ==
                  true) &&
              (FFAppState().modoEdicao == false)) {
            return 1.0;
          } else if ((FFAppState()
                      .listaBoardGeral
                      .elementAtOrNull(widget.index!)
                      ?.ativo ==
                  false) &&
              (FFAppState().modoEdicao == true)) {
            return 0.4;
          } else {
            return 1.0;
          }
        }(),
        child: Container(
          decoration: BoxDecoration(
            color: widget.cor,
            borderRadius: BorderRadius.circular(16.0),
            shape: BoxShape.rectangle,
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
              logFirebaseEvent('BUTTON_PICTOGRAMA_Stack_ql7ta5xb_ON_TAP');
              if ((FFAppState().buttonPress == false) &&
                  (FFAppState().displaymensage.length <= 9)) {
                logFirebaseEvent('Stack_update_app_state');
                FFAppState().buttonPress = true;
                _model.updatePage(() {});
                logFirebaseEvent('Stack_update_app_state');
                FFAppState().addToDisplaymensage('${widget.texto} ');
                FFAppState().update(() {});
                logFirebaseEvent('Stack_custom_action');
                await actions.speakText(
                  widget.texto!,
                );
                logFirebaseEvent('Stack_update_app_state');
                FFAppState().Historico =
                    '${'${FFAppState().Historico} '}${functions.convertToUpperCase(widget.texto)}';
                safeSetState(() {});
                logFirebaseEvent('Stack_update_app_state');
                FFAppState().buttonPress = false;
                safeSetState(() {});
              } else {
                return;
              }
            },
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      if (functions.textoContem(widget.img, 'http') == true)
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return (MediaQuery.sizeOf(context).width *
                                          0.05);
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return (MediaQuery.sizeOf(context).width *
                                          0.05);
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 0.0;
                                    } else {
                                      return 0.0;
                                    }
                                  }(),
                                  0.0,
                                ),
                                0.0,
                                0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                '${widget.img}',
                                width: () {
                                  if (MediaQuery.sizeOf(context).width <
                                      kBreakpointSmall) {
                                    return (MediaQuery.sizeOf(context).width *
                                        0.2);
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointMedium) {
                                    return (MediaQuery.sizeOf(context).width *
                                        0.2);
                                  } else if (MediaQuery.sizeOf(context).width <
                                      kBreakpointLarge) {
                                    return (MediaQuery.sizeOf(context).width *
                                        0.14);
                                  } else {
                                    return (MediaQuery.sizeOf(context).width <
                                            MediaQuery.sizeOf(context).height
                                        ? (MediaQuery.sizeOf(context).width *
                                            0.16)
                                        : (MediaQuery.sizeOf(context).width *
                                            0.1));
                                  }
                                }(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      if (functions.textoContem(widget.img, 'http') == false)
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return (MediaQuery.sizeOf(context).width *
                                          0.009);
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return (MediaQuery.sizeOf(context).width *
                                          0.009);
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return (MediaQuery.sizeOf(context).width *
                                          0.015);
                                    } else {
                                      return (MediaQuery.sizeOf(context).width <
                                              MediaQuery.sizeOf(context).height
                                          ? (MediaQuery.sizeOf(context).width *
                                              0.015)
                                          : (MediaQuery.sizeOf(context).width *
                                              0.01));
                                    }
                                  }(),
                                  0.0,
                                ),
                                0.0,
                                0.0),
                            child: custom_widgets.ImagemSemPiscar(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 90.0,
                              imgBase64: widget.img!,
                              largura: () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.25);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.25);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.14);
                                } else {
                                  return (MediaQuery.sizeOf(context).width <
                                          MediaQuery.sizeOf(context).height
                                      ? (MediaQuery.sizeOf(context).width *
                                          0.14)
                                      : (MediaQuery.sizeOf(context).width *
                                          0.1));
                                }
                              }(),
                              altura: () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.25);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.25);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.14);
                                } else {
                                  return (MediaQuery.sizeOf(context).width <
                                          MediaQuery.sizeOf(context).height
                                      ? (MediaQuery.sizeOf(context).width *
                                          0.14)
                                      : (MediaQuery.sizeOf(context).width *
                                          0.1));
                                }
                              }(),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Text(
                    valueOrDefault<String>(
                      functions.convertToUpperCase(widget.texto),
                      'palavra',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Colors.black,
                          fontSize: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return (MediaQuery.sizeOf(context).width * 0.03);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return (MediaQuery.sizeOf(context).width * 0.03);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return (MediaQuery.sizeOf(context).width * 0.015);
                            } else {
                              return (MediaQuery.sizeOf(context).width <
                                      MediaQuery.sizeOf(context).height
                                  ? (MediaQuery.sizeOf(context).width * 0.015)
                                  : (MediaQuery.sizeOf(context).width * 0.01));
                            }
                          }(),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                if (FFAppState().modoEdicao)
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (FFAppState()
                                    .listaBoardGeral
                                    .elementAtOrNull(widget.index!)
                                    ?.idPictograma !=
                                null &&
                            FFAppState()
                                    .listaBoardGeral
                                    .elementAtOrNull(widget.index!)
                                    ?.idPictograma !=
                                '')
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'BUTTON_PICTOGRAMA_Icon_jc93rada_ON_TAP');
                                logFirebaseEvent('Icon_alert_dialog');
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Apagar Pictograma'),
                                              content: Text(
                                                  'Tem certeza que deseja apagar esse pictograma?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancelar'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Confirmar'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent('Icon_custom_action');
                                  await actions.deletePictograma(
                                    'biblioteca_pictogramas',
                                    FFAppState()
                                        .listaBoardGeral
                                        .elementAtOrNull(widget.index!)!
                                        .idPictograma,
                                    currentUserUid,
                                  );
                                  logFirebaseEvent('Icon_update_app_state');
                                  FFAppState().removeFromListaBoardGeral(
                                      FFAppState()
                                          .listaBoardGeral
                                          .elementAtOrNull(widget.index!)!);
                                  safeSetState(() {});
                                } else {
                                  return;
                                }
                              },
                              child: Icon(
                                Icons.delete,
                                color: Color(0xFFF02C0B),
                                size: 24.0,
                              ),
                            ),
                          ),
                        Stack(
                          children: [
                            if (FFAppState()
                                    .listaBoardGeral
                                    .elementAtOrNull(widget.index!)
                                    ?.ativo ==
                                true)
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 8.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'BUTTON_PICTOGRAMA_Icon_2gv5fkm1_ON_TAP');
                                      logFirebaseEvent('Icon_update_app_state');
                                      FFAppState().updateListaBoardGeralAtIndex(
                                        widget.index!,
                                        (e) => e..ativo = false,
                                      );
                                      safeSetState(() {});
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.eyeSlash,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 25.0,
                                    ),
                                  ),
                                ),
                              ),
                            if (FFAppState()
                                    .listaBoardGeral
                                    .elementAtOrNull(widget.index!)
                                    ?.ativo ==
                                false)
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 8.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'BUTTON_PICTOGRAMA_Icon_a1e75vv0_ON_TAP');
                                      logFirebaseEvent('Icon_update_app_state');
                                      FFAppState().updateListaBoardGeralAtIndex(
                                        widget.index!,
                                        (e) => e..ativo = true,
                                      );
                                      safeSetState(() {});
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.eye,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 25.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
