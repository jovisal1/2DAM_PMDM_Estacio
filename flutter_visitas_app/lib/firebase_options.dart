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
    apiKey: 'AIzaSyANu822VhJ0K1IN-4fSWfhPDoc8aL8LW1w',
    appId: '1:257468631542:web:5e4fec190b31256ada5fd7',
    messagingSenderId: '257468631542',
    projectId: 'visitas-app-f670e',
    authDomain: 'visitas-app-f670e.firebaseapp.com',
    databaseURL: 'https://visitas-app-f670e-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'visitas-app-f670e.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADAa0uCt3Dsvn_L3dpAZpLTxGZuUbNKJ0',
    appId: '1:257468631542:android:98b5e8c03cb9998bda5fd7',
    messagingSenderId: '257468631542',
    projectId: 'visitas-app-f670e',
    databaseURL: 'https://visitas-app-f670e-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'visitas-app-f670e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZPqeIjsewGhHPtuZ1DSkReB_ObYBpS4Y',
    appId: '1:257468631542:ios:05cdf3894a2aaa24da5fd7',
    messagingSenderId: '257468631542',
    projectId: 'visitas-app-f670e',
    databaseURL: 'https://visitas-app-f670e-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'visitas-app-f670e.firebasestorage.app',
    iosBundleId: 'com.example.flutterVisitasApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZPqeIjsewGhHPtuZ1DSkReB_ObYBpS4Y',
    appId: '1:257468631542:ios:05cdf3894a2aaa24da5fd7',
    messagingSenderId: '257468631542',
    projectId: 'visitas-app-f670e',
    databaseURL: 'https://visitas-app-f670e-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'visitas-app-f670e.firebasestorage.app',
    iosBundleId: 'com.example.flutterVisitasApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyANu822VhJ0K1IN-4fSWfhPDoc8aL8LW1w',
    appId: '1:257468631542:web:863f2a7d3b0fbe03da5fd7',
    messagingSenderId: '257468631542',
    projectId: 'visitas-app-f670e',
    authDomain: 'visitas-app-f670e.firebaseapp.com',
    databaseURL: 'https://visitas-app-f670e-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'visitas-app-f670e.firebasestorage.app',
  );
}
