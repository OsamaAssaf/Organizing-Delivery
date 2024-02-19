// import 'package:flutter/foundation.dart';

// class FirebaseService {
//   FirebaseService._();
//
//   static final FirebaseService _instance = FirebaseService._();
//
//   factory FirebaseService() => _instance;
//
//   Future<void> init() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   }
//
//   void initCrashlytics() {
//     FlutterError.onError = (errorDetails) {
//       FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//     };
//     PlatformDispatcher.instance.onError = (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//       return true;
//     };
//   }
// }
