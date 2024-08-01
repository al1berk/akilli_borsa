
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';



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
    apiKey: 'AIzaSyAJ-a7T2P835oG9T97Hl8U7igEeqP8fcgk',
    appId: '1:632797220051:web:35ece29df26f6fa6ba1826',
    messagingSenderId: '632797220051',
    projectId: 'akilli-borsa',
    authDomain: 'akilli-borsa.firebaseapp.com',
    storageBucket: 'akilli-borsa.appspot.com',
    measurementId: 'G-RSFYC678B6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA69dM_DD6_ofFf-aJ9IjV43rVOOuGOnRI',
    appId: '1:632797220051:android:02c5dd4f814889bcba1826',
    messagingSenderId: '632797220051',
    projectId: 'akilli-borsa',
    storageBucket: 'akilli-borsa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIQnnjzygXfGzzDy9qA1HxoloV483fbaU',
    appId: '1:632797220051:ios:3acc2dd6ae43a340ba1826',
    messagingSenderId: '632797220051',
    projectId: 'akilli-borsa',
    storageBucket: 'akilli-borsa.appspot.com',
    iosBundleId: 'com.simurgApp.akilliBorsa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIQnnjzygXfGzzDy9qA1HxoloV483fbaU',
    appId: '1:632797220051:ios:3acc2dd6ae43a340ba1826',
    messagingSenderId: '632797220051',
    projectId: 'akilli-borsa',
    storageBucket: 'akilli-borsa.appspot.com',
    iosBundleId: 'com.simurgApp.akilliBorsa',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAJ-a7T2P835oG9T97Hl8U7igEeqP8fcgk',
    appId: '1:632797220051:web:f6a7cbe8877a0dc1ba1826',
    messagingSenderId: '632797220051',
    projectId: 'akilli-borsa',
    authDomain: 'akilli-borsa.firebaseapp.com',
    storageBucket: 'akilli-borsa.appspot.com',
    measurementId: 'G-277YKWE95J',
  );

}