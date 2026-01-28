import '/backend/schema/structs/index.dart';
import '/components/button_pictograma/button_pictograma_widget.dart';
import '/config/customization/criar_pictograma/criar_pictograma_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'board_pictogramas_model.dart';
export 'board_pictogramas_model.dart';

class BoardPictogramasWidget extends StatefulWidget {
  const BoardPictogramasWidget({
    super.key,
    required this.listaPictogramas,
  });

  final List<BotaoPictogramasStruct>? listaPictogramas;

  @override
  State<BoardPictogramasWidget> createState() => _BoardPictogramasWidgetState();
}

class _BoardPictogramasWidgetState extends State<BoardPictogramasWidget> {
  late BoardPictogramasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoardPictogramasModel());

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

    return Stack(
      children: [
        Container(
          height: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return (MediaQuery.sizeOf(context).height * 0.7);
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return (MediaQuery.sizeOf(context).height * 0.7);
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return (MediaQuery.sizeOf(context).height * 0.9);
            } else {
              return (MediaQuery.sizeOf(context).height * 1.0);
            }
          }(),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.01,
                        0.0,
                      ),
                      0.0,
                      0.0,
                      0.0),
                  child: Builder(
                    builder: (context) {
                      final item = functions
                              .filtrarPictogramas(
                                  widget.listaPictogramas?.toList(),
                                  FFAppState().modoEdicao)
                              ?.toList() ??
                          [];

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 4;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 4;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 5;
                            } else {
                              return (MediaQuery.sizeOf(context).width <
                                      MediaQuery.sizeOf(context).height
                                  ? 5
                                  : 7);
                            }
                          }(),
                          childAspectRatio: 1.0,
                        ),
                        primary: false,
                        scrollDirection: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return true;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return true;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return false;
                          } else {
                            return false;
                          }
                        }()
                            ? Axis.horizontal
                            : Axis.vertical,
                        itemCount: item.length,
                        itemBuilder: (context, itemIndex) {
                          final itemItem = item[itemIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 20.0, 0.0),
                            child: wrapWithModel(
                              model: _model.buttonPictogramaModels.getModel(
                                itemIndex.toString(),
                                itemIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: ButtonPictogramaWidget(
                                key: Key(
                                  'Keyc12_${itemIndex.toString()}',
                                ),
                                texto: itemItem.texto,
                                cor: itemItem.cor,
                                img: itemItem.img,
                                ativo: true,
                                index: itemIndex,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        if (FFAppState().modoEdicao == true)
          Align(
            alignment: AlignmentDirectional(1.0, 1.0),
            child: Builder(
              builder: (context) => FloatingActionButton(
                onPressed: () async {
                  logFirebaseEvent('BOARD_PICTOGRAMAS_FloatingActionButton_m');
                  logFirebaseEvent('FloatingActionButton_alert_dialog');
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: CriarPictogramaWidget(),
                      );
                    },
                  );
                },
                backgroundColor: Color(0xFF6AEA6A),
                elevation: 8.0,
                child: Icon(
                  Icons.add_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
