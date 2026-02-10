import '/backend/schema/structs/index.dart';
import '/components/comp_pastas/button_pastas/button_pastas_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'board_pastas_model.dart';
export 'board_pastas_model.dart';

class BoardPastasWidget extends StatefulWidget {
  const BoardPastasWidget({
    super.key,
    required this.pastas,
  });

  final List<BotaoPastaStruct>? pastas;

  @override
  State<BoardPastasWidget> createState() => _BoardPastasWidgetState();
}

class _BoardPastasWidgetState extends State<BoardPastasWidget> {
  late BoardPastasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BoardPastasModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                final item = widget!.pastas!.toList();

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 4;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return 4;
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return 3;
                      } else {
                        return (MediaQuery.sizeOf(context).width <
                                MediaQuery.sizeOf(context).height
                            ? 3
                            : 4);
                      }
                    }(),
                    childAspectRatio: 1.0,
                  ),
                  scrollDirection: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    return wrapWithModel(
                      model: _model.buttonPastasModels.getModel(
                        itemIndex.toString(),
                        itemIndex,
                      ),
                      updateCallback: () => safeSetState(() {}),
                      child: ButtonPastasWidget(
                        key: Key(
                          'Key7g9_${itemIndex.toString()}',
                        ),
                        texto: itemItem.texto,
                        img: itemItem.imagem,
                        cor: itemItem.cor,
                        destino: itemItem.destino,
                        uid: random_data.randomString(
                          0,
                          0,
                          true,
                          false,
                          false,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
