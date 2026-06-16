import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDjRDpSV90cBJweaGej0KSAP91GFedZQE',
    appId: '1:276940957467:android:b8a671b4648a1ffcf895be',
    messagingSenderId: '276940957467',
    projectId: 'fitnessapp-7be00',
    storageBucket: 'fitnessapp-7be00.firebasestorage.app',
  );
}