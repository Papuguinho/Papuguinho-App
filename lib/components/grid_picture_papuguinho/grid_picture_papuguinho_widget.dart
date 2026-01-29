import '/backend/schema/structs/index.dart';
import '/components/picture_papuguinho/picture_papuguinho_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'grid_picture_papuguinho_model.dart';
export 'grid_picture_papuguinho_model.dart';

class GridPicturePapuguinhoWidget extends StatefulWidget {
  const GridPicturePapuguinhoWidget({
    super.key,
    required this.listaPicture,
  });

  final List<PicturePauguinhoStruct>? listaPicture;

  @override
  State<GridPicturePapuguinhoWidget> createState() =>
      _GridPicturePapuguinhoWidgetState();
}

class _GridPicturePapuguinhoWidgetState
    extends State<GridPicturePapuguinhoWidget> {
  late GridPicturePapuguinhoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridPicturePapuguinhoModel());

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
      height: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return (MediaQuery.sizeOf(context).height * 0.6);
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return (MediaQuery.sizeOf(context).height * 0.6);
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return (MediaQuery.sizeOf(context).height * 0.9);
        } else {
          return (MediaQuery.sizeOf(context).height * 1.0);
        }
      }(),
      decoration: BoxDecoration(),
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
            final item = widget!.listaPicture!.toList();

            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
              ),
              primary: false,
              scrollDirection: Axis.vertical,
              itemCount: item.length,
              itemBuilder: (context, itemIndex) {
                final itemItem = item[itemIndex];
                return Opacity(
                  opacity: FFAppState().foto == itemItem.img ? 0.5 : 1.0,
                  child: wrapWithModel(
                    model: _model.picturePapuguinhoModels.getModel(
                      itemIndex.toString(),
                      itemIndex,
                    ),
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: PicturePapuguinhoWidget(
                      key: Key(
                        'Keyy3f_${itemIndex.toString()}',
                      ),
                      img: itemItem.img,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
