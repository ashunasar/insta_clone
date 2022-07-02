import 'base_config.dart';
import 'dev_config.dart';
import 'prod_config.dart';

class Environment {
  factory Environment.instance() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String dev = 'DEV';
  static const String prod = 'PROD';

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdConfig();
      case Environment.dev:
        return DevConfig();
      default:
        throw UnimplementedError('Enviroment is not provided!');
    }
  }
}
