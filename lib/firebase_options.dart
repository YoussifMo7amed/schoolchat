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
    apiKey: 'AIzaSyDq3M1sjaaHpTP9VMirtaNrdiMqzj1pl24',
    appId: '1:766742564503:web:ea5a77e9c2c78199b663d2',
    messagingSenderId: '766742564503',
    projectId: 'chat-app-3b700',
    authDomain: 'chat-app-3b700.firebaseapp.com',
    storageBucket: 'chat-app-3b700.appspot.com',
    measurementId: 'G-2T27K0G6NF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBg6oQkhDEnSbLVlboPJuC7Q3UzCpUxnd0',
    appId: '1:766742564503:android:71dba4610ed1436cb663d2',
    messagingSenderId: '766742564503',
    projectId: 'chat-app-3b700',
    storageBucket: 'chat-app-3b700.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6CNqSDna1ueoiK6bXXBcJtjhRrYQ4kvE',
    appId: '1:766742564503:ios:096c76bc6d39d6a0b663d2',
    messagingSenderId: '766742564503',
    projectId: 'chat-app-3b700',
    storageBucket: 'chat-app-3b700.appspot.com',
    iosBundleId: 'com.example.schoolchat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6CNqSDna1ueoiK6bXXBcJtjhRrYQ4kvE',
    appId: '1:766742564503:ios:0bcf558e4e06e086b663d2',
    messagingSenderId: '766742564503',
    projectId: 'chat-app-3b700',
    storageBucket: 'chat-app-3b700.appspot.com',
    iosBundleId: 'com.example.schoolchat.RunnerTests',
  );
}