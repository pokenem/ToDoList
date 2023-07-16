import 'package:firebase_remote_config/firebase_remote_config.dart';

class ConfigRepository {
  final FirebaseRemoteConfig _remoteConfig;

  ConfigRepository(this._remoteConfig);

  bool get useImportanceColor =>
      _remoteConfig.getBool(_ConfigFields.importanceColor);

  Future<void> init() async {
    await FirebaseRemoteConfig.instance.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 2),
      ),
    );

    _remoteConfig.setDefaults({
      _ConfigFields.importanceColor: false,
    });
    await _remoteConfig.fetchAndActivate();
  }
}

abstract class _ConfigFields {
  static const importanceColor = 'importance_color';
}
