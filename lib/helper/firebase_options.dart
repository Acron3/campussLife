// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmvc9r72SW8t1OOYvY_eE5wJE36p8SX2s',
    appId: '1:38953277935:web:bb40680f33a664e8b23e1a',
    messagingSenderId: '38953277935',
    projectId: 'campuife',
    authDomain: 'campuife.firebaseapp.com',
    databaseURL: 'https://campuife-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'campuife.appspot.com',
    measurementId: 'G-4JMWZP0YLM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqF6WUtMIuJ5DJNBgJePokunOZnenVb68',
    appId: '1:38953277935:android:34f961488819f344b23e1a',
    messagingSenderId: '38953277935',
    projectId: 'campuife',
    databaseURL: 'https://campuife-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'campuife.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMOZ0SQvFGvqz-A8ndBg3t337aSvMwZI4',
    appId: '1:38953277935:ios:e0964938a52cbe26b23e1a',
    messagingSenderId: '38953277935',
    projectId: 'campuife',
    databaseURL: 'https://campuife-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'campuife.appspot.com',
    iosBundleId: 'com.example.campussLife',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMOZ0SQvFGvqz-A8ndBg3t337aSvMwZI4',
    appId: '1:38953277935:ios:624c371a949bd355b23e1a',
    messagingSenderId: '38953277935',
    projectId: 'campuife',
    databaseURL: 'https://campuife-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'campuife.appspot.com',
    iosBundleId: 'com.example.campussLife.RunnerTests',
  );
}