import 'base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get host => '192.168.29.149:8000';

  @override
  String get environment => 'Development';
}
