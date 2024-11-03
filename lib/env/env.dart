import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'AUTH-KEY', obfuscate: true)
  static final String authKey = _Env.authKey;
}
