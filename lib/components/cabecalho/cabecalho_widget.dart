import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cabecalho_model.dart';
export 'cabecalho_model.dart';

class CabecalhoWidget extends StatefulWidget {
  const CabecalhoWidget({
    super.key,
    bool? mostrarBotaoVoltar,
  }) : this.mostrarBotaoVoltar = mostrarBotaoVoltar ?? false;

  final bool mostrarBotaoVoltar;

  @override
  State<CabecalhoWidget> createState() => _CabecalhoWidgetState();
}

class _CabecalhoWidgetState extends State<CabecalhoWidget>
    with TickerProviderStateMixin {
  late CabecalhoModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CabecalhoModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 890.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 90.0,
            decoration: BoxDecoration(),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width >
                            MediaQuery.sizeOf(context).height
                        ? MediaQuery.sizeOf(context).width
                        : MediaQuery.sizeOf(context).height,
                    height: MediaQuery.sizeOf(context).width * 0.5,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Builder(
                                builder: (context) {
                                  final mensagemlista = FFAppState()
                                      .displaymensage
                                      .toList()
                                      .take(10)
                                      .toList();

                                  return Wrap(
                                    spacing: 0.0,
                                    runSpacing: 0.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.antiAlias,
                                    children:
                                        List.generate(mensagemlista.length,
                                            (mensagemlistaIndex) {
                                      final mensagemlistaItem =
                                          mensagemlista[mensagemlistaIndex];
                                      return Text(
                                        valueOrDefault<String>(
                                          functions.convertToUpperCase(
                                              mensagemlistaItem),
                                          '.',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return 20.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return 25.0;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return 30.0;
                                                } else {
                                                  return 35.0;
                                                }
                                              }(),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        if (FFAppState().displaymensage.length < 10)
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Text(
                              '${FFAppState().displaymensage.length.toString()}/10',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize:
                                        MediaQuery.sizeOf(context).width * 0.02,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        if (FFAppState().displaymensage.length >= 10)
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '8xyv6kuo' /* 10/10 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize:
                                        MediaQuery.sizeOf(context).width * 0.02,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget!.mostrarBotaoVoltar)
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return (MediaQuery.sizeOf(context).width * 0.2);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).width * 0.2);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).width * 0.15);
                        } else {
                          return (MediaQuery.sizeOf(context).width * 0.12);
                        }
                      }(),
                      height: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return (MediaQuery.sizeOf(context).width * 0.2);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).width * 0.2);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).width * 0.09);
                        } else {
                          return (MediaQuery.sizeOf(context).height * 0.09);
                        }
                      }(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('CABECALHO_COMP__BTN_ON_TAP');
                          logFirebaseEvent('Button_navigate_back');
                          context.safePop();
                        },
                        text: FFLocalizations.of(context).getText(
                          'ifvad77v' /*  */,
                        ),
                        icon: Icon(
                          Icons.chevron_left,
                          size: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                        options: FFButtonOptions(
                          height: 18.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF6AEA6A),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Container(
                    width: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return (MediaQuery.sizeOf(context).width * 0.2);
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return (MediaQuery.sizeOf(context).width * 0.2);
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return (MediaQuery.sizeOf(context).width * 0.15);
                      } else {
                        return (MediaQuery.sizeOf(context).width * 0.12);
                      }
                    }(),
                    height: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return (MediaQuery.sizeOf(context).width * 0.2);
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return (MediaQuery.sizeOf(context).width * 0.2);
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return (MediaQuery.sizeOf(context).width * 0.09);
                      } else {
                        return (MediaQuery.sizeOf(context).height * 0.09);
                      }
                    }(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('CABECALHO_COMP__BTN_ON_TAP');
                        var _shouldSetState = false;
                        if ((FFAppState().displaymensage.isNotEmpty) == true) {
                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().contador = 0;
                          safeSetState(() {});
                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().displaymensage = [];
                          safeSetState(() {});
                          logFirebaseEvent('Button_custom_action');
                          await actions.stopTextToSpeech();
                          logFirebaseEvent('Button_custom_action');
                          _model.dataSemTimeHist =
                              await actions.removeTimeFromDateTime(
                            getCurrentTimestamp,
                          );
                          _shouldSetState = true;
                          logFirebaseEvent('Button_backend_call');

                          await HistoryRecord.createDoc(currentUserReference!)
                              .set(createHistoryRecordData(
                            email: currentUserEmail,
                            date: _model.dataSemTimeHist,
                            message: FFAppState().Historico,
                          ));
                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().Historico = '';
                          safeSetState(() {});
                        } else {
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: '',
                      icon: Icon(
                        Icons.clear,
                        size: MediaQuery.sizeOf(context).width * 0.04,
                      ),
                      options: FFButtonOptions(
                        height: 18.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF6AEA6A),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Container(
                    width: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return (MediaQuery.sizeOf(context).width * 0.2);
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return (MediaQuery.sizeOf(context).width * 0.2);
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return (MediaQuery.sizeOf(context).width * 0.15);
                      } else {
                        return (MediaQuery.sizeOf(context).width * 0.12);
                      }
                    }(),
                    height: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return (MediaQuery.sizeOf(context).width * 0.2);
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return (MediaQuery.sizeOf(context).width * 0.2);
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return (MediaQuery.sizeOf(context).width * 0.09);
                      } else {
                        return (MediaQuery.sizeOf(context).height * 0.09);
                      }
                    }(),
                    decoration: BoxDecoration(),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('CABECALHO_COMP__BTN_ON_TAP');
                        logFirebaseEvent('Button_update_app_state');
                        FFAppState().removeFromDisplaymensage(
                            FFAppState().displaymensage.lastOrNull!);
                        safeSetState(() {});
                      },
                      text: '',
                      icon: Icon(
                        Icons.repeat,
                        size: MediaQuery.sizeOf(context).width * 0.04,
                      ),
                      options: FFButtonOptions(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF6AEA6A),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ),
              ),
              if (FFAppState().contador == 0)
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'CABECALHO_COMP_Container_gg4kl3wc_ON_TAP');
                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().contador = FFAppState().contador + 1;
                        safeSetState(() {});
                        logFirebaseEvent('Container_custom_action');
                        await actions.textToSpeechAction(
                          FFAppState().displaymensage.toList(),
                        );
                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().contador = 0;
                        safeSetState(() {});
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Container(
                          width: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return (MediaQuery.sizeOf(context).width * 0.2);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return (MediaQuery.sizeOf(context).width * 0.2);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return (MediaQuery.sizeOf(context).width * 0.15);
                            } else {
                              return (MediaQuery.sizeOf(context).width * 0.12);
                            }
                          }(),
                          height: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return (MediaQuery.sizeOf(context).width * 0.2);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return (MediaQuery.sizeOf(context).width * 0.2);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return (MediaQuery.sizeOf(context).width * 0.09);
                            } else {
                              return (MediaQuery.sizeOf(context).height * 0.09);
                            }
                          }(),
                          decoration: BoxDecoration(
                            color: Color(0xFF6AEA6A),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Container(
                              height: 40.0,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.play_arrow_sharp,
                                      color: Colors.white,
                                      size: MediaQuery.sizeOf(context).width *
                                          0.04,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (FFAppState().contador == 1)
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'CABECALHO_COMP_Container_73w984b3_ON_TAP');
                        logFirebaseEvent('Container_custom_action');
                        await actions.stopTextToSpeech();
                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().contador = 0;
                        safeSetState(() {});
                      },
                      child: Container(
                        width: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return (MediaQuery.sizeOf(context).width * 0.2);
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return (MediaQuery.sizeOf(context).width * 0.2);
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return (MediaQuery.sizeOf(context).width * 0.15);
                          } else {
                            return (MediaQuery.sizeOf(context).width * 0.12);
                          }
                        }(),
                        height: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return (MediaQuery.sizeOf(context).width * 0.2);
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return (MediaQuery.sizeOf(context).width * 0.2);
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return (MediaQuery.sizeOf(context).width * 0.09);
                          } else {
                            return (MediaQuery.sizeOf(context).height * 0.09);
                          }
                        }(),
                        decoration: BoxDecoration(
                          color: Color(0xFF6AEA6A),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.stop_rounded,
                                  color: Colors.white,
                                  size: MediaQuery.sizeOf(context).width * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
        ],
      ),
    );
  }
}
