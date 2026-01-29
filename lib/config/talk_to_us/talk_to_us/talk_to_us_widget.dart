import '/auth/firebase_auth/auth_util.dart';
import '/config/talk_to_us/thank_you_send/thank_you_send_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'talk_to_us_model.dart';
export 'talk_to_us_model.dart';

class TalkToUsWidget extends StatefulWidget {
  const TalkToUsWidget({super.key});

  @override
  State<TalkToUsWidget> createState() => _TalkToUsWidgetState();
}

class _TalkToUsWidgetState extends State<TalkToUsWidget>
    with TickerProviderStateMixin {
  late TalkToUsModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TalkToUsModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.emailBodyTextController ??= TextEditingController();
    _model.emailBodyFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 80.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x00FFFFFF),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/fundo.jpg',
              ).image,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 110.0, 12.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          height: 520.0,
                          constraints: BoxConstraints(
                            maxWidth: 570.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 35.0, 24.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.black,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'TALK_TO_US_COMP_close_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_close_dialog_drawer_etc');
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'byuvstch' /* Nos escreva um e-mail */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.juliusSansOne(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 24.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'of5f8p03' /* Seu feedback é muito important... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF848688),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.emailBodyTextController,
                                        focusNode: _model.emailBodyFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'u40ttz0q' /* Sugestão, relato de erro... */,
                                          ),
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                color: Color(0x83000000),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                          alignLabelWithHint: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFC2C4C6),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF6AEA6A),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFD9D9D9),
                                          contentPadding: EdgeInsets.all(24.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: 9,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        cursorColor: Color(0xFF6AEA6A),
                                        validator: _model
                                            .emailBodyTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  if ((isWeb
                                          ? MediaQuery.viewInsetsOf(context)
                                                  .bottom >
                                              0
                                          : _isKeyboardVisible) ==
                                      false)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'TALK_TO_US_COMP_ENVIAR_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_send_email');
                                            await launchUrl(Uri(
                                                scheme: 'mailto',
                                                path: 'papuguinho@gmail.com',
                                                query: {
                                                  'subject':
                                                      'Sugestão do usuário:${currentUserDisplayName}',
                                                  'body': _model
                                                      .emailBodyTextController
                                                      .text,
                                                }
                                                    .entries
                                                    .map((MapEntry<String,
                                                                String>
                                                            e) =>
                                                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                    .join('&')));
                                            logFirebaseEvent(
                                                'Button_close_dialog_drawer_etc');
                                            Navigator.pop(context);
                                            logFirebaseEvent(
                                                'Button_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: ThankYouSendWidget(),
                                                );
                                              },
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'vivvawa1' /* ENVIAR */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 230.0,
                                            height: 52.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF6AEA6A),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font:
                                                      GoogleFonts.juliusSansOne(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation']!),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/emailPapuguinho.png',
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
