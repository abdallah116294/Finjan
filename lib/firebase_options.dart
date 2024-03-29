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
    apiKey: 'AIzaSyAXX8wkLWnjcQpU_Fvbm-kzdM-ULrOy0sI',
    appId: '1:749568293308:web:d4ca25aa3762a5ae69d3b9',
    messagingSenderId: '749568293308',
    projectId: 'finjan-e1dbb',
    authDomain: 'finjan-e1dbb.firebaseapp.com',
    storageBucket: 'finjan-e1dbb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABpeYo8CEKf6DDy_C9uEkPg-uIXMYblzM',
    appId: '1:749568293308:android:b8ee2cbcf885122169d3b9',
    messagingSenderId: '749568293308',
    projectId: 'finjan-e1dbb',
    storageBucket: 'finjan-e1dbb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDz2dA_wZo_DEDAYCgoIZ7PYVhwUf3QJmk',
    appId: '1:749568293308:ios:0a0ca916c8ef584669d3b9',
    messagingSenderId: '749568293308',
    projectId: 'finjan-e1dbb',
    storageBucket: 'finjan-e1dbb.appspot.com',
    iosBundleId: 'com.example.finjan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDz2dA_wZo_DEDAYCgoIZ7PYVhwUf3QJmk',
    appId: '1:749568293308:ios:77cba9e64882b59169d3b9',
    messagingSenderId: '749568293308',
    projectId: 'finjan-e1dbb',
    storageBucket: 'finjan-e1dbb.appspot.com',
    iosBundleId: 'com.example.finjan.RunnerTests',
  );
}
