import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BibliotecaPictogramasRecord extends FirestoreRecord {
  BibliotecaPictogramasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "imagem_64" field.
  String? _imagem64;
  String get imagem64 => _imagem64 ?? '';
  bool hasImagem64() => _imagem64 != null;

  // "dono_uid" field.
  String? _donoUid;
  String get donoUid => _donoUid ?? '';
  bool hasDonoUid() => _donoUid != null;

  // "tipo_pictograma" field.
  bool? _tipoPictograma;
  bool get tipoPictograma => _tipoPictograma ?? false;
  bool hasTipoPictograma() => _tipoPictograma != null;

  // "cor" field.
  Color? _cor;
  Color? get cor => _cor;
  bool hasCor() => _cor != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _imagem64 = snapshotData['imagem_64'] as String?;
    _donoUid = snapshotData['dono_uid'] as String?;
    _tipoPictograma = snapshotData['tipo_pictograma'] as bool?;
    _cor = getSchemaColor(snapshotData['cor']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('biblioteca_pictogramas');

  static Stream<BibliotecaPictogramasRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => BibliotecaPictogramasRecord.fromSnapshot(s));

  static Future<BibliotecaPictogramasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BibliotecaPictogramasRecord.fromSnapshot(s));

  static BibliotecaPictogramasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BibliotecaPictogramasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BibliotecaPictogramasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BibliotecaPictogramasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BibliotecaPictogramasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BibliotecaPictogramasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBibliotecaPictogramasRecordData({
  String? nome,
  String? imagem64,
  String? donoUid,
  bool? tipoPictograma,
  Color? cor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'imagem_64': imagem64,
      'dono_uid': donoUid,
      'tipo_pictograma': tipoPictograma,
      'cor': cor,
    }.withoutNulls,
  );

  return firestoreData;
}

class BibliotecaPictogramasRecordDocumentEquality
    implements Equality<BibliotecaPictogramasRecord> {
  const BibliotecaPictogramasRecordDocumentEquality();

  @override
  bool equals(
      BibliotecaPictogramasRecord? e1, BibliotecaPictogramasRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.imagem64 == e2?.imagem64 &&
        e1?.donoUid == e2?.donoUid &&
        e1?.tipoPictograma == e2?.tipoPictograma &&
        e1?.cor == e2?.cor;
  }

  @override
  int hash(BibliotecaPictogramasRecord? e) => const ListEquality()
      .hash([e?.nome, e?.imagem64, e?.donoUid, e?.tipoPictograma, e?.cor]);

  @override
  bool isValidKey(Object? o) => o is BibliotecaPictogramasRecord;
}
