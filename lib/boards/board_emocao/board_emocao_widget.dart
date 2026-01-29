import '/components/board_pictogramas/board_pictogramas_widget.dart';
import '/components/cabecalho/cabecalho_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'board_emocao_model.dart';
export 'board_emocao_model.dart';

class BoardEmocaoWidget extends StatefulWidget {
  const BoardEmocaoWidget({super.key});

  static String routeName = 'boardEmocao';
  static String routePath = '/boardEmocao';

  @override
  State<BoardEmocaoWidget> createState() => _BoardEmocaoWidgetState();
}

class _BoardEmocaoWidgetState extends State<BoardEmocaoWidget> {
  late BoardEmocaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoardEmocaoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'boardEmocao'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.cabecalhoModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CabecalhoWidget(
                    mostrarBotaoVoltar: true,
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.boardPictogramasModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BoardPictogramasWidget(
                      listaPictogramas: FFAppState().listaBoardEmocao,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
