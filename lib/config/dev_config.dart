import 'base_config.dart';

class DevConfig implements BaseConfig {
  @override
  // String get host => 'https://dev.api.sample.io';
  String get host => 'https://reqres.in';

  @override
  String get environment => 'Development';
}
