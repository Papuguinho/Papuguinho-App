import '/components/board_pictogramas/board_pictogramas_widget.dart';
import '/components/cabecalho/cabecalho_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'board_comida_model.dart';
export 'board_comida_model.dart';

class BoardComidaWidget extends StatefulWidget {
  const BoardComidaWidget({super.key});

  static String routeName = 'boardComida';
  static String routePath = '/boardComida';

  @override
  State<BoardComidaWidget> createState() => _BoardComidaWidgetState();
}

class _BoardComidaWidgetState extends State<BoardComidaWidget> {
  late BoardComidaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoardComidaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'boardComida'});
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
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
                        listaPictogramas: FFAppState().listaBoardComida,
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.navbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavbarWidget(
                      paginaAtiva: 'boardGeral',
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
