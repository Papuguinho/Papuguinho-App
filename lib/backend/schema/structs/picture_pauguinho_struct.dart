// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PicturePauguinhoStruct extends FFFirebaseStruct {
  PicturePauguinhoStruct({
    String? img,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _img = img,
        super(firestoreUtilData);

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  static PicturePauguinhoStruct fromMap(Map<String, dynamic> data) =>
      PicturePauguinhoStruct(
        img: data['img'] as String?,
      );

  static PicturePauguinhoStruct? maybeFromMap(dynamic data) => data is Map
      ? PicturePauguinhoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static PicturePauguinhoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PicturePauguinhoStruct(
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PicturePauguinhoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PicturePauguinhoStruct && img == other.img;
  }

  @override
  int get hashCode => const ListEquality().hash([img]);
}

PicturePauguinhoStruct createPicturePauguinhoStruct({
  String? img,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PicturePauguinhoStruct(
      img: img,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PicturePauguinhoStruct? updatePicturePauguinhoStruct(
  PicturePauguinhoStruct? picturePauguinho, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    picturePauguinho
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPicturePauguinhoStructData(
  Map<String, dynamic> firestoreData,
  PicturePauguinhoStruct? picturePauguinho,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (picturePauguinho == null) {
    return;
  }
  if (picturePauguinho.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && picturePauguinho.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final picturePauguinhoData =
      getPicturePauguinhoFirestoreData(picturePauguinho, forFieldValue);
  final nestedData =
      picturePauguinhoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = picturePauguinho.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPicturePauguinhoFirestoreData(
  PicturePauguinhoStruct? picturePauguinho, [
  bool forFieldValue = false,
]) {
  if (picturePauguinho == null) {
    return {};
  }
  final firestoreData = mapToFirestore(picturePauguinho.toMap());

  // Add any Firestore field values
  picturePauguinho.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPicturePauguinhoListFirestoreData(
  List<PicturePauguinhoStruct>? picturePauguinhos,
) =>
    picturePauguinhos
        ?.map((e) => getPicturePauguinhoFirestoreData(e, true))
        .toList() ??
    [];
