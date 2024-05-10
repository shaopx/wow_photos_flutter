import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'package:shared_preferences/shared_preferences.dart';

part 'blur_hash_controller.g.dart';

@riverpod
class BlurHashController extends _$BlurHashController {
  static const sharedPreferenceTag = 'blur_hashs';
  static const defaultBlurhashs = [
    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
    'LaLETW~q_2RP_2ofo}RkIoayMxjY',
    'LpNw4l4mT0floHozM{M{RjayM{af',
    'LOO3zt^%?u0L%E-;xtDi4.IBD%-=',
    'LJLD+3=y9HNE0LE2-;M{4nI:xtM}',
    'LTPZP-x^I@-;jER-ogt6?wRPj?oM',
    'LPOW4%^*D%D%0J?bt7IVRi4nsAtl',
    r'L9CF^w9F~p4U?E4-xtV]$%-;MwtR',
    'LJLD+3=y9HNE0LE2-;M{4nI:xtM}',
    'LlFGU_#MIV9hocRksmkCe+XUslaf',
    'LQH2~64nD~x[_DIWM{RP_3M_M|sE',
    'LkKJ.1j]M{WqDNoINdoJxvW=flof',
    'LVJ802odH?-pDN%Mt8Ipe.t6tlIo',
    'LIEx|tL#?c9E#Q-pMxtRIAs:M{xu',
    r'LrIhpwI9t9ay~URjobay$^ogM{WA',
    'LOBW[ADN.T-pf*xbW-%NogWUkDRj',
    'LTK0{O-:9vR*0MV@M{W;M{M{xat6',
    'LOJ7:dIB00-;-%WC%MbF%fo2sVRQ',
    'LUQ,H^aextRjt5ayRjxu~qoft8R*',
    'LULqkWIT.TIU?ca#RixutSt8M{V?',
    r'LHO2mUF$-NIUL3Ou$xD*~okrxCs.',
    'LFD+9_-9D%%1?HM{s:X91h9}s:bw',
    'LNJRUAa1_MWF~qRi%gn,_2IAIqWA',
    'LDIzI%~C=rcEFx?ab_.7LzFzKixZ',
    'LwJHjxo}RjRi0Ks:WBV@%Mofaejs',
    'LTOMKOO]%g0NwG%hf,xZa0IU9a-n',
    r'LEA,8$E10fo#E4oJ$|kDkDaxRjxa',
  ];

  @override
  List<String> build() {
    ref.keepAlive();
    _initAsync();
    return defaultBlurhashs;
  }

  Future<void> _initAsync() async {
    // final prefs = await SharedPreferences.getInstance();
    // final blurHashs =
    //     prefs.getStringList(sharedPreferenceTag) ?? defaultBlurhashs;
    const blurHashs = defaultBlurhashs;
    state = blurHashs;
  }

  Future<void> addBlurHash(String blurhash) async {
    // final prefs = await SharedPreferences.getInstance();
    // final blurHashs = prefs.getStringList(sharedPreferenceTag) ?? [];
    final blurHashs = state;
    if (!blurHashs.contains(blurhash)) blurHashs.add(blurhash);
    state = blurHashs;
  }
}
