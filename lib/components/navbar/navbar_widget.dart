import '/config/kid_mode/disable_kid_mode/disable_kid_mode_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    this.paginaAtiva,
  });

  final String? paginaAtiva;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 75.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('NAVBAR_COMP_Column_rlbht0z6_ON_TAP');
              logFirebaseEvent('Column_navigate_to');

              context.pushNamed(BoardGeralWidget.routeName);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  color: widget!.paginaAtiva == 'boardGeral'
                      ? Color(0xFF6AEA6A)
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 35.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '1hmqzypd' /* Início */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: widget!.paginaAtiva == 'boardGeral'
                            ? Color(0xFF6AEA6A)
                            : FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
          ),
          if (FFAppState().modoEdicao == false)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('NAVBAR_COMP_Column_icsnhida_ON_TAP');
                logFirebaseEvent('Column_navigate_to');

                context.pushNamed(PastasWidget.routeName);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.dashboard,
                    color: widget!.paginaAtiva == 'Pastas'
                        ? Color(0xFF6AEA6A)
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 35.0,
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'yg05c34t' /* Temas */,
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
                          color: widget!.paginaAtiva == 'Pastas'
                              ? Color(0xFF6AEA6A)
                              : FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
          Builder(
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('NAVBAR_COMP_Column_j67kjvtu_ON_TAP');
                if (FFAppState().modoEdicao) {
                  logFirebaseEvent('Column_update_app_state');
                  FFAppState().modoEdicao = false;
                  safeSetState(() {});
                  logFirebaseEvent('Column_navigate_to');

                  context.goNamed(BoardGeralWidget.routeName);

                  return;
                }
                if (FFAppState().modoInfantil) {
                  logFirebaseEvent('Column_alert_dialog');
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: DisableKidModeWidget(),
                      );
                    },
                  );
                } else {
                  logFirebaseEvent('Column_navigate_to');

                  context.pushNamed(ProfileWidget.routeName);
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      if (FFAppState().modoEdicao == false)
                        Icon(
                          Icons.account_circle_outlined,
                          color: () {
                            if (widget!.paginaAtiva == 'Perfil') {
                              return Color(0xFF6AEA6A);
                            } else if (FFAppState().modoInfantil) {
                              return FlutterFlowTheme.of(context).error;
                            } else {
                              return FlutterFlowTheme.of(context).secondaryText;
                            }
                          }(),
                          size: 35.0,
                        ),
                      if (FFAppState().modoEdicao == true)
                        Icon(
                          Icons.exit_to_app,
                          color: Color(0xFFE11212),
                          size: 35.0,
                        ),
                    ],
                  ),
                  Text(
                    FFAppState().modoEdicao == true
                        ? 'Sair do modo edição '
                        : 'Perfil',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: () {
                            if (widget!.paginaAtiva == 'Perfil') {
                              return Color(0xFF6AEA6A);
                            } else if (FFAppState().modoInfantil == true) {
                              return Color(0xFFF00B19);
                            } else if (FFAppState().modoEdicao == true) {
                              return Color(0xFFF30B0B);
                            } else {
                              return FlutterFlowTheme.of(context).secondaryText;
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
                ],
              ),
            ),
          ),
        ].addToStart(SizedBox(width: 5.0)).addToEnd(SizedBox(width: 5.0)),
      ),
    );
  }
}
