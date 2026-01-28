// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BotaoPastaStruct extends FFFirebaseStruct {
  BotaoPastaStruct({
    String? texto,
    String? imagem,
    Color? cor,
    String? destino,
    String? uid,
    List<BotaoPictogramasStruct>? conteudo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _texto = texto,
        _imagem = imagem,
        _cor = cor,
        _destino = destino,
        _uid = uid,
        _conteudo = conteudo,
        super(firestoreUtilData);

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  set texto(String? val) => _texto = val;

  bool hasTexto() => _texto != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  set imagem(String? val) => _imagem = val;

  bool hasImagem() => _imagem != null;

  // "cor" field.
  Color? _cor;
  Color get cor => _cor ?? const Color(0xFF153A18);
  set cor(Color? val) => _cor = val;

  bool hasCor() => _cor != null;

  // "destino" field.
  String? _destino;
  String get destino => _destino ?? '';
  set destino(String? val) => _destino = val;

  bool hasDestino() => _destino != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "conteudo" field.
  List<BotaoPictogramasStruct>? _conteudo;
  List<BotaoPictogramasStruct> get conteudo => _conteudo ?? const [];
  set conteudo(List<BotaoPictogramasStruct>? val) => _conteudo = val;

  void updateConteudo(Function(List<BotaoPictogramasStruct>) updateFn) {
    updateFn(_conteudo ??= []);
  }

  bool hasConteudo() => _conteudo != null;

  static BotaoPastaStruct fromMap(Map<String, dynamic> data) =>
      BotaoPastaStruct(
        texto: data['texto'] as String?,
        imagem: data['imagem'] as String?,
        cor: getSchemaColor(data['cor']),
        destino: data['destino'] as String?,
        uid: data['uid'] as String?,
        conteudo: getStructList(
          data['conteudo'],
          BotaoPictogramasStruct.fromMap,
        ),
      );

  static BotaoPastaStruct? maybeFromMap(dynamic data) => data is Map
      ? BotaoPastaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'texto': _texto,
        'imagem': _imagem,
        'cor': _cor,
        'destino': _destino,
        'uid': _uid,
        'conteudo': _conteudo?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'texto': serializeParam(
          _texto,
          ParamType.String,
        ),
        'imagem': serializeParam(
          _imagem,
          ParamType.String,
        ),
        'cor': serializeParam(
          _cor,
          ParamType.Color,
        ),
        'destino': serializeParam(
          _destino,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'conteudo': serializeParam(
          _conteudo,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static BotaoPastaStruct fromSerializableMap(Map<String, dynamic> data) =>
      BotaoPastaStruct(
        texto: deserializeParam(
          data['texto'],
          ParamType.String,
          false,
        ),
        imagem: deserializeParam(
          data['imagem'],
          ParamType.String,
          false,
        ),
        cor: deserializeParam(
          data['cor'],
          ParamType.Color,
          false,
        ),
        destino: deserializeParam(
          data['destino'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        conteudo: deserializeStructParam<BotaoPictogramasStruct>(
          data['conteudo'],
          ParamType.DataStruct,
          true,
          structBuilder: BotaoPictogramasStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'BotaoPastaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BotaoPastaStruct &&
        texto == other.texto &&
        imagem == other.imagem &&
        cor == other.cor &&
        destino == other.destino &&
        uid == other.uid &&
        listEquality.equals(conteudo, other.conteudo);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([texto, imagem, cor, destino, uid, conteudo]);
}

BotaoPastaStruct createBotaoPastaStruct({
  String? texto,
  String? imagem,
  Color? cor,
  String? destino,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BotaoPastaStruct(
      texto: texto,
      imagem: imagem,
      cor: cor,
      destino: destino,
      uid: uid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BotaoPastaStruct? updateBotaoPastaStruct(
  BotaoPastaStruct? botaoPasta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    botaoPasta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBotaoPastaStructData(
  Map<String, dynamic> firestoreData,
  BotaoPastaStruct? botaoPasta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (botaoPasta == null) {
    return;
  }
  if (botaoPasta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && botaoPasta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final botaoPastaData = getBotaoPastaFirestoreData(botaoPasta, forFieldValue);
  final nestedData = botaoPastaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = botaoPasta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBotaoPastaFirestoreData(
  BotaoPastaStruct? botaoPasta, [
  bool forFieldValue = false,
]) {
  if (botaoPasta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(botaoPasta.toMap());

  // Add any Firestore field values
  botaoPasta.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBotaoPastaListFirestoreData(
  List<BotaoPastaStruct>? botaoPastas,
) =>
    botaoPastas?.map((e) => getBotaoPastaFirestoreData(e, true)).toList() ?? [];
