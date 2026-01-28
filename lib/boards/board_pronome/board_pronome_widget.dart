import '/components/board_pictogramas/board_pictogramas_widget.dart';
import '/components/cabecalho/cabecalho_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'board_pronome_model.dart';
export 'board_pronome_model.dart';

class BoardPronomeWidget extends StatefulWidget {
  const BoardPronomeWidget({super.key});

  static String routeName = 'boardPronome';
  static String routePath = '/boardPronome';

  @override
  State<BoardPronomeWidget> createState() => _BoardPronomeWidgetState();
}

class _BoardPronomeWidgetState extends State<BoardPronomeWidget> {
  late BoardPronomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoardPronomeModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'boardPronome'});
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
                      listaPictogramas: FFAppState().listaBoardPronome,
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
