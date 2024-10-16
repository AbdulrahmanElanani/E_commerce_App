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
    apiKey: 'AIzaSyBN9_CMbw7W130EzF2S3JJMuZubSk6n76I',
    appId: '1:343771060989:web:73808e57cdfe61d9ab3c94',
    messagingSenderId: '343771060989',
    projectId: 'flower-app-45f3e',
    authDomain: 'flower-app-45f3e.firebaseapp.com',
    storageBucket: 'flower-app-45f3e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALNSMGUkTAhTXsBBB5OPpcddvK6heemoc',
    appId: '1:343771060989:android:08a4484f168982a3ab3c94',
    messagingSenderId: '343771060989',
    projectId: 'flower-app-45f3e',
    storageBucket: 'flower-app-45f3e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCr3vMkTXdWtfP9zagD-aq0Yj3uXfJU5A4',
    appId: '1:343771060989:ios:8d4f11ebb28dc64eab3c94',
    messagingSenderId: '343771060989',
    projectId: 'flower-app-45f3e',
    storageBucket: 'flower-app-45f3e.appspot.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCr3vMkTXdWtfP9zagD-aq0Yj3uXfJU5A4',
    appId: '1:343771060989:ios:8d4f11ebb28dc64eab3c94',
    messagingSenderId: '343771060989',
    projectId: 'flower-app-45f3e',
    storageBucket: 'flower-app-45f3e.appspot.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBN9_CMbw7W130EzF2S3JJMuZubSk6n76I',
    appId: '1:343771060989:web:2b34b90822f2d938ab3c94',
    messagingSenderId: '343771060989',
    projectId: 'flower-app-45f3e',
    authDomain: 'flower-app-45f3e.firebaseapp.com',
    storageBucket: 'flower-app-45f3e.appspot.com',
  );

}