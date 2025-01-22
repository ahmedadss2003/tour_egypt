// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDo99_IIdlbmLqQh8dc9skb9ZzeZ4W2hBA',
    appId: '1:10488922716:web:fb257f195d93ab47145c99',
    messagingSenderId: '10488922716',
    projectId: 'mygp-6522c',
    authDomain: 'mygp-6522c.firebaseapp.com',
    databaseURL: 'https://mygp-6522c-default-rtdb.firebaseio.com',
    storageBucket: 'mygp-6522c.firebasestorage.app',
    measurementId: 'G-82MJZ6SZV3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9u-gFWlMFaS81kU0o7utdFfp0fO6wWSc',
    appId: '1:10488922716:android:ce03c9b43114451d145c99',
    messagingSenderId: '10488922716',
    projectId: 'mygp-6522c',
    databaseURL: 'https://mygp-6522c-default-rtdb.firebaseio.com',
    storageBucket: 'mygp-6522c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYFLyZueRWQPEESOYBezFTGEoShkfgvT0',
    appId: '1:10488922716:ios:9fedbd7769b8e31b145c99',
    messagingSenderId: '10488922716',
    projectId: 'mygp-6522c',
    databaseURL: 'https://mygp-6522c-default-rtdb.firebaseio.com',
    storageBucket: 'mygp-6522c.firebasestorage.app',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYFLyZueRWQPEESOYBezFTGEoShkfgvT0',
    appId: '1:10488922716:ios:9fedbd7769b8e31b145c99',
    messagingSenderId: '10488922716',
    projectId: 'mygp-6522c',
    databaseURL: 'https://mygp-6522c-default-rtdb.firebaseio.com',
    storageBucket: 'mygp-6522c.firebasestorage.app',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDo99_IIdlbmLqQh8dc9skb9ZzeZ4W2hBA',
    appId: '1:10488922716:web:2cb4a435f52565fa145c99',
    messagingSenderId: '10488922716',
    projectId: 'mygp-6522c',
    authDomain: 'mygp-6522c.firebaseapp.com',
    databaseURL: 'https://mygp-6522c-default-rtdb.firebaseio.com',
    storageBucket: 'mygp-6522c.firebasestorage.app',
    measurementId: 'G-LN7Z2D3EMV',
  );

}