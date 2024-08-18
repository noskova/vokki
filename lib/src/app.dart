import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vokki/src/routing/app_router.dart';
import 'package:vokki/src/themes/vokki_themes.dart';

class VokkiApp extends ConsumerWidget {
  const VokkiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'Vokki',
      theme: const VokkiTheme().lightTheme,
    );
  }
}
