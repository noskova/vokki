import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/firebase_options.dart';
import 'package:vokki/src/app.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
