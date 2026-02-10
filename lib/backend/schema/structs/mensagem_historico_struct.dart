// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MensagemHistoricoStruct extends FFFirebaseStruct {
  MensagemHistoricoStruct({
    String? mensagem,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mensagem = mensagem,
        _date = date,
        super(firestoreUtilData);

  // "mensagem" field.
  String? _mensagem;
  String get mensagem => _mensagem ?? '';
  set mensagem(String? val) => _mensagem = val;

  bool hasMensagem() => _mensagem != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  static MensagemHistoricoStruct fromMap(Map<String, dynamic> data) =>
      MensagemHistoricoStruct(
        mensagem: data['mensagem'] as String?,
        date: data['date'] as DateTime?,
      );

  static MensagemHistoricoStruct? maybeFromMap(dynamic data) => data is Map
      ? MensagemHistoricoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'mensagem': _mensagem,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mensagem': serializeParam(
          _mensagem,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static MensagemHistoricoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MensagemHistoricoStruct(
        mensagem: deserializeParam(
          data['mensagem'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'MensagemHistoricoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MensagemHistoricoStruct &&
        mensagem == other.mensagem &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([mensagem, date]);
}

MensagemHistoricoStruct createMensagemHistoricoStruct({
  String? mensagem,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MensagemHistoricoStruct(
      mensagem: mensagem,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MensagemHistoricoStruct? updateMensagemHistoricoStruct(
  MensagemHistoricoStruct? mensagemHistorico, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mensagemHistorico
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMensagemHistoricoStructData(
  Map<String, dynamic> firestoreData,
  MensagemHistoricoStruct? mensagemHistorico,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mensagemHistorico == null) {
    return;
  }
  if (mensagemHistorico.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mensagemHistorico.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mensagemHistoricoData =
      getMensagemHistoricoFirestoreData(mensagemHistorico, forFieldValue);
  final nestedData =
      mensagemHistoricoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mensagemHistorico.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMensagemHistoricoFirestoreData(
  MensagemHistoricoStruct? mensagemHistorico, [
  bool forFieldValue = false,
]) {
  if (mensagemHistorico == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mensagemHistorico.toMap());

  // Add any Firestore field values
  mensagemHistorico.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMensagemHistoricoListFirestoreData(
  List<MensagemHistoricoStruct>? mensagemHistoricos,
) =>
    mensagemHistoricos
        ?.map((e) => getMensagemHistoricoFirestoreData(e, true))
        .toList() ??
    [];
