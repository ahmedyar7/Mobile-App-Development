// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static final FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['WEB_API_KEY']!,
    appId: '1:473369101236:web:8075f78b92e0541fe9e8e1',
    messagingSenderId: '473369101236',
    projectId: 'crud-tutorial-32caf',
    authDomain: 'crud-tutorial-32caf.firebaseapp.com',
    storageBucket: 'crud-tutorial-32caf.firebasestorage.app',
    measurementId: 'G-GKFEBWRXWG',
  );

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['ANDROID_API_KEY']!,
    appId: '1:473369101236:android:0bef77a931e742ede9e8e1',
    messagingSenderId: '473369101236',
    projectId: 'crud-tutorial-32caf',
    storageBucket: 'crud-tutorial-32caf.firebasestorage.app',
  );

  static final FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['IOS_API_KEY']!,
    appId: '1:473369101236:ios:1ce6717a8c6aa603e9e8e1',
    messagingSenderId: '473369101236',
    projectId: 'crud-tutorial-32caf',
    storageBucket: 'crud-tutorial-32caf.firebasestorage.app',
    iosBundleId: 'com.example.madLsbs',
  );

  static final FirebaseOptions macos = FirebaseOptions(
    apiKey: dotenv.env['MACOS_API_KEY']!,
    appId: '1:473369101236:ios:1ce6717a8c6aa603e9e8e1',
    messagingSenderId: '473369101236',
    projectId: 'crud-tutorial-32caf',
    storageBucket: 'crud-tutorial-32caf.firebasestorage.app',
    iosBundleId: 'com.example.madLsbs',
  );

  static final FirebaseOptions windows = FirebaseOptions(
    apiKey: dotenv.env['WINDOWS_API_KEY']!,
    appId: '1:473369101236:web:dd7ba77c9964b3d0e9e8e1',
    messagingSenderId: '473369101236',
    projectId: 'crud-tutorial-32caf',
    authDomain: 'crud-tutorial-32caf.firebaseapp.com',
    storageBucket: 'crud-tutorial-32caf.firebasestorage.app',
    measurementId: 'G-BCVM0D5DJ1',
  );
}
