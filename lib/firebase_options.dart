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
    apiKey: 'AIzaSyBnCucncDMWAh74uzC4znPq1zgmmm3DCAQ',
    appId: '1:481443211004:web:8f07c09d19290e302c9979',
    messagingSenderId: '481443211004',
    projectId: 'aisect-42fe7',
    authDomain: 'aisect-42fe7.firebaseapp.com',
    storageBucket: 'aisect-42fe7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC894MSA7nJmJTxJXQ8bZBbS8SZmFP2qrU',
    appId: '1:709017882958:android:52680d8cfea1c32eb3ce1f',
    messagingSenderId: '',
    projectId: 'job-listing-61581',
    storageBucket: 'job-listing-61581.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbRAms80hbSIWTp5g49lDsfbREyY14x0E',
    appId: '1:481443211004:ios:5f15d81361e2a8872c9979',
    messagingSenderId: '481443211004',
    projectId: 'aisect-42fe7',
    storageBucket: 'aisect-42fe7.appspot.com',
    androidClientId: '481443211004-2vfqp8q1mmndmrsck94e7na7bpnnig8l.apps.googleusercontent.com',
    iosClientId: '481443211004-ld666q2l4048q5ca9mup5fdrqh1ire62.apps.googleusercontent.com',
    iosBundleId: 'com.example.aisectCustom',
  );
}
