import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'picture_papuguinho_model.dart';
export 'picture_papuguinho_model.dart';

class PicturePapuguinhoWidget extends StatefulWidget {
  const PicturePapuguinhoWidget({
    super.key,
    required this.img,
  });

  final String? img;

  @override
  State<PicturePapuguinhoWidget> createState() =>
      _PicturePapuguinhoWidgetState();
}

class _PicturePapuguinhoWidgetState extends State<PicturePapuguinhoWidget> {
  late PicturePapuguinhoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PicturePapuguinhoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('PICTURE_PAPUGUINHO_CircleImage_n7fpncb5_');
        logFirebaseEvent('CircleImage_update_app_state');
        FFAppState().foto = widget.img!;
        safeSetState(() {});
      },
      child: Container(
        width: 200.0,
        height: 200.0,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.network(
          widget.img!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
