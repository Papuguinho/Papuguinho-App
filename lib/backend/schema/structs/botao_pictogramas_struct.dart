// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BotaoPictogramasStruct extends FFFirebaseStruct {
  BotaoPictogramasStruct({
    String? texto,
    Color? cor,
    String? img,
    bool? ativo,
    int? index,
    String? donoUid,
    String? idPictograma,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _texto = texto,
        _cor = cor,
        _img = img,
        _ativo = ativo,
        _index = index,
        _donoUid = donoUid,
        _idPictograma = idPictograma,
        super(firestoreUtilData);

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  set texto(String? val) => _texto = val;

  bool hasTexto() => _texto != null;

  // "cor" field.
  Color? _cor;
  Color? get cor => _cor;
  set cor(Color? val) => _cor = val;

  bool hasCor() => _cor != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "Ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? true;
  set ativo(bool? val) => _ativo = val;

  bool hasAtivo() => _ativo != null;

  // "Index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  // "dono_uid" field.
  String? _donoUid;
  String get donoUid => _donoUid ?? '';
  set donoUid(String? val) => _donoUid = val;

  bool hasDonoUid() => _donoUid != null;

  // "idPictograma" field.
  String? _idPictograma;
  String get idPictograma => _idPictograma ?? '';
  set idPictograma(String? val) => _idPictograma = val;

  bool hasIdPictograma() => _idPictograma != null;

  static BotaoPictogramasStruct fromMap(Map<String, dynamic> data) =>
      BotaoPictogramasStruct(
        texto: data['texto'] as String?,
        cor: getSchemaColor(data['cor']),
        img: data['img'] as String?,
        ativo: data['Ativo'] as bool?,
        index: castToType<int>(data['Index']),
        donoUid: data['dono_uid'] as String?,
        idPictograma: data['idPictograma'] as String?,
      );

  static BotaoPictogramasStruct? maybeFromMap(dynamic data) => data is Map
      ? BotaoPictogramasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'texto': _texto,
        'cor': _cor,
        'img': _img,
        'Ativo': _ativo,
        'Index': _index,
        'dono_uid': _donoUid,
        'idPictograma': _idPictograma,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'texto': serializeParam(
          _texto,
          ParamType.String,
        ),
        'cor': serializeParam(
          _cor,
          ParamType.Color,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'Ativo': serializeParam(
          _ativo,
          ParamType.bool,
        ),
        'Index': serializeParam(
          _index,
          ParamType.int,
        ),
        'dono_uid': serializeParam(
          _donoUid,
          ParamType.String,
        ),
        'idPictograma': serializeParam(
          _idPictograma,
          ParamType.String,
        ),
      }.withoutNulls;

  static BotaoPictogramasStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BotaoPictogramasStruct(
        texto: deserializeParam(
          data['texto'],
          ParamType.String,
          false,
        ),
        cor: deserializeParam(
          data['cor'],
          ParamType.Color,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        ativo: deserializeParam(
          data['Ativo'],
          ParamType.bool,
          false,
        ),
        index: deserializeParam(
          data['Index'],
          ParamType.int,
          false,
        ),
        donoUid: deserializeParam(
          data['dono_uid'],
          ParamType.String,
          false,
        ),
        idPictograma: deserializeParam(
          data['idPictograma'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BotaoPictogramasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BotaoPictogramasStruct &&
        texto == other.texto &&
        cor == other.cor &&
        img == other.img &&
        ativo == other.ativo &&
        index == other.index &&
        donoUid == other.donoUid &&
        idPictograma == other.idPictograma;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([texto, cor, img, ativo, index, donoUid, idPictograma]);
}

BotaoPictogramasStruct createBotaoPictogramasStruct({
  String? texto,
  Color? cor,
  String? img,
  bool? ativo,
  int? index,
  String? donoUid,
  String? idPictograma,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BotaoPictogramasStruct(
      texto: texto,
      cor: cor,
      img: img,
      ativo: ativo,
      index: index,
      donoUid: donoUid,
      idPictograma: idPictograma,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BotaoPictogramasStruct? updateBotaoPictogramasStruct(
  BotaoPictogramasStruct? botaoPictogramas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    botaoPictogramas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBotaoPictogramasStructData(
  Map<String, dynamic> firestoreData,
  BotaoPictogramasStruct? botaoPictogramas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (botaoPictogramas == null) {
    return;
  }
  if (botaoPictogramas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && botaoPictogramas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final botaoPictogramasData =
      getBotaoPictogramasFirestoreData(botaoPictogramas, forFieldValue);
  final nestedData =
      botaoPictogramasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = botaoPictogramas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBotaoPictogramasFirestoreData(
  BotaoPictogramasStruct? botaoPictogramas, [
  bool forFieldValue = false,
]) {
  if (botaoPictogramas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(botaoPictogramas.toMap());

  // Add any Firestore field values
  botaoPictogramas.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBotaoPictogramasListFirestoreData(
  List<BotaoPictogramasStruct>? botaoPictogramass,
) =>
    botaoPictogramass
        ?.map((e) => getBotaoPictogramasFirestoreData(e, true))
        .toList() ??
    [];
