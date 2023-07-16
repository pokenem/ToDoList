import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';
import '../presentation/home_page.dart';
import 'config_repository.dart';
import 'package:get_it/get_it.dart';

abstract class Locator {
  static final _locator = GetIt.instance;

  static ConfigRepository get configRepository => _locator<ConfigRepository>();

  static Future<void> init() async {
    try {
      await _initFirebase();
    }
    catch(e) {
      logger.d('No Internet connection to initialize firebase');
    }
      _locator.registerLazySingleton<FirebaseRemoteConfig>(
            () => FirebaseRemoteConfig.instance,
      );
      final configRepo = ConfigRepository(_locator<FirebaseRemoteConfig>());
      try {
        await configRepo.init();
      }
      catch(e){
        logger.d(e);
      }
      _locator.registerSingleton<ConfigRepository>(configRepo);
    try{
      _initCrashlytics();
    } catch (e) {
      logger.d('No Internet connection to initialize Crashlytics');
    }
  }

  static Future<void> _initFirebase() async {
    logger.d('Firebase initialization started');

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    logger.d('Firebase initialized');
  }

  static void _initCrashlytics() {
    FlutterError.onError = (errorDetails) {
      logger.d('Caught error in FlutterError.onError');
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      logger.d('Caught error in PlatformDispatcher.onError');
      FirebaseCrashlytics.instance.recordError(
        error,
        stack,
        fatal: true,
      );
      return true;
    };
    logger.d('Crashlytics initialized');
  }

  static Future<void> dispose() async {}

  static FirebaseAnalytics get analytics => FirebaseAnalytics.instance;
}
