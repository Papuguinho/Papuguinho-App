import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/comp_boards/board_pictogramas/board_pictogramas_widget.dart';
import '/components/comp_boards/cabecalho/cabecalho_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'board_geral_model.dart';
export 'board_geral_model.dart';

class BoardGeralWidget extends StatefulWidget {
  const BoardGeralWidget({super.key});

  static String routeName = 'boardGeral';
  static String routePath = '/boardGeral';

  @override
  State<BoardGeralWidget> createState() => _BoardGeralWidgetState();
}

class _BoardGeralWidgetState extends State<BoardGeralWidget> {
  late BoardGeralModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoardGeralModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'boardGeral'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOARD_GERAL_boardGeral_ON_INIT_STATE');
      if ((FFAppState().appCarregado == false) &&
          (currentUserDisplayName != null && currentUserDisplayName != '')) {
        logFirebaseEvent('boardGeral_update_app_state');
        FFAppState().appCarregado = true;
        safeSetState(() {});
        logFirebaseEvent('boardGeral_firestore_query');
        _model.pictogramasPersonalizados =
            await queryBibliotecaPictogramasRecordOnce(
          queryBuilder: (bibliotecaPictogramasRecord) =>
              bibliotecaPictogramasRecord.where(
            'dono_uid',
            isEqualTo: currentUserUid,
          ),
          limit: 20,
        );
        while (FFAppState().contadorQueryPersonalizados <
            _model.pictogramasPersonalizados!.length) {
          logFirebaseEvent('boardGeral_update_app_state');
          FFAppState().addToListaBoardGeral(BotaoPictogramasStruct(
            texto: _model.pictogramasPersonalizados
                ?.elementAtOrNull(FFAppState().contadorQueryPersonalizados)
                ?.nome,
            cor: _model.pictogramasPersonalizados
                ?.elementAtOrNull(FFAppState().contadorQueryPersonalizados)
                ?.cor,
            img: _model.pictogramasPersonalizados
                ?.elementAtOrNull(FFAppState().contadorQueryPersonalizados)
                ?.imagem64,
          ));
          safeSetState(() {});
          logFirebaseEvent('boardGeral_update_app_state');
          FFAppState().contadorQueryPersonalizados =
              FFAppState().contadorQueryPersonalizados + 1;
          safeSetState(() {});
        }
        logFirebaseEvent('boardGeral_update_app_state');
        FFAppState().contadorQueryPersonalizados = 0;
        safeSetState(() {});
        logFirebaseEvent('boardGeral_update_app_state');
        FFAppState().vinculadoGoogle =
            valueOrDefault<bool>(currentUserDocument?.googleLinked, false) ==
                true;
        safeSetState(() {});
      } else {
        return;
      }
    });

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
                      mostrarBotaoVoltar: false,
                    ),
                  ),
                  Expanded(
                    child: wrapWithModel(
                      model: _model.boardPictogramasModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BoardPictogramasWidget(
                        listaPictogramas: FFAppState().listaBoardGeral,
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
