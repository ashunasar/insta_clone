import 'base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get host => 'https://api.sample.io';
  @override
  String get environment => 'Production';
}
