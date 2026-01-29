import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Form
  {
    'smm4eibl': {
      'pt': 'Criando o seu Perfil !',
      'en': '',
    },
    'e7w66ize': {
      'pt':
          'Por favor,  prrencha com os dados de quem vai utilizar o aplicativo',
      'en': '',
    },
    'jfjrfisg': {
      'pt': 'Nome completo*',
      'en': '',
    },
    'd1r2kh0g': {
      'pt': 'Data de nascimento*',
      'en': '',
    },
    'b3dkbx6y': {
      'pt': 'NÍVEL ESCOLAR',
      'en': '',
    },
    '0lraaxue': {
      'pt': 'Gênero',
      'en': '',
    },
    '1v84ixb2': {
      'pt': 'Feminino',
      'en': '',
    },
    '7lo12fb5': {
      'pt': 'Masculino',
      'en': '',
    },
    'ehr3nd6c': {
      'pt': 'Outro',
      'en': '',
    },
    'f2tevwz9': {
      'pt': 'Motivo de usar o aplicativo, detalhar nível de suporte',
      'en': '',
    },
    'vp5ge70n': {
      'pt': 'Salvar',
      'en': '',
    },
    '2g286gk6': {
      'pt': 'É necessário nome',
      'en': '',
    },
    '3o6ih432': {
      'pt': 'Nome inválido',
      'en': '',
    },
    'n7o0z7w3': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'kc8ssvhy': {
      'pt': 'É necessario data de nascimento',
      'en': '',
    },
    'o66gclj5': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '888vhhyn': {
      'pt': 'NÍVEL ESCOLAR is required',
      'en': '',
    },
    '9e3wbmeu': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '6xvq1vfg': {
      'pt':
          'Motivo de usar o aplicativo, detalhar nível de suporte is required',
      'en': '',
    },
    'm6xndunb': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'zgfg5riq': {
      'pt': 'Home',
      'en': '',
    },
  },
  // loginRegister
  {
    'bvx7dn0x': {
      'pt': 'Criar conta',
      'en': '',
    },
    'pcxiiy26': {
      'pt': 'CADASTRO',
      'en': '',
    },
    'dhq06fw3': {
      'pt': 'Para começar preencha os campos abaixo',
      'en': '',
    },
    'iu5s41qi': {
      'pt': 'Email',
      'en': '',
    },
    'zarfs2rw': {
      'pt': 'CRIAR SENHA',
      'en': '',
    },
    'me4c3cqi': {
      'pt': 'CONFIRMAR SENHA',
      'en': '',
    },
    '3ft4g2ap': {
      'pt': 'Criar',
      'en': '',
    },
    'wkg7uy2f': {
      'pt': 'Log In',
      'en': '',
    },
    'im5hjh7w': {
      'pt': 'LOGIN',
      'en': '',
    },
    'qmi3xov6': {
      'pt': 'Preencha as informações para acessar a sua conta',
      'en': '',
    },
    '6evpbimc': {
      'pt': 'Email',
      'en': '',
    },
    'ynzlteux': {
      'pt': 'Senha',
      'en': '',
    },
    'b2scpks9': {
      'pt': 'Entrar',
      'en': '',
    },
    'm56x2493': {
      'pt': 'Ou entre com',
      'en': '',
    },
    'lzprc7su': {
      'pt': 'Continuar com Google',
      'en': '',
    },
    'q8h5ww0a': {
      'pt': 'Esqueceu a senha ?',
      'en': '',
    },
    '3vfdg37r': {
      'pt': 'início',
      'en': '',
    },
  },
  // history
  {
    'vp5a1oo9': {
      'pt': 'Histórico de mensagens',
      'en': '',
    },
    '3op80gx2': {
      'pt': 'Pesquise por palavras-chave...',
      'en': '',
    },
    'y83716al': {
      'pt': 'Filtro:',
      'en': '',
    },
    '1zh1ftxw': {
      'pt': 'Home',
      'en': '',
    },
  },
  // T_DISCIPLINAS
  {
    'a0lba9sg': {
      'pt': 'QUÍMICA',
      'en': '',
    },
    'ppms2sgo': {
      'pt': 'MATEMÁTICA',
      'en': '',
    },
    '74nwsioa': {
      'pt': 'FÍSICA',
      'en': '',
    },
    'gp444m5t': {
      'pt': 'BIOLOGIA',
      'en': '',
    },
    'j50f0da3': {
      'pt': 'DISCIPLINAS',
      'en': '',
    },
    'as6xaqee': {
      'pt': 'Home',
      'en': '',
    },
  },
  // aminas
  {
    'udoborcq': {
      'pt': 'Aminas',
      'en': '',
    },
    'cuvol83s': {
      'pt': 'NOME DA MOLÉCULA',
      'en': '',
    },
    'olxe499d': {
      'pt': 'SEROTONINA',
      'en': '',
    },
    'imf3uth5': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'omv1yhbs': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'ozqfo5bp': {
      'pt': 'HUMOR',
      'en': '',
    },
    'ywfesi1x': {
      'pt': 'COMO PRODUZIR',
      'en': '',
    },
    '71ld5uol': {
      'pt': 'FAZER EXERCÍCIO FÍSICO',
      'en': '',
    },
    'lfm7l127': {
      'pt': 'NOME DA MOLÉCULA',
      'en': '',
    },
    '6klc86gg': {
      'pt': 'DOPAMINA',
      'en': '',
    },
    'oygn6od1': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'uysxf1vr': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'eitq3cp3': {
      'pt': 'MOTIVAÇÃO',
      'en': '',
    },
    '0m2s7okc': {
      'pt': 'COMO PRODUZIR',
      'en': '',
    },
    'k0fm5c51': {
      'pt': 'ALIMENTAÇÃO SAUDÁVEL',
      'en': '',
    },
    '4h1cne1d': {
      'pt': 'NOME DA MOLÉCULA',
      'en': '',
    },
    'aa5g3akw': {
      'pt': 'ENDORFINA',
      'en': '',
    },
    'u3l2zcgt': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'p42g5vwg': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'jrruytsw': {
      'pt': 'ALÍVIO DA DOR',
      'en': '',
    },
    '061mhhya': {
      'pt': 'COMO PRODUZIR',
      'en': '',
    },
    '7c3fl7xb': {
      'pt': 'BRINCAR',
      'en': '',
    },
    'q75e6n2l': {
      'pt': 'NOME DA MOLÉCULA',
      'en': '',
    },
    'nobwo816': {
      'pt': 'OCITOCINA',
      'en': '',
    },
    '0q9gmv8c': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    '377hfcak': {
      'pt': '...',
      'en': '',
    },
    'dooia5yc': {
      'pt': '...',
      'en': '',
    },
    'xzk7ate5': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'y4plj1mq': {
      'pt': 'AMOR E PRAZER',
      'en': '',
    },
    'zg9f00s1': {
      'pt': 'COMO PRODUZIR',
      'en': '',
    },
    'i17zn5t2': {
      'pt': 'CARINHO',
      'en': '',
    },
    '7xui0uz9': {
      'pt': 'NOME DA MOLÉCULA',
      'en': '',
    },
    'otjhejnn': {
      'pt': 'OCITOCINA',
      'en': '',
    },
    'c20i2k67': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'xokpzxxo': {
      'pt': '...',
      'en': '',
    },
    'qt7z5lyp': {
      'pt': '...',
      'en': '',
    },
    's76cmfhn': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    '2tw4biau': {
      'pt': 'AMOR E PRAZER',
      'en': '',
    },
    'sk74ges5': {
      'pt': 'COMO PRODUZIR',
      'en': '',
    },
    'h7y9pdd3': {
      'pt': 'CARINHO',
      'en': '',
    },
    '44sk70sa': {
      'pt': 'NOME DA MOLÉCULA',
      'en': '',
    },
    '6r2ygdil': {
      'pt': 'ENDORFINA',
      'en': '',
    },
    'ka382oa1': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    '09byefc0': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'dzlwxd0c': {
      'pt': 'ALÍVIO DA DOR',
      'en': '',
    },
    'i1y2arod': {
      'pt': 'COMO PRODUZIR',
      'en': '',
    },
    'qq3qd2d3': {
      'pt': 'BRINCAR',
      'en': '',
    },
    'vsdv6rog': {
      'pt': 'NOME DA MOLÉCULA',
      'en': '',
    },
    'a0cso834': {
      'pt': 'DOPAMINA',
      'en': '',
    },
    'hc4lna6n': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'a4zfcknp': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'dunvq2lq': {
      'pt': 'MOTIVAÇÃO',
      'en': '',
    },
    'd9i8ef2x': {
      'pt': 'COMO PRODUZIR',
      'en': '',
    },
    'rk33szt0': {
      'pt': 'ALIMENTAÇÃO SAUDÁVEL',
      'en': '',
    },
    'pwcj1p0e': {
      'pt': 'NOME DA MOLÉCULA',
      'en': '',
    },
    'mu7053p8': {
      'pt': 'SEROTONINA',
      'en': '',
    },
    'bmlajjyi': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'lv7h5p6g': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'abptj3l6': {
      'pt': 'HUMOR',
      'en': '',
    },
    'qifvdy3o': {
      'pt': 'COMO PRODUZIR',
      'en': '',
    },
    'nsroedpa': {
      'pt': 'FAZER EXERCÍCIO FÍSICO',
      'en': '',
    },
    'sl1siavi': {
      'pt': 'Home',
      'en': '',
    },
  },
  // boardGeral
  {
    'zktnja0n': {
      'pt': 'PRANCHA GERAL',
      'en': '',
    },
  },
  // Pastas
  {
    'z33mctqu': {
      'pt': 'PRANCHAS TEMÁTICAS',
      'en': '',
    },
    'ns8cslmt': {
      'pt': 'Temas CAA',
      'en': '',
    },
  },
  // Profile
  {
    '8e78rvoz': {
      'pt': 'Perfil',
      'en': '',
    },
    'uytbxnfb': {
      'pt': 'Mudar para tema escuro',
      'en': '',
    },
    'my6qdupw': {
      'pt': 'Mudar para o tema claro',
      'en': '',
    },
    'txgbttve': {
      'pt': 'Configurações da Conta',
      'en': '',
    },
    '52tauooo': {
      'pt': 'Ativar modo infantil',
      'en': '',
    },
    'pinj9plp': {
      'pt': 'Personalizar pictogramas',
      'en': '',
    },
    '553yvj05': {
      'pt': 'Mudar senha',
      'en': '',
    },
    'shbmx8c8': {
      'pt': 'Editar perfil',
      'en': '',
    },
    'ftqh8np4': {
      'pt': 'Histórico',
      'en': '',
    },
    'gya4d67j': {
      'pt': 'Fale conosco',
      'en': '',
    },
    'c74mq9f4': {
      'pt': 'Vincular Google',
      'en': '',
    },
    'gwgn17yk': {
      'pt': 'Voltar',
      'en': '',
    },
    '7ise4ubl': {
      'pt': 'Sair',
      'en': '',
    },
    'dltnk420': {
      'pt': 'CONTA',
      'en': '',
    },
  },
  // T_BANHEIRO
  {
    'i5av6tjn': {
      'pt': 'COMO IR AO BANHEIRO ?',
      'en': '',
    },
    'ey0s0wfr': {
      'pt': 'MENINOS',
      'en': '',
    },
    '2s4ojzvj': {
      'pt': 'MENINAS',
      'en': '',
    },
    'jbpt1opv': {
      'pt': 'Home',
      'en': '',
    },
  },
  // TopicBoy
  {
    's9t4etm9': {
      'pt': ' IR AO BANHEIRO ',
      'en': '',
    },
    'tuv7zgxh': {
      'pt': 'PARA FAZER XIXI ',
      'en': '',
    },
    'gd9nsfrl': {
      'pt': 'PARA FAZER COCÔ ',
      'en': '',
    },
    'b1r479o1': {
      'pt': 'Home',
      'en': '',
    },
  },
  // BoyN1
  {
    '2hyv3jwf': {
      'pt': 'PASSO 1',
      'en': '',
    },
    'u1loirjb': {
      'pt': 'SUBIR A TAMPA \nDA PRIVADA',
      'en': '',
    },
    'ras1depd': {
      'pt': 'PASSO 2',
      'en': '',
    },
    'c0bl1208': {
      'pt': 'ABAIXAR A \nROUPA',
      'en': '',
    },
    '9eyhbn4m': {
      'pt': 'PASSO 3',
      'en': '',
    },
    '6yo0xo24': {
      'pt': 'FAZER XIXI',
      'en': '',
    },
    'c2cbavd9': {
      'pt': 'PASSO 4',
      'en': '',
    },
    'zythhgfh': {
      'pt': 'SUBIR A ROUPA',
      'en': '',
    },
    'lhuzk0ow': {
      'pt': 'PASSO 5',
      'en': '',
    },
    'km2n9ge8': {
      'pt': 'ABAIXAR A TAMPA DA PRIVADA',
      'en': '',
    },
    '4spknsoo': {
      'pt': 'PASSO 6',
      'en': '',
    },
    'o0x3ak4e': {
      'pt': 'DAR DESCARGA',
      'en': '',
    },
    'dxy4vsfz': {
      'pt': 'DAR DESCARGA',
      'en': '',
    },
    'k7v8nl7b': {
      'pt': 'PASSO 7',
      'en': '',
    },
    'f90obmq8': {
      'pt': 'LAVAR AS MÃOS',
      'en': '',
    },
    '8n9d0s3n': {
      'pt': 'PASSO 8',
      'en': '',
    },
    '5p2as2qf': {
      'pt': 'SECAR AS MÃOS',
      'en': '',
    },
    'zv4uzyuc': {
      'pt': 'PARA FAZER XIXI',
      'en': '',
    },
    'a5xxd0b8': {
      'pt': 'TEMAS CAA',
      'en': '',
    },
  },
  // BoyN2
  {
    '08uag531': {
      'pt': 'PASSO 1',
      'en': '',
    },
    'nghwnfsz': {
      'pt': 'SUBIR A TAMPA \nDA PRIVADA',
      'en': '',
    },
    'qp10fw47': {
      'pt': 'PASSO 2',
      'en': '',
    },
    'ev81rmdq': {
      'pt': 'ABAIXAR A \nROUPA',
      'en': '',
    },
    'ujczmq48': {
      'pt': 'PASSO 3',
      'en': '',
    },
    '73ixvhgn': {
      'pt': 'FAZER COCÔ',
      'en': '',
    },
    'nl5ukwoj': {
      'pt': 'PASSO 4',
      'en': '',
    },
    's65f8x85': {
      'pt': 'SUBIR A ROUPA',
      'en': '',
    },
    '3uz4vvbj': {
      'pt': 'PASSO 5',
      'en': '',
    },
    '537h6x9t': {
      'pt': 'ABAIXAR A TAMPA DA PRIVADA',
      'en': '',
    },
    '69mf886p': {
      'pt': 'PASSO 6',
      'en': '',
    },
    'ey3dut8y': {
      'pt': 'DAR DESCARGA',
      'en': '',
    },
    'f8wyeoma': {
      'pt': 'PASSO 7',
      'en': '',
    },
    'cugts2pe': {
      'pt': 'LAVAR AS MÃOS',
      'en': '',
    },
    'f0uyj5sg': {
      'pt': 'PASSO 8',
      'en': '',
    },
    'jutwrcln': {
      'pt': 'SECAR AS MÃOS',
      'en': '',
    },
    'jlcz2imz': {
      'pt': 'PARA FAZER COCÔ',
      'en': '',
    },
    '7epd4yh1': {
      'pt': 'TEMAS CAA',
      'en': '',
    },
  },
  // GirlN1
  {
    'sr0v2wl6': {
      'pt': 'PASSO 1',
      'en': '',
    },
    'dr26gn3w': {
      'pt': 'SUBIR A TAMPA \nDA PRIVADA',
      'en': '',
    },
    '19uatkai': {
      'pt': 'PASSO 2',
      'en': '',
    },
    'zhbo8ly8': {
      'pt': 'ABAIXAR A \nROUPA',
      'en': '',
    },
    'ffc36e16': {
      'pt': 'PASSO 3',
      'en': '',
    },
    'rkmnpj1o': {
      'pt': 'FAZER XIXI',
      'en': '',
    },
    'nxc74ngq': {
      'pt': 'PASSO 4',
      'en': '',
    },
    '30d3y849': {
      'pt': 'SUBIR A ROUPA',
      'en': '',
    },
    'dzwwrkyb': {
      'pt': 'PASSO 5',
      'en': '',
    },
    'wiivs3ca': {
      'pt': 'ABAIXAR A TAMPA DA PRIVADA',
      'en': '',
    },
    'v1ufptmw': {
      'pt': 'PASSO 6',
      'en': '',
    },
    '34rhm0qx': {
      'pt': 'DAR DESCARGA',
      'en': '',
    },
    'mnhn9i17': {
      'pt': 'PASSO 7',
      'en': '',
    },
    'rvcui5go': {
      'pt': 'LAVAR AS MÃOS',
      'en': '',
    },
    '4u0j8rs4': {
      'pt': 'PASSO 8',
      'en': '',
    },
    'f6ynu072': {
      'pt': 'SECAR AS MÃOS',
      'en': '',
    },
    '886vzkyb': {
      'pt': 'PARA FAZER XIXI',
      'en': '',
    },
    'hl7vamn5': {
      'pt': 'TEMAS CAA',
      'en': '',
    },
  },
  // GirlN2
  {
    'becq4ord': {
      'pt': 'PASSO 1',
      'en': '',
    },
    'gfn6xcjc': {
      'pt': 'SUBIR A TAMPA \nDA PRIVADA',
      'en': '',
    },
    '6dxgt85m': {
      'pt': 'PASSO 2',
      'en': '',
    },
    'aeu1iq3q': {
      'pt': 'ABAIXAR \nA ROUPA',
      'en': '',
    },
    'gv9x10d8': {
      'pt': 'PASSO 3',
      'en': '',
    },
    '0sojasgn': {
      'pt': 'FAZER COCÔ',
      'en': '',
    },
    '5a7tkogk': {
      'pt': 'PASSO 4',
      'en': '',
    },
    'e7z28iic': {
      'pt': 'SUBIR A ROUPA',
      'en': '',
    },
    '76h60dds': {
      'pt': 'PASSO 5',
      'en': '',
    },
    '30wypytb': {
      'pt': 'ABAIXAR A TAMPA DA PRIVADA',
      'en': '',
    },
    '7mcvzz1z': {
      'pt': 'PASSO 6',
      'en': '',
    },
    'mcki7kur': {
      'pt': 'DAR DESCARGA',
      'en': '',
    },
    'pt8nafy3': {
      'pt': 'PASSO 7',
      'en': '',
    },
    'yszna14g': {
      'pt': 'LAVAR AS MÃOS',
      'en': '',
    },
    '010vkghy': {
      'pt': 'PASSO 8',
      'en': '',
    },
    '0mpyn5vf': {
      'pt': 'SECAR AS MÃOS',
      'en': '',
    },
    '4pgc26dk': {
      'pt': 'PARA FAZER COCÔ',
      'en': '',
    },
    'abexpv6y': {
      'pt': 'TEMAS CAA',
      'en': '',
    },
  },
  // topicGirl
  {
    '79au275n': {
      'pt': ' IR AO BANHEIRO ',
      'en': '',
    },
    'dq7akjlb': {
      'pt': 'PARA FAZER XIXI ',
      'en': '',
    },
    'p2kktu6u': {
      'pt': 'PARA FAZER COCÔ ',
      'en': '',
    },
    'g23b3r33': {
      'pt': 'Home',
      'en': '',
    },
  },
  // T_QUIMICA
  {
    '2cse2fy1': {
      'pt': 'QUÍMICA \nGERAL',
      'en': '',
    },
    'cgppuk2c': {
      'pt': 'FÍSICO \nQUÍMICA',
      'en': '',
    },
    '5g9r793q': {
      'pt': 'QUÍMICA \nORGÂNICA',
      'en': '',
    },
    'vpqtui2d': {
      'pt': 'QUÍMICA NA \nPRÁTICA',
      'en': '',
    },
    '7cmsrtx9': {
      'pt': 'TÓPICOS DE QUÍMICA',
      'en': '',
    },
    '51xm0f57': {
      'pt': 'Home',
      'en': '',
    },
  },
  // QUIMICA_ORGANICA
  {
    '4hnmzh02': {
      'pt': 'HIDROCARBONETOS',
      'en': '',
    },
    '4f02df3a': {
      'pt': 'FUNÇÕES OXIGENADAS',
      'en': '',
    },
    'c18dfk74': {
      'pt': 'FUNÇÕES NITROGENADAS',
      'en': '',
    },
    'kh4nbw70': {
      'pt': 'FUNÇÕES SULFURADAS',
      'en': '',
    },
    '46h3yifk': {
      'pt': 'QUÍMICA ORGÂNICA',
      'en': '',
    },
    'mdy20q23': {
      'pt': 'Home',
      'en': '',
    },
  },
  // To_nitrogenadas
  {
    'dcsssse7': {
      'pt': 'AMINAS',
      'en': '',
    },
    'yh3lism4': {
      'pt': 'AMIDAS',
      'en': '',
    },
    'xhp8fjm2': {
      'pt': 'NITRILAS',
      'en': '',
    },
    '2vnkuq08': {
      'pt': 'NITROCOMPOSTOS',
      'en': '',
    },
    '0yk1jh2g': {
      'pt': 'NITROGENADAS',
      'en': '',
    },
    'pvirz3t2': {
      'pt': 'Home',
      'en': '',
    },
  },
  // QUIMICA_PRATICA
  {
    'c0i2i6tr': {
      'pt': 'MEDICAMENTOS',
      'en': '',
    },
    'xvrnfqyz': {
      'pt': 'CAMINHO DO \nPETRÓLEO',
      'en': '',
    },
    '1l7jqurw': {
      'pt': 'TRATAMENTO DE \nÁGUA',
      'en': '',
    },
    'vbzf8ygm': {
      'pt': 'QUÍMICA NA \nCOZINHA',
      'en': '',
    },
    'nz0hfi51': {
      'pt': 'QUÍMICA NA PRÁTICA',
      'en': '',
    },
    '9nhpfoud': {
      'pt': 'Home',
      'en': '',
    },
  },
  // MEDICAMENTOS
  {
    'jz4raffu': {
      'pt': 'MEDICAMENTOS',
      'en': '',
    },
    '0xlosp4k': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'ojo1z520': {
      'pt': 'IBUPROFENO',
      'en': '',
    },
    'ahs3duue': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'wr5k7d9u': {
      'pt': 'MELHORA INFLAMAÇÕES',
      'en': '',
    },
    '73gzfx53': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    'bzd0ld8u': {
      'pt': 'ÁCIDO CARBOXÍLICO',
      'en': '',
    },
    'j3t2bog5': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'csc0jijp': {
      'pt': 'DIPIRONA',
      'en': '',
    },
    '63bee0ts': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'srhs8h6k': {
      'pt': 'ALÍVIO DE DORES',
      'en': '',
    },
    '8atevy7g': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    'xudwmmgv': {
      'pt': 'FUNÇÃO AMIDA',
      'en': '',
    },
    'nkb5vo9o': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'zzmjdb2e': {
      'pt': 'LORATADINA',
      'en': '',
    },
    'wojgtval': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'uxc896o8': {
      'pt': 'ALÍVIO DE ALERGIAS',
      'en': '',
    },
    'kwt3xc7o': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    'mkjti58h': {
      'pt': 'FUNÇÃO ÉSTER',
      'en': '',
    },
    '65ap883n': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    '20mgzkg2': {
      'pt': 'PARACETAMOL',
      'en': '',
    },
    'xw5zebe6': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'rtv50vtc': {
      'pt': 'ALÍVIO DE FEBRE',
      'en': '',
    },
    'djfygjcp': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    'pev7r305': {
      'pt': 'FUNÇÃO FENOL',
      'en': '',
    },
    '6n4f8qwz': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'p75v7dnd': {
      'pt': 'AMOXICILINA',
      'en': '',
    },
    'mlbrgb41': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'q46nor61': {
      'pt': 'ALÍVIO DE INFECÇÕES BACTERIANAS',
      'en': '',
    },
    'h6kwxuvn': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    'me6jbwul': {
      'pt': 'FUNÇÃO AMINA',
      'en': '',
    },
    '60i18z6v': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    '47744p9g': {
      'pt': 'DRAMIN',
      'en': '',
    },
    'pfto56ti': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    '4y49ftjy': {
      'pt': 'ALÍVIO DE ENJÔO',
      'en': '',
    },
    'lba4sbgn': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    '1aueh2ej': {
      'pt': 'FUNÇÃO ÉTER',
      'en': '',
    },
    '62hgu4ki': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'env9dkkx': {
      'pt': 'IBUPROFENO',
      'en': '',
    },
    'trev0l62': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'md0l3ws5': {
      'pt': 'MELHORA INFLAMAÇÕES',
      'en': '',
    },
    'htxn7661': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    '7aijtui4': {
      'pt': 'ÁCIDO CARBOXÍLICO',
      'en': '',
    },
    'al606wmw': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'zpw0sjle': {
      'pt': 'DIPIRONA',
      'en': '',
    },
    'njtegvhr': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'g5oy4gkw': {
      'pt': 'ALÍVIO DE DORES',
      'en': '',
    },
    '8ifnoyxq': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    'xhhpfn7r': {
      'pt': 'FUNÇÃO AMIDA',
      'en': '',
    },
    '01z9k1r4': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'ecmixcea': {
      'pt': 'LORATADINA',
      'en': '',
    },
    '7a24u7r0': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    '5sb3kmxf': {
      'pt': 'ALÍVIO DE ALERGIAS',
      'en': '',
    },
    'eyhqrin6': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    '8may1xcj': {
      'pt': 'FUNÇÃO ÉSTER',
      'en': '',
    },
    'bhffpm6y': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'jcrrblnd': {
      'pt': 'PARACETAMOL',
      'en': '',
    },
    '7nkvs418': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'e9ew32ic': {
      'pt': 'ALÍVIO DE FEBRE',
      'en': '',
    },
    'fiwmo3qv': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    'vj7l4olq': {
      'pt': 'FUNÇÃO FENOL',
      'en': '',
    },
    '3k3p0efp': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    '0eh9k3sb': {
      'pt': 'AMOXICILINA',
      'en': '',
    },
    'xl1codbu': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'g7frtvfc': {
      'pt': 'ALÍVIO DE INFECÇÕES ',
      'en': '',
    },
    'g9ycim6d': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    '2h6o26y4': {
      'pt': 'FUNÇÃO AMINA',
      'en': '',
    },
    'jn9ft5ke': {
      'pt': 'FÓRMULA ESTRUTURAL',
      'en': '',
    },
    'ugbz5me1': {
      'pt': 'DRAMIN',
      'en': '',
    },
    '0xk4ss3y': {
      'pt': 'PARA QUE SERVE',
      'en': '',
    },
    'oilzkba1': {
      'pt': 'ALÍVIO DE ENJÔO',
      'en': '',
    },
    'x4zt0ebm': {
      'pt': 'FUNÇÃO ESPECÍFICA',
      'en': '',
    },
    '975oh1ic': {
      'pt': 'BENZENO',
      'en': '',
    },
    '7mmh93tv': {
      'pt': 'Home',
      'en': '',
    },
  },
  // boardPronome
  {
    'sgl4hm1d': {
      'pt': 'Home',
      'en': '',
    },
  },
  // boardAcao
  {
    '1yhi9dyu': {
      'pt': 'Home',
      'en': '',
    },
  },
  // boardEmocao
  {
    'mc82mr91': {
      'pt': 'Home',
      'en': '',
    },
  },
  // boardTempo
  {
    'lnfxax37': {
      'pt': 'Home',
      'en': '',
    },
  },
  // boardCoisa
  {
    '186zlyh2': {
      'pt': 'Home',
      'en': '',
    },
  },
  // boardPergunta
  {
    '0gr0kapx': {
      'pt': 'Home',
      'en': '',
    },
  },
  // boardHospital
  {
    'kwplu6yu': {
      'pt': 'Home',
      'en': '',
    },
  },
  // boardComida
  {
    '1nxuye2v': {
      'pt': 'PRANCHA GERAL',
      'en': '',
    },
  },
  // boardEscola
  {
    '646akfyp': {
      'pt': 'Home',
      'en': '',
    },
  },
  // editProfile
  {
    'iwqbfzpb': {
      'pt': 'Editar seu perfil !',
      'en': '',
    },
    'r6v660ng': {
      'pt': 'Por favor, nos ajude com essas questões',
      'en': '',
    },
    'dwhb41fk': {
      'pt': 'Nome completo',
      'en': '',
    },
    'ltu0kayy': {
      'pt': 'Data de nascimento',
      'en': '',
    },
    '7zjkuy5c': {
      'pt': 'NÍVEL ESCOLAR',
      'en': '',
    },
    'ccpvipy4': {
      'pt': 'Motivo de usar o aplicativo',
      'en': '',
    },
    '5zd74r0b': {
      'pt': 'Gênero',
      'en': '',
    },
    'm2yfpx19': {
      'pt': 'Feminino',
      'en': '',
    },
    'y8qszlj9': {
      'pt': 'Masculino',
      'en': '',
    },
    'j91k6hwm': {
      'pt': 'Outro',
      'en': '',
    },
    'w9pv4rlp': {
      'pt': 'Salvar',
      'en': '',
    },
    'fwubp7jb': {
      'pt': 'Por favor, insira seu nome completo',
      'en': '',
    },
    '3dqt7lh1': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    '9vn2bbcb': {
      'pt': 'Por favor, insira sua idade ',
      'en': '',
    },
    'ty5ehubo': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'a96wk5t1': {
      'pt': 'Por favor, coloque sua data de nascimento',
      'en': '',
    },
    'nnymjfj7': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
    'x9f9x4nb': {
      'pt': 'Field is required',
      'en': '',
    },
    'ne8iisk4': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // changePassword
  {
    'nt9xx8dl': {
      'pt': 'Trocar a senha',
      'en': '',
    },
    'sfzqo4ot': {
      'pt': 'Para trocar sua senha, informe seu e-mail',
      'en': '',
    },
    'aogmtrzd': {
      'pt': 'Email',
      'en': '',
    },
    'izhuobz7': {
      'pt': 'ENVIAR',
      'en': '',
    },
  },
  // authHistory
  {
    '7tpzat2s': {
      'pt': 'Entrar no histórico',
      'en': '',
    },
    'm7pgtmou': {
      'pt': 'Para acessar o histórico, informe seu e-mail e senha',
      'en': '',
    },
    'bvl23dsf': {
      'pt': 'Digite o seu Email',
      'en': '',
    },
    'mb4gt4wf': {
      'pt': 'Digite a sua senha',
      'en': '',
    },
    'k0ibejmn': {
      'pt': 'Entrar',
      'en': '',
    },
  },
  // calendario
  {
    'vql2f84c': {
      'pt': 'Selecionar',
      'en': '',
    },
  },
  // Cabecalho
  {
    '8xyv6kuo': {
      'pt': '10/10',
      'en': '',
    },
    'ifvad77v': {
      'pt': '',
      'en': '',
    },
  },
  // forgotPassword
  {
    'm26eeme9': {
      'pt': 'ESQUECI A SENHA',
      'en': '',
    },
    'nygmh7k6': {
      'pt': 'Para trocar sua senha, informe seu e-mail',
      'en': '',
    },
    'gtox6h4e': {
      'pt': 'Email',
      'en': '',
    },
    'g56fpawf': {
      'pt': 'ENVIAR',
      'en': '',
    },
    '9d5j4vk9': {
      'pt': 'VOLTAR PARA TELA DE LOGIN',
      'en': '',
    },
  },
  // ProfilePicture
  {
    'r956lw3l': {
      'pt': 'Escolha um papuguinho',
      'en': '',
    },
    'qvav2bxt': {
      'pt': 'ENVIAR',
      'en': '',
    },
  },
  // Navbar
  {
    '1hmqzypd': {
      'pt': 'Início',
      'en': '',
    },
    'yg05c34t': {
      'pt': 'Temas',
      'en': '',
    },
  },
  // talkToUs
  {
    'byuvstch': {
      'pt': 'Nos escreva um e-mail',
      'en': '',
    },
    'of5f8p03': {
      'pt':
          'Seu feedback é muito importante para o \ndesenvolvimento do Papuguinho',
      'en': '',
    },
    'u40ttz0q': {
      'pt': 'Sugestão, relato de erro...',
      'en': '',
    },
    'vivvawa1': {
      'pt': 'ENVIAR',
      'en': '',
    },
  },
  // ThankYouSend
  {
    '57gebq1l': {
      'pt': 'Obrigado pelo seu e-mail',
      'en': '',
    },
    '5rlc8789': {
      'pt': 'Seu feedback vai ajudar muito o Papuguinho ser cada vez melhor!',
      'en': '',
    },
  },
  // activeKidMode
  {
    'o7nazstd': {
      'pt': 'Ativar o Modo Infantil',
      'en': '',
    },
    'xkccqrog': {
      'pt':
          'O modo infantil fixa a tela do aplicativo, impedindo que ele seja fechado. Para desativar,  siga as instruções da imagem abaixo e clique na seção \"perfil\".',
      'en': '',
    },
    'ahrfdu8y': {
      'pt': 'Tem certeza que deseja ativar?',
      'en': '',
    },
    'mkv1p13s': {
      'pt': 'Sim',
      'en': '',
    },
    'w0whvige': {
      'pt': 'Não',
      'en': '',
    },
  },
  // disableKidMode
  {
    'mk5x3r71': {
      'pt': 'Desativar o modo infantil',
      'en': '',
    },
    'nmy1cj84': {
      'pt': 'Para desativar o modo infantil, informe seu e-mail e senha',
      'en': '',
    },
    'ju4cghxv': {
      'pt': 'Digite o seu Email',
      'en': '',
    },
    't2xeybq2': {
      'pt': 'Digite a sua senha',
      'en': '',
    },
    'dr1y9rbv': {
      'pt': 'Desativar',
      'en': '',
    },
  },
  // deleteHistory
  {
    'q5orvwda': {
      'pt': 'Excluir o histórico',
      'en': '',
    },
    'uskbb8t4': {
      'pt': 'Tem certeza que deseja excluir todo o histórico de mensagens?',
      'en': '',
    },
    'yspuu6np': {
      'pt': 'Essa ação não pode ser desfeita',
      'en': '',
    },
    'b1eavsr4': {
      'pt': 'Sim',
      'en': '',
    },
    'x69428fz': {
      'pt': 'Não',
      'en': '',
    },
  },
  // Personalizao
  {
    'mbrfju4t': {
      'pt': 'PERSONALIZE SEU APP',
      'en': '',
    },
    'gj9sz808': {
      'pt': 'Criar pictograma',
      'en': '',
    },
    '89xmfg0x': {
      'pt': 'Editar ',
      'en': '',
    },
  },
  // CriarPictograma
  {
    'gn8kx4lo': {
      'pt': 'Crie seu pictograma',
      'en': '',
    },
    'i3p0dbjv': {
      'pt': 'Nome do pictograma',
      'en': '',
    },
    'pcyx9wq5': {
      'pt': 'Criar',
      'en': '',
    },
  },
  // CriarPasta
  {
    'vvhpg7lk': {
      'pt': 'Crie sua pasta de pictogramas',
      'en': '',
    },
    '31n0cmvd': {
      'pt': 'TextField',
      'en': '',
    },
    'kfgjkqz9': {
      'pt': '   NOME PICTOGRAMA',
      'en': '',
    },
    'upv7a9qe': {
      'pt': 'Criar',
      'en': '',
    },
  },
  // successGoogle
  {
    'jvcwq9bw': {
      'pt': 'Conta Google Vinculada',
      'en': '',
    },
    'sy9brrr8': {
      'pt': 'Agora você pode realizar o login através do Google',
      'en': '',
    },
  },
  // FailGoogle
  {
    'lsd7xj78': {
      'pt': 'Algo deu Errado!',
      'en': '',
    },
    'ynpmybzu': {
      'pt': 'Tente novamente mais tarde',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'pnx0jqt8': {
      'pt': '',
      'en': '',
    },
    'deqcwnwe': {
      'pt': '',
      'en': '',
    },
    '3d04l1rt': {
      'pt': '',
      'en': '',
    },
    'nggs1jn9': {
      'pt': 'Erro de autenticação',
      'en': '',
    },
    'egvy2tfn': {
      'pt': 'Email de redefinição de senha enviado ',
      'en': '',
    },
    '6szos23p': {
      'pt': 'Email obrigatório!',
      'en': '',
    },
    '59igo656': {
      'pt': '',
      'en': '',
    },
    '17398soh': {
      'pt': 'A senha esta incorreta ',
      'en': '',
    },
    'qffkocpm': {
      'pt': '',
      'en': '',
    },
    'j3su83pk': {
      'pt': '',
      'en': '',
    },
    'xgnaudfi': {
      'pt': '',
      'en': '',
    },
    'v5afnyr7': {
      'pt': '',
      'en': '',
    },
    'wan0qgmr': {
      'pt': 'Este email já esta sendo usado por outra conta',
      'en': '',
    },
    'f8124jcq': {
      'pt': 'As credênciais estão incorretas',
      'en': '',
    },
    '89632erw': {
      'pt': '',
      'en': '',
    },
    '0w69w6my': {
      'pt': '',
      'en': '',
    },
    'ybby8ffr': {
      'pt': '',
      'en': '',
    },
    '0ew9a61d': {
      'pt': '',
      'en': '',
    },
    'x1y8un66': {
      'pt': '',
      'en': '',
    },
    '3rrs7w0b': {
      'pt': '',
      'en': '',
    },
    'nlvzoihp': {
      'pt': '',
      'en': '',
    },
    '8uffr0oi': {
      'pt': '',
      'en': '',
    },
    'mavil2f1': {
      'pt': '',
      'en': '',
    },
    'cbpg7etw': {
      'pt': '',
      'en': '',
    },
    'zly6u4q6': {
      'pt': '',
      'en': '',
    },
    '7lptikke': {
      'pt': '',
      'en': '',
    },
    'ex2m8hgn': {
      'pt': '',
      'en': '',
    },
    'jfuosj6f': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
