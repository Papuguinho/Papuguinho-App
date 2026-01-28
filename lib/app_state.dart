import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _foto = await secureStorage.getString('ff_foto') ?? _foto;
    });
    await _safeInitAsync(() async {
      _modoInfantil =
          await secureStorage.getBool('ff_modoInfantil') ?? _modoInfantil;
    });
    await _safeInitAsync(() async {
      _vinculadoGoogle =
          await secureStorage.getBool('ff_vinculadoGoogle') ?? _vinculadoGoogle;
    });
    await _safeInitAsync(() async {
      _ListaBoardHospital =
          (await secureStorage.getStringList('ff_ListaBoardHospital'))
                  ?.map((x) {
                    try {
                      return BotaoPictogramasStruct.fromSerializableMap(
                          jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _ListaBoardHospital;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _displaymensage = [];
  List<String> get displaymensage => _displaymensage;
  set displaymensage(List<String> value) {
    _displaymensage = value;
  }

  void addToDisplaymensage(String value) {
    displaymensage.add(value);
  }

  void removeFromDisplaymensage(String value) {
    displaymensage.remove(value);
  }

  void removeAtIndexFromDisplaymensage(int index) {
    displaymensage.removeAt(index);
  }

  void updateDisplaymensageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    displaymensage[index] = updateFn(_displaymensage[index]);
  }

  void insertAtIndexInDisplaymensage(int index, String value) {
    displaymensage.insert(index, value);
  }

  String _Historico = '';
  String get Historico => _Historico;
  set Historico(String value) {
    _Historico = value;
  }

  String _foto = 'https://www.nutriexperto.com/images/avatars/invitado.jpg';
  String get foto => _foto;
  set foto(String value) {
    _foto = value;
    secureStorage.setString('ff_foto', value);
  }

  void deleteFoto() {
    secureStorage.delete(key: 'ff_foto');
  }

  int _contador = 0;
  int get contador => _contador;
  set contador(int value) {
    _contador = value;
  }

  DateTime? _dataC2;
  DateTime? get dataC2 => _dataC2;
  set dataC2(DateTime? value) {
    _dataC2 = value;
  }

  String _palavraTemas = '';
  String get palavraTemas => _palavraTemas;
  set palavraTemas(String value) {
    _palavraTemas = value;
  }

  bool _buttonPress = false;
  bool get buttonPress => _buttonPress;
  set buttonPress(bool value) {
    _buttonPress = value;
  }

  List<BotaoPictogramasStruct> _listaBoardGeral = [
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Eu\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/vl1vs3v6lo52/eu_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Você\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/bfnzmf7cky2f/você_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Oi\",\"cor\":\"#ffa9dd\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/d5yb38zhio30/olá.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Tchau\",\"cor\":\"#ffa9dd\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/ht9redvdbk5p/dizer_adeus.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Querer\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/uj1a17nnh0pp/querer_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Ver\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/4wiq4s39xi6o/ver_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Ajudar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/st6wem20eson/ajudar_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Pegar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/uby3c7bnu7or/pegar_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Parar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/kfe1oqyhhkkz/parar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"O que?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/szuszs0bsmst/o_quê.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Porquê?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/g0vh7kabwjut/porquê.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Sim\",\"cor\":\"#b0f0a5\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/uchwk9rq9nia/sim.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Não\",\"cor\":\"#fb8f9e\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/1nn4o343ibh8/não.png\"}'))
  ];
  List<BotaoPictogramasStruct> get listaBoardGeral => _listaBoardGeral;
  set listaBoardGeral(List<BotaoPictogramasStruct> value) {
    _listaBoardGeral = value;
  }

  void addToListaBoardGeral(BotaoPictogramasStruct value) {
    listaBoardGeral.add(value);
  }

  void removeFromListaBoardGeral(BotaoPictogramasStruct value) {
    listaBoardGeral.remove(value);
  }

  void removeAtIndexFromListaBoardGeral(int index) {
    listaBoardGeral.removeAt(index);
  }

  void updateListaBoardGeralAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    listaBoardGeral[index] = updateFn(_listaBoardGeral[index]);
  }

  void insertAtIndexInListaBoardGeral(int index, BotaoPictogramasStruct value) {
    listaBoardGeral.insert(index, value);
  }

  List<BotaoPictogramasStruct> _listaBoardPronome = [
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Ela\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/a70760kowfdf/ela.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Elas\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/1o6gvch24019/elas.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Ele\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/43vj4n4o0r49/ele.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Eles\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/0wmulb6g53ut/eles.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Tu\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/k8mhyf4thk4r/tu.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Nós\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/o858ctu0uz4o/nós.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Meu\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/vc0mbpqv9h1d/meu.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Meus\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/7yybu65zqb0p/meus.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Seu\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/u2e9spxdp6kn/seu.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Seus\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/hu10g62l3709/seus.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Nosso\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/sjjmkpf3i397/nosso.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Nossos\",\"cor\":\"#ffda89\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/8msraa1hm4w4/nossos.png\"}'))
  ];
  List<BotaoPictogramasStruct> get listaBoardPronome => _listaBoardPronome;
  set listaBoardPronome(List<BotaoPictogramasStruct> value) {
    _listaBoardPronome = value;
  }

  void addToListaBoardPronome(BotaoPictogramasStruct value) {
    listaBoardPronome.add(value);
  }

  void removeFromListaBoardPronome(BotaoPictogramasStruct value) {
    listaBoardPronome.remove(value);
  }

  void removeAtIndexFromListaBoardPronome(int index) {
    listaBoardPronome.removeAt(index);
  }

  void updateListaBoardPronomeAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    listaBoardPronome[index] = updateFn(_listaBoardPronome[index]);
  }

  void insertAtIndexInListaBoardPronome(
      int index, BotaoPictogramasStruct value) {
    listaBoardPronome.insert(index, value);
  }

  List<BotaoPictogramasStruct> _listaBoardVerbo = [
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Andar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/3og2lvpfsen4/andar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Brincar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/ah0xvz384ng4/brincar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Escutar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/d93xgjudubn0/escutar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Correr\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/q6mmngnpq7b9/correr.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Pular\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/3faaya4l8cq5/pular.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Segurar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/n0rbs1utbtiv/segurar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Rir\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/kx7bbw97okag/rir_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Entender\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/jby8j5loaw2c/entender.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Chorar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/03rxzgb08lgw/chorar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Tirar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/1bxuee8ryvcw/tirar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Colocar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/j3es43a3oqba/colocar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Mostrar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/ud2ii21awfju/mostrar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Pedir\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/lg31vpckquty/pedir.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Chamar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/znpoi0jbru5p/chamar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Abaixar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/6lhw6pkp0kya/abaixar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Levantar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/9izpsere96uz/levantar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Falar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/y7xbeqpaeknk/falar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Esperar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/abwu0ft0mo3g/esperar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Lamber\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/9q2ajjde4o5a/lamber.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Dar\",\"cor\":\"#72cccb\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/6svzybftezfv/dar.png\"}'))
  ];
  List<BotaoPictogramasStruct> get listaBoardVerbo => _listaBoardVerbo;
  set listaBoardVerbo(List<BotaoPictogramasStruct> value) {
    _listaBoardVerbo = value;
  }

  void addToListaBoardVerbo(BotaoPictogramasStruct value) {
    listaBoardVerbo.add(value);
  }

  void removeFromListaBoardVerbo(BotaoPictogramasStruct value) {
    listaBoardVerbo.remove(value);
  }

  void removeAtIndexFromListaBoardVerbo(int index) {
    listaBoardVerbo.removeAt(index);
  }

  void updateListaBoardVerboAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    listaBoardVerbo[index] = updateFn(_listaBoardVerbo[index]);
  }

  void insertAtIndexInListaBoardVerbo(int index, BotaoPictogramasStruct value) {
    listaBoardVerbo.insert(index, value);
  }

  List<BotaoPictogramasStruct> _listaBoardEmocao = [
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Estou\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/n9pm9w5hxezc/estado.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Bem\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/tmn4c1j381s9/estou_bem_(2).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Mal\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/chvkmfkzkisu/estou_mal_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Confuso\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/niseyfbytnf2/confusão_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Feliz\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/haw8ad2i3c2x/alegria_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Triste\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/qh0me9mtz7c5/tristeza.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Tranquilo\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/4g4jrfwv1jsm/tranquilo.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Vergonha\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/khs3gtk212d9/envergonhar_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Nojo\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/dt8n58dstwvc/nojo_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Ansioso\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/xzc099tfpwgp/ansioso_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Bravo\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/3jh7lgokxlrb/furioso.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Irritado\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/nxs263ygmh20/irritação_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Surpreso\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/u8i0eq8dx17k/surpresa.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Sério\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/mn1jpjc5q4en/sério.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Distraído\",\"cor\":\"#aef0ff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/oppksjabh5b3/distrair.png\"}'))
  ];
  List<BotaoPictogramasStruct> get listaBoardEmocao => _listaBoardEmocao;
  set listaBoardEmocao(List<BotaoPictogramasStruct> value) {
    _listaBoardEmocao = value;
  }

  void addToListaBoardEmocao(BotaoPictogramasStruct value) {
    listaBoardEmocao.add(value);
  }

  void removeFromListaBoardEmocao(BotaoPictogramasStruct value) {
    listaBoardEmocao.remove(value);
  }

  void removeAtIndexFromListaBoardEmocao(int index) {
    listaBoardEmocao.removeAt(index);
  }

  void updateListaBoardEmocaoAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    listaBoardEmocao[index] = updateFn(_listaBoardEmocao[index]);
  }

  void insertAtIndexInListaBoardEmocao(
      int index, BotaoPictogramasStruct value) {
    listaBoardEmocao.insert(index, value);
  }

  List<BotaoPictogramasStruct> _listaBoardTempo = [
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Agora\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/n73cs5noay4j/agora.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Depois\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/ffc3jrsl9fq3/depois.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"horas ?\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/v5cy97dagu0a/que_horas_são.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Dia\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/ntjlzizgd52s/dia.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Noite\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/u8jpvgh3wlo1/noite.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Tarde\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/ewbgkvl1empt/tarde.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Hoje\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/t1urw17hlctr/dia_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Amanhã\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/5qd55e6sx952/amanhã_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Ontem\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/vjrxat8i6tbf/ontem_(1).png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Qual dia ?\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/aotxdfmu3gp8/quantos_dias.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Bom dia\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/jl2kfai4eu9z/Bom_dia!.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Boa noite\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/sphwwqnqk3yh/Boa_noite!.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Boa tarde\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/t07cb1yv5r3h/Boa_tarde!.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Tarde\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/iibivcj9hbnq/tarde_(1).png \"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Acordar \",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/rp83w0s1vmj9/acordar_cedo.png\"}'))
  ];
  List<BotaoPictogramasStruct> get listaBoardTempo => _listaBoardTempo;
  set listaBoardTempo(List<BotaoPictogramasStruct> value) {
    _listaBoardTempo = value;
  }

  void addToListaBoardTempo(BotaoPictogramasStruct value) {
    listaBoardTempo.add(value);
  }

  void removeFromListaBoardTempo(BotaoPictogramasStruct value) {
    listaBoardTempo.remove(value);
  }

  void removeAtIndexFromListaBoardTempo(int index) {
    listaBoardTempo.removeAt(index);
  }

  void updateListaBoardTempoAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    listaBoardTempo[index] = updateFn(_listaBoardTempo[index]);
  }

  void insertAtIndexInListaBoardTempo(int index, BotaoPictogramasStruct value) {
    listaBoardTempo.insert(index, value);
  }

  List<BotaoPastaStruct> _listaBoardPastas = [
    BotaoPastaStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Banheiro\",\"imagem\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/kgvk1yoggu41/banheiro.png\",\"cor\":\"#7289eb\",\"destino\":\"T_BANHEIRO\",\"conteudo\":\"[]\"}')),
    BotaoPastaStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Pronomes\",\"imagem\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/n12mzi9ej56q/quem.png\",\"cor\":\"#ffda89\",\"destino\":\"boardPronome\",\"conteudo\":\"[]\"}')),
    BotaoPastaStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Ações\",\"imagem\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/4fhof611n8ud/verbo.png\",\"cor\":\"#72cccb\",\"destino\":\"boardAcao\",\"conteudo\":\"[]\"}')),
    BotaoPastaStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Perguntas\",\"imagem\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/dhjf31a7ddz2/perguntar.png\",\"cor\":\"#ba9df4\",\"destino\":\"boardPergunta\",\"conteudo\":\"[]\"}')),
    BotaoPastaStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Tempo\",\"imagem\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/m6y86ps13sef/tempo.png\",\"cor\":\"#fff\",\"destino\":\"boardTempo\",\"conteudo\":\"[]\"}')),
    BotaoPastaStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Emoções\",\"imagem\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/8vro2nqlkckj/sentimentos.png\",\"cor\":\"#aef0ff\",\"destino\":\"boardEmocao\",\"conteudo\":\"[]\"}')),
    BotaoPastaStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Objetos\",\"imagem\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/vmdxe0ogg2zm/objecto.png\",\"cor\":\"#fff\",\"destino\":\"boardCoisa\",\"conteudo\":\"[]\"}')),
    BotaoPastaStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Hospital\",\"imagem\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/gm04j5v45yw6/hospital.png\",\"cor\":\"#ff6961\",\"destino\":\"boardHospital\",\"uid\":\"\",\"conteudo\":\"[\\\"{\\\\\\\"texto\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"cor\\\\\\\":\\\\\\\"#0000\\\\\\\",\\\\\\\"img\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"Ativo\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"Index\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"dono_uid\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"idPictograma\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\"}')),
    BotaoPastaStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Comidas\",\"imagem\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/sogtko91tcwk/comida_(2).png\",\"cor\":\"#fff\",\"destino\":\"boardComida\",\"uid\":\"Hello World\",\"conteudo\":\"[\\\"{\\\\\\\"texto\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"cor\\\\\\\":\\\\\\\"#0000\\\\\\\",\\\\\\\"img\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"Ativo\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"Index\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"dono_uid\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"idPictograma\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\"}')),
    BotaoPastaStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Escola\",\"imagem\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/dvm6nnzr0ld7/escola.png\",\"cor\":\"#fec683\",\"destino\":\"boardEscola\",\"uid\":\"Hello World\",\"conteudo\":\"[\\\"{\\\\\\\"texto\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"cor\\\\\\\":\\\\\\\"#0000\\\\\\\",\\\\\\\"img\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"Ativo\\\\\\\":\\\\\\\"false\\\\\\\",\\\\\\\"Index\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"dono_uid\\\\\\\":\\\\\\\"Hello World\\\\\\\",\\\\\\\"idPictograma\\\\\\\":\\\\\\\"Hello World\\\\\\\"}\\\"]\"}'))
  ];
  List<BotaoPastaStruct> get listaBoardPastas => _listaBoardPastas;
  set listaBoardPastas(List<BotaoPastaStruct> value) {
    _listaBoardPastas = value;
  }

  void addToListaBoardPastas(BotaoPastaStruct value) {
    listaBoardPastas.add(value);
  }

  void removeFromListaBoardPastas(BotaoPastaStruct value) {
    listaBoardPastas.remove(value);
  }

  void removeAtIndexFromListaBoardPastas(int index) {
    listaBoardPastas.removeAt(index);
  }

  void updateListaBoardPastasAtIndex(
    int index,
    BotaoPastaStruct Function(BotaoPastaStruct) updateFn,
  ) {
    listaBoardPastas[index] = updateFn(_listaBoardPastas[index]);
  }

  void insertAtIndexInListaBoardPastas(int index, BotaoPastaStruct value) {
    listaBoardPastas.insert(index, value);
  }

  List<BotaoPictogramasStruct> _listaBoardCoisa = [
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Bola\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/jwcsx1gdnvlq/bola.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Boneco\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/2x8fx19abus6/boneco.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Brinquedo\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/9vao2tezha2g/brinquedos.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Caderno\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/pbkpmmvnsc7g/caderno.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Lápis\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/poz3tbybnnkv/lápis.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Borracha\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/fjta20t5yl0i/borracha.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Garrafa\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/0j7pd1cjd9r6/garrafa_de_água_de_metal.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Mochila\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/mc5xhmxfehd2/mochila.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Cama\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/1rk2ctr6k9om/cama.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Coberta\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/bmzslglddqzl/coberta.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Pijama\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/e6llzxaa56ds/pijama.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Mesa\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/9xmk4682bdfw/mesa.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Geladeira\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/hlpged2rjzkt/geladeira.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Isso\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/jq7028dm9yja/isso.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Aquilo\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/z3fruham78zf/aquilo.png\"}'))
  ];
  List<BotaoPictogramasStruct> get listaBoardCoisa => _listaBoardCoisa;
  set listaBoardCoisa(List<BotaoPictogramasStruct> value) {
    _listaBoardCoisa = value;
  }

  void addToListaBoardCoisa(BotaoPictogramasStruct value) {
    listaBoardCoisa.add(value);
  }

  void removeFromListaBoardCoisa(BotaoPictogramasStruct value) {
    listaBoardCoisa.remove(value);
  }

  void removeAtIndexFromListaBoardCoisa(int index) {
    listaBoardCoisa.removeAt(index);
  }

  void updateListaBoardCoisaAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    listaBoardCoisa[index] = updateFn(_listaBoardCoisa[index]);
  }

  void insertAtIndexInListaBoardCoisa(int index, BotaoPictogramasStruct value) {
    listaBoardCoisa.insert(index, value);
  }

  List<BotaoPictogramasStruct> _listaBoardPergunta = [
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Me ajuda ?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/cw2b2kwxidef/ajudar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Banheiro?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/kgvk1yoggu41/banheiro.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Brincar?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/ah0xvz384ng4/brincar.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Beber?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/0roiadse4cui/beber.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Comer?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/br3iunb53l5u/comer.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Jogar?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/db6dyhz7jo47/jogar_no_tablet.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Assistir?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/78ao4d18fjrd/assistir_televisão.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Dormir?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/2ppqz6q2uyzd/dormir.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\" Banho ?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/61pzk754xno7/banho.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"O que é ?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/1v482q21iqg1/o_que_é_isso.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Onde é?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/9c1pwipitc29/onde_vamos.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Qual nome ?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/86erww33249i/qual_é_o_seu_nome.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Onde está ?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/m0e6ffyyheoc/onde_está.png\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Quando ?\",\"cor\":\"#ba9df4\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/tmrs4kwyj21t/quando.png\"}'))
  ];
  List<BotaoPictogramasStruct> get listaBoardPergunta => _listaBoardPergunta;
  set listaBoardPergunta(List<BotaoPictogramasStruct> value) {
    _listaBoardPergunta = value;
  }

  void addToListaBoardPergunta(BotaoPictogramasStruct value) {
    listaBoardPergunta.add(value);
  }

  void removeFromListaBoardPergunta(BotaoPictogramasStruct value) {
    listaBoardPergunta.remove(value);
  }

  void removeAtIndexFromListaBoardPergunta(int index) {
    listaBoardPergunta.removeAt(index);
  }

  void updateListaBoardPerguntaAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    listaBoardPergunta[index] = updateFn(_listaBoardPergunta[index]);
  }

  void insertAtIndexInListaBoardPergunta(
      int index, BotaoPictogramasStruct value) {
    listaBoardPergunta.insert(index, value);
  }

  List<PicturePauguinhoStruct> _listaPicturePapuguinho = [
    PicturePauguinhoStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/y8e1t3rnc8h3/papagaio.png\"}')),
    PicturePauguinhoStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/vyewl91v06m7/papuguinhoAstronauta.png\"}')),
    PicturePauguinhoStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/gmsty5z8013i/papuguinhoChefe.png\"}')),
    PicturePauguinhoStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/91t53n74qgic/papuguinhoPirata.png\"}')),
    PicturePauguinhoStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/trnh1i8kpv58/papuguinhoDoctor.png\"}')),
    PicturePauguinhoStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/we7cc8nrnfk5/papuguinhoMago.png\"}'))
  ];
  List<PicturePauguinhoStruct> get listaPicturePapuguinho =>
      _listaPicturePapuguinho;
  set listaPicturePapuguinho(List<PicturePauguinhoStruct> value) {
    _listaPicturePapuguinho = value;
  }

  void addToListaPicturePapuguinho(PicturePauguinhoStruct value) {
    listaPicturePapuguinho.add(value);
  }

  void removeFromListaPicturePapuguinho(PicturePauguinhoStruct value) {
    listaPicturePapuguinho.remove(value);
  }

  void removeAtIndexFromListaPicturePapuguinho(int index) {
    listaPicturePapuguinho.removeAt(index);
  }

  void updateListaPicturePapuguinhoAtIndex(
    int index,
    PicturePauguinhoStruct Function(PicturePauguinhoStruct) updateFn,
  ) {
    listaPicturePapuguinho[index] = updateFn(_listaPicturePapuguinho[index]);
  }

  void insertAtIndexInListaPicturePapuguinho(
      int index, PicturePauguinhoStruct value) {
    listaPicturePapuguinho.insert(index, value);
  }

  /// Variável que recebe um booleno, e que restringe ações como acessar o
  /// perfil e personalizar os pictogramas
  bool _modoInfantil = false;
  bool get modoInfantil => _modoInfantil;
  set modoInfantil(bool value) {
    _modoInfantil = value;
    secureStorage.setBool('ff_modoInfantil', value);
  }

  void deleteModoInfantil() {
    secureStorage.delete(key: 'ff_modoInfantil');
  }

  bool _modoEdicao = false;
  bool get modoEdicao => _modoEdicao;
  set modoEdicao(bool value) {
    _modoEdicao = value;
  }

  List<BotaoPictogramasStruct> _PictogramasGeral = [];
  List<BotaoPictogramasStruct> get PictogramasGeral => _PictogramasGeral;
  set PictogramasGeral(List<BotaoPictogramasStruct> value) {
    _PictogramasGeral = value;
  }

  void addToPictogramasGeral(BotaoPictogramasStruct value) {
    PictogramasGeral.add(value);
  }

  void removeFromPictogramasGeral(BotaoPictogramasStruct value) {
    PictogramasGeral.remove(value);
  }

  void removeAtIndexFromPictogramasGeral(int index) {
    PictogramasGeral.removeAt(index);
  }

  void updatePictogramasGeralAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    PictogramasGeral[index] = updateFn(_PictogramasGeral[index]);
  }

  void insertAtIndexInPictogramasGeral(
      int index, BotaoPictogramasStruct value) {
    PictogramasGeral.insert(index, value);
  }

  String _idPastaAberta = '';
  String get idPastaAberta => _idPastaAberta;
  set idPastaAberta(String value) {
    _idPastaAberta = value;
  }

  bool _vinculadoGoogle = false;
  bool get vinculadoGoogle => _vinculadoGoogle;
  set vinculadoGoogle(bool value) {
    _vinculadoGoogle = value;
    secureStorage.setBool('ff_vinculadoGoogle', value);
  }

  void deleteVinculadoGoogle() {
    secureStorage.delete(key: 'ff_vinculadoGoogle');
  }

  bool _appCarregado = false;
  bool get appCarregado => _appCarregado;
  set appCarregado(bool value) {
    _appCarregado = value;
  }

  int _contadorQueryPersonalizados = 0;
  int get contadorQueryPersonalizados => _contadorQueryPersonalizados;
  set contadorQueryPersonalizados(int value) {
    _contadorQueryPersonalizados = value;
  }

  List<BotaoPictogramasStruct> _ListaBoardHospital = [
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Estou com\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/bo2f60vr0n68/estar.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Medo\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/wg6svt4goc3n/medo.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Sentir\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/5f9w308bs5x4/sentir_(1).png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"dor\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/lcrunhzk74cr/dor.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Dor cabeça\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/m0kxsqynb5dh/dor_de_cabeça.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Dor barriga\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/lcpovio2cb89/dor_de_estômago.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Dor peito\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/gms9tljy9o7m/dor_no_peito.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"DOR DENTE\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/ntsxyzccs8pp/dor_de_dentes.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"DOR pé\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/uoyhfafde8tu/dor_no_pé.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"dor mão\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/qezare3v251e/dor_na_mão.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"dor perna\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/k2v0yt4ga6xd/dor_na_perna.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"FISIO\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/g4drq7zfem3m/centro_de_fisioterapia.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"GINÁSIO\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/c3xmqif59ns1/gin%C3%A1sio.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"REMÉDIO\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/mg8ok5uga64z/farm%C3%A1cia.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Febre\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/8bsupeehw2o3/doença.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Asma\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/4rggrfteymmr/asma.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Médico\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/aldwqyf8chb7/gabinete_de_enfermagem.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Dentista\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/gu8yhalq8prz/dentista.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"exame\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/vyy1q36ajgfe/sala_de_colheita.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Consulta\",\"cor\":\"#ff6961\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/xkmy7q7w9s6z/sala_de_observação.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}'))
  ];
  List<BotaoPictogramasStruct> get ListaBoardHospital => _ListaBoardHospital;
  set ListaBoardHospital(List<BotaoPictogramasStruct> value) {
    _ListaBoardHospital = value;
    secureStorage.setStringList(
        'ff_ListaBoardHospital', value.map((x) => x.serialize()).toList());
  }

  void deleteListaBoardHospital() {
    secureStorage.delete(key: 'ff_ListaBoardHospital');
  }

  void addToListaBoardHospital(BotaoPictogramasStruct value) {
    ListaBoardHospital.add(value);
    secureStorage.setStringList('ff_ListaBoardHospital',
        _ListaBoardHospital.map((x) => x.serialize()).toList());
  }

  void removeFromListaBoardHospital(BotaoPictogramasStruct value) {
    ListaBoardHospital.remove(value);
    secureStorage.setStringList('ff_ListaBoardHospital',
        _ListaBoardHospital.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListaBoardHospital(int index) {
    ListaBoardHospital.removeAt(index);
    secureStorage.setStringList('ff_ListaBoardHospital',
        _ListaBoardHospital.map((x) => x.serialize()).toList());
  }

  void updateListaBoardHospitalAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    ListaBoardHospital[index] = updateFn(_ListaBoardHospital[index]);
    secureStorage.setStringList('ff_ListaBoardHospital',
        _ListaBoardHospital.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListaBoardHospital(
      int index, BotaoPictogramasStruct value) {
    ListaBoardHospital.insert(index, value);
    secureStorage.setStringList('ff_ListaBoardHospital',
        _ListaBoardHospital.map((x) => x.serialize()).toList());
  }

  List<BotaoPictogramasStruct> _listaBoardComida = [
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Quero\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/e3h2gvbqsdbx/eu_quero.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Gosto\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/3qgl91eizxby/gostar.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Não gosto\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/19cixsn2j4sd/não_gostar.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Fome\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/4fajr9tne1jz/ter_fome.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Uva\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/w49v20lyvuyd/uvas_roxas.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Maçã\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/0dj4frr0eybs/maçã.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Banana\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/2wn2r9du5oqp/banana.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Laranja\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/saycrt3ilw2b/laranja.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Arroz\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/sc5a39qc02z8/arroz.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Feijão\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/rzmd45qyeimj/feijão.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Salada\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/al40yhvmf1qg/salada.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Carne\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/abuc520kx3pk/carne.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Frango\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/y3ludhk0yiyx/frango.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Peixe\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/shpf7d6z1h3u/peixe_cozido.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Ovo\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/xf7sahzjnq9x/ovo.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Macarrão \",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/9qwpmn31ytiz/massa.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Pizza\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/iw6akpg0p3o6/pizza.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Pão\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/y5etcptprb5r/pão.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Água\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/un0jug1jexbo/água.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Suco\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/p7huk1qr0a29/suco.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Refrigerante\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/trqqam3s8l2o/Coca-Cola.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Achocolatado\",\"cor\":\"#fff\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/ir81cphboq05/leite_achocolatado.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}'))
  ];
  List<BotaoPictogramasStruct> get listaBoardComida => _listaBoardComida;
  set listaBoardComida(List<BotaoPictogramasStruct> value) {
    _listaBoardComida = value;
  }

  void addToListaBoardComida(BotaoPictogramasStruct value) {
    listaBoardComida.add(value);
  }

  void removeFromListaBoardComida(BotaoPictogramasStruct value) {
    listaBoardComida.remove(value);
  }

  void removeAtIndexFromListaBoardComida(int index) {
    listaBoardComida.removeAt(index);
  }

  void updateListaBoardComidaAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    listaBoardComida[index] = updateFn(_listaBoardComida[index]);
  }

  void insertAtIndexInListaBoardComida(
      int index, BotaoPictogramasStruct value) {
    listaBoardComida.insert(index, value);
  }

  List<BotaoPictogramasStruct> _listaBoardEscola = [
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Lápis\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/poz3tbybnnkv/lápis.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Borracha\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/fjta20t5yl0i/borracha.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Apontador\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/l1v2dvovnqal/apontador.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Cola\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/coevq1sttxjz/cola.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"tesoura\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/cjs0jk49shwt/tesoura.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Caderno\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/pbkpmmvnsc7g/caderno.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Mochila\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/mc5xhmxfehd2/mochila.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Professor\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/ruobssttoadf/professor.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Colega\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/0q4cuxvxtktu/colega.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Diretor\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/0n7ruc0bi99s/diretor_de_escola.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Banheiro\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/kreoxnpwamiv/banheiro2.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Água\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/un0jug1jexbo/água.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Sala Aula\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/0nt9twvh35hi/sala_de_aula.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Lousa\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/pjbu3ln2d28g/lousa.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Entendi\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/q9r1n46n5a96/compreensão.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Não entendi\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/74u7aa1d9l1p/não_entendo.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Horas?\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/versao-1-app-caa-0zroxs/assets/v5cy97dagu0a/que_horas_são.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}')),
    BotaoPictogramasStruct.fromSerializableMap(jsonDecode(
        '{\"texto\":\"Recreio\",\"cor\":\"#fec683\",\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/papuguinho-aplicativode-c-a-a-sn7k8p/assets/3bgsck0qxeyw/recreio.png\",\"Ativo\":\"true\",\"Index\":\"0\",\"dono_uid\":\"Hello World\",\"idPictograma\":\"Hello World\"}'))
  ];
  List<BotaoPictogramasStruct> get listaBoardEscola => _listaBoardEscola;
  set listaBoardEscola(List<BotaoPictogramasStruct> value) {
    _listaBoardEscola = value;
  }

  void addToListaBoardEscola(BotaoPictogramasStruct value) {
    listaBoardEscola.add(value);
  }

  void removeFromListaBoardEscola(BotaoPictogramasStruct value) {
    listaBoardEscola.remove(value);
  }

  void removeAtIndexFromListaBoardEscola(int index) {
    listaBoardEscola.removeAt(index);
  }

  void updateListaBoardEscolaAtIndex(
    int index,
    BotaoPictogramasStruct Function(BotaoPictogramasStruct) updateFn,
  ) {
    listaBoardEscola[index] = updateFn(_listaBoardEscola[index]);
  }

  void insertAtIndexInListaBoardEscola(
      int index, BotaoPictogramasStruct value) {
    listaBoardEscola.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
