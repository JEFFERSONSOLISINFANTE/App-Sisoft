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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB8T6bI2TkMGg_mVZLOVkJFAcgQknTKZrs',
    appId: '1:642120806959:web:f7abb32044610b79d88cda',
    messagingSenderId: '642120806959',
    projectId: 'sisoft-app',
    authDomain: 'sisoft-app.firebaseapp.com',
    storageBucket: 'sisoft-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAquuga9mHCIYvEOIkJSqkVbwLl4263B0c',
    appId: '1:642120806959:android:c4b13406261183c5d88cda',
    messagingSenderId: '642120806959',
    projectId: 'sisoft-app',
    storageBucket: 'sisoft-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfmYAEqVPZTt_bBXRwVxFNcFicfqZ250M',
    appId: '1:642120806959:ios:538cf723a09c2355d88cda',
    messagingSenderId: '642120806959',
    projectId: 'sisoft-app',
    storageBucket: 'sisoft-app.appspot.com',
    androidClientId: '642120806959-uj96fnsg777b9kspr9ld1n8treq1jfl5.apps.googleusercontent.com',
    iosClientId: '642120806959-d0os212nc634q2jgkvnpk2ug7te1h6k0.apps.googleusercontent.com',
    iosBundleId: 'com.example.newapp',
  );

}