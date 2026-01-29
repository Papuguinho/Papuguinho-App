import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quimica_organica_model.dart';
export 'quimica_organica_model.dart';

class QuimicaOrganicaWidget extends StatefulWidget {
  const QuimicaOrganicaWidget({super.key});

  static String routeName = 'QUIMICA_ORGANICA';
  static String routePath = '/To_QUIMICAo';

  @override
  State<QuimicaOrganicaWidget> createState() => _QuimicaOrganicaWidgetState();
}

class _QuimicaOrganicaWidgetState extends State<QuimicaOrganicaWidget> {
  late QuimicaOrganicaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuimicaOrganicaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'QUIMICA_ORGANICA'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('QUIMICA_ORGANICA_arrow_back_rounded_ICN_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
            child: Text(
              FFLocalizations.of(context).getText(
                '46h3yifk' /* QUÍMICA ORGÂNICA */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.outfit(
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Colors.white,
                    fontSize: MediaQuery.sizeOf(context).height * 0.03,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'QUIMICA_ORGANICA_PAGE_QUIMICA_ON_TAP');
                                  logFirebaseEvent('QUIMICA_navigate_to');

                                  context.pushNamed(TQuimicaWidget.routeName);

                                  logFirebaseEvent('QUIMICA_update_app_state');
                                  FFAppState().palavraTemas = 'Química';
                                  safeSetState(() {});
                                  logFirebaseEvent('QUIMICA_custom_action');
                                  await actions.speakText(
                                    FFAppState().palavraTemas,
                                  );
                                  logFirebaseEvent('QUIMICA_update_app_state');
                                  FFAppState().palavraTemas = '';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.15,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFB0F0A5),
                                    borderRadius: BorderRadius.circular(24.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.05,
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '4hnmzh02' /* HIDROCARBONETOS */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.black,
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.035,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.05,
                                                    0.0,
                                                  ),
                                                  0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/image-removebg-preview_(42).png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.1,
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.09,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: MediaQuery.sizeOf(context).width * 0.15,
                                decoration: BoxDecoration(
                                  color: Color(0xFFB0F0A5),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.05,
                                              0.0,
                                            ),
                                            0.0,
                                            0.0,
                                            0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '4f02df3a' /* FUNÇÕES OXIGENADAS */,
                                          ),
                                          textAlign: TextAlign.justify,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.035,
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
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0,
                                            0.0,
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.05,
                                              0.0,
                                            ),
                                            0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/image-removebg-preview_(17).png',
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.22,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1,
                                            fit: BoxFit.cover,
                                            alignment: Alignment(0.0, 0.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'QUIMICA_ORGANICA_PAGE_FISICA_ON_TAP');
                                  logFirebaseEvent('FISICA_navigate_to');

                                  context.pushNamed(
                                      ToNitrogenadasWidget.routeName);

                                  logFirebaseEvent('FISICA_update_app_state');
                                  FFAppState().palavraTemas =
                                      'Funções nitrogenadas';
                                  safeSetState(() {});
                                  logFirebaseEvent('FISICA_custom_action');
                                  await actions.speakText(
                                    FFAppState().palavraTemas,
                                  );
                                  logFirebaseEvent('FISICA_update_app_state');
                                  FFAppState().palavraTemas = '';
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.15,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFB0F0A5),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.05,
                                                    0.0,
                                                  ),
                                                  0.0,
                                                  0.0,
                                                  0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'c18dfk74' /* FUNÇÕES NITROGENADAS */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.black,
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.035,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  valueOrDefault<double>(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.05,
                                                    0.0,
                                                  ),
                                                  0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/image-removebg-preview_(39).png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.22,
                                              height: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.15,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: MediaQuery.sizeOf(context).width * 0.15,
                                decoration: BoxDecoration(
                                  color: Color(0xFFB0F0A5),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/image-removebg-preview_(19).png',
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.22,
                                            height: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.09,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width *
                                                  0.05,
                                              0.0,
                                            ),
                                            0.0,
                                            0.0,
                                            0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'kh4nbw70' /* FUNÇÕES SULFURADAS */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.035,
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
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(height: 30.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
