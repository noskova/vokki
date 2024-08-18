import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/env.dart';
import 'package:vokki/firebase_options.dart';
import 'package:vokki/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // try {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // } catch (e) {
  //   print('----------- Error initializing Firebase: $e');
  // }

  // Gemini.init(apiKey: Env.geminiKeyKey);

  runApp(
    const ProviderScope(
      child: VokkiApp(),
    ),
  );
}
