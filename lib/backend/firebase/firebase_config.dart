import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDdcIOobnEKcAIUQIt3Jo7vlS0PxSCB-Gw",
            authDomain: "papuguinho-c32df.firebaseapp.com",
            projectId: "papuguinho-c32df",
            storageBucket: "papuguinho-c32df.firebasestorage.app",
            messagingSenderId: "111295109266",
            appId: "1:111295109266:web:4017697e91494a0d2eae4b",
            measurementId: "G-2NR077QHMS"));
  } else {
    await Firebase.initializeApp();
  }
}
